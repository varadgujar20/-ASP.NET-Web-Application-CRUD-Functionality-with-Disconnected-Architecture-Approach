using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Disconnected
{
    public partial class Update : System.Web.UI.Page
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

                ViewState["EmpPos"] = Request.QueryString["upID"];
                int EmpPos = Convert.ToInt32(Request.QueryString["upID"]);
                int DeptPos = Convert.ToInt32(Request.QueryString["dPos"]);
                int LocPos = Convert.ToInt32(Request.QueryString["lPos"]);
                int ManPos = Convert.ToInt32(Request.QueryString["mPos"]);

                lblId.Text = ds.Tables["Emp"].Rows[EmpPos]["emp_id"].ToString();
                txtName.Text = ds.Tables["Emp"].Rows[EmpPos]["emp_name"].ToString();
                txtSalary.Text = ds.Tables["Emp"].Rows[EmpPos]["salary"].ToString();

                drlDept.SelectedValue = ds.Tables["Dept"].Rows[DeptPos]["dept_id"].ToString();
                drlLoc.SelectedValue = ds.Tables["Locn"].Rows[LocPos]["locn_id"].ToString();
                drlMan.SelectedValue = ds.Tables["Emp"].Rows[ManPos]["emp_id"].ToString();
            }

        }

        protected void btnEmpUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                ds = (DataSet)Session["ds"];
                int EmpPos = Convert.ToInt32(ViewState["EmpPos"]);
                SqlDataAdapter adapter = (SqlDataAdapter)Session["adapterEmp"];
                ds.Tables["Emp"].Rows[EmpPos]["emp_name"] = txtName.Text;
                ds.Tables["Emp"].Rows[EmpPos]["salary"] = Convert.ToDecimal(txtSalary.Text);
                Response.Write(ds.Tables["Emp"].Rows[EmpPos]["salary"]);
                ds.Tables["Emp"].Rows[EmpPos]["dept_id"] = drlDept.Text;
                ds.Tables["Emp"].Rows[EmpPos]["locn_id"] = drlLoc.Text;
                ds.Tables["Emp"].Rows[EmpPos]["rep_to"] = drlMan.Text;

                adapter.Update(ds, "Emp");
                Response.Redirect("Default.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.Message);
            }


        }
    }
}
