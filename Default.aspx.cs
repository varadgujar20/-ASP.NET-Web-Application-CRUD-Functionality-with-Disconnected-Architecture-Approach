using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Disconnected
{
    public partial class Default : System.Web.UI.Page
    {
        public DataSet ds;
        public int DeptPos, LocPos, ManPos;
        protected void Page_Load(object sender, EventArgs e)
        {
            ViewState["delete_id"] = Request.QueryString["delPos"];

            string strconn = "Data Source=Varad; Database=master; user id=sa; password=123"; ;
            Application["connstr"] = strconn;
            SqlConnection conn = new SqlConnection(Application["connstr"].ToString());
            conn.Open();
            //Response.Write(conn.State);
            string strEmp = "select *from emp_mast";
            string strLocn = "select * from locn_mast";
            string strDept = "select * from dept_mast";

            ds = new DataSet();
            SqlDataAdapter adapterEmp = new SqlDataAdapter();
            SqlDataAdapter adapterLocn = new SqlDataAdapter();
            SqlDataAdapter adapterDept = new SqlDataAdapter();

            SqlCommandBuilder builderEmp = new SqlCommandBuilder();
            builderEmp.DataAdapter = adapterEmp;
            SqlCommandBuilder builderLocn = new SqlCommandBuilder(adapterLocn);
            SqlCommandBuilder builderDept = new SqlCommandBuilder(adapterDept);

            {

                adapterEmp.SelectCommand = new SqlCommand(strEmp, conn);
                adapterEmp.Fill(ds, "Emp");

                adapterLocn.SelectCommand = new SqlCommand(strLocn, conn);
                adapterLocn.Fill(ds, "Locn");

                adapterDept.SelectCommand = new SqlCommand(strDept, conn);
                adapterDept.Fill(ds, "Dept");

                Session["ds"] = ds;
                Session["adapterEmp"] = adapterEmp;
            }
            if (ViewState["delete_id"] != null)
            {
                int Pos = Convert.ToInt32(ViewState["delete_id"]);
                ds.Tables["Emp"].Rows[Pos].Delete();
                adapterEmp.Update(ds, "Emp");
                Response.Redirect("Default.aspx");
            }


        }


    }
}
