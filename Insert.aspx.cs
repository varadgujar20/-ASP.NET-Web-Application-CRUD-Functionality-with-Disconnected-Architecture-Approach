using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Disconnected
{
    public partial class Insert : System.Web.UI.Page
    {
        public DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            ds = (DataSet)Session["ds"];
            if (!IsPostBack)
            {
                drlDept.DataSource = ds.Tables["Dept"];
                drlDept.DataValueField = "dept_id";
                drlDept.DataTextField = "dept_desc";
                drlDept.DataBind();

                drlLoc.DataSource = ds.Tables["Locn"];
                drlLoc.DataValueField = "locn_id";
                drlLoc.DataTextField = "locn_desc";
                drlLoc.DataBind();

                drlMan.DataSource = ds.Tables["Emp"];
                drlMan.DataValueField = "emp_id";
                drlMan.DataTextField = "emp_name";
                drlMan.DataBind();
            }

        }

        protected void btnInsertEmployees_Click(object sender, EventArgs e)
        {
            ds = (DataSet)Session["ds"];
            SqlDataAdapter adapter = (SqlDataAdapter)Session["adapterEmp"];

            DataRow newRow = ds.Tables["Emp"].NewRow();

            newRow["emp_id"] = txtId.Text;
            newRow["emp_name"] = txtName.Text;
            newRow["salary"] = txtSalary.Text;
            newRow["dept_id"] = drlDept.Text;
            newRow["locn_id"] = drlLoc.Text;
            newRow["rep_to"] = drlMan.Text;

            ds.Tables["Emp"].Rows.Add(newRow);
            adapter.Update(ds, "Emp");
            Response.Redirect("Default.aspx");

        }


    }
}
