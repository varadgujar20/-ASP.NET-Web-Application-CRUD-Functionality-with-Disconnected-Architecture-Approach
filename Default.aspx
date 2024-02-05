<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Disconnected.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        td{
            text-align:center;
        }
        form{
            margin-top:100px;
        }
    </style>
</head>
<body>
    <form id="frmEmployees" runat="server">
        <div>
            <center>
                <table border="1" cellspacing="0" cellpadding="4">
                    <tr>
                        <th colspan="8"> Employees Tables</th>
                    </tr>
                     <tr>
                         
                          <th colspan="8"><a href="Insert.aspx?add=<%=ds.Tables["Emp"].Rows.Count %>">Add Employee</a></th>
                         </tr>
                    <tr>
                        <th>Emp_ID</th>
                        <th>Name</th>
                        <th>Salary</th>
                         <th>Department</th>
                         <th>Location</th>
                        <th>manager</th>
                        <th colspan="2">Action</th>  
                    </tr>
                    <%for (int EmpCount = 0; EmpCount < ds.Tables["Emp"].Rows.Count; EmpCount++)
                        { %>
                    <tr>
                        <td><%=ds.Tables["Emp"].Rows[EmpCount]["emp_id"] %></td>
                        <td><%=ds.Tables["Emp"].Rows[EmpCount]["emp_name"] %></td>
                        <td><%=ds.Tables["Emp"].Rows[EmpCount]["salary"] %></td>
                        <%for (int DeptCount = 0; DeptCount < ds.Tables["Dept"].Rows.Count; DeptCount++)
                            {
                                if (ds.Tables["Emp"].Rows[EmpCount]["dept_id"].ToString() == ds.Tables["Dept"].Rows[DeptCount]["dept_id"].ToString())
                                {  %>
                        <td><%=ds.Tables["Dept"].Rows[DeptCount]["dept_desc"] %></td>

                        <% DeptPos = DeptCount; break; }
                            } %>

                        <%for (int LocnCount = 0; LocnCount < ds.Tables["Locn"].Rows.Count; LocnCount++)
                            {
                                if (ds.Tables["Emp"].Rows[EmpCount]["locn_id"].ToString() == ds.Tables["Locn"].Rows[LocnCount]["locn_id"].ToString())
                                { %>
                        <td><%=ds.Tables["Locn"].Rows[LocnCount]["locn_desc"] %></td>
                        <% LocPos = LocnCount; break; }

                            }%>
                        <%for (int ManCount = 0; ManCount < ds.Tables["Emp"].Rows.Count; ManCount++)
                            {
                                if (ds.Tables["Emp"].Rows[ManCount]["emp_id"].ToString() == ds.Tables["Emp"].Rows[EmpCount]["rep_to"].ToString())
                                { %>
                        <td><%=ds.Tables["Emp"].Rows[ManCount]["emp_name"]%></td>
                        <%ManPos = ManCount; break; }

                            } %>
                        <td><a href="Update.aspx?upID=<%=EmpCount %>&dPos=<%=DeptPos %>&lPos=<%=LocPos %>&mPos=<%=ManPos %>&empID=<%=ds.Tables["Emp"].Rows[EmpCount]["emp_id"] %>">Update</a></td>
                       <td> <a href="Default.aspx?delPos=<%=EmpCount %>&">Delete</a></td>               
                    </tr>
                    <%} %>
                    

                </table>
            </center>
        </div>
    </form>
</body>
</html>