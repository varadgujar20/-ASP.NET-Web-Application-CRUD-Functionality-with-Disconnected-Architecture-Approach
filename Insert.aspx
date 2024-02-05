<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="Disconnected.Insert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        td{
            text-align:center;
        }
        form{
            margin-top:55px;
        }
    </style>
</head>
<body>
    <form id="frminsert" runat="server">
        <div>
            <center>
                <table border="1">
                    <tr>
                        <th colspan="2">Add Employees</th>
                    </tr>
                    <tr>
                        <td>EMP_ID</td>
                        <td>
                            <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>EMP_NAME</td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>EMP_SALARY</td>
                        <td>
                            <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>DEPARTMENT</td>
                        <td>
                            <asp:DropDownList ID="drlDept" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>LOCATION</td>
                        <td>
                            <asp:DropDownList ID="drlLoc" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>MANAGER</td>
                        <td>
                            <asp:DropDownList ID="drlMan" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnInsertEmployees" runat="server" Text="INSERT" OnClick="btnInsertEmployees_Click" />
                        </td>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>
