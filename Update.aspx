<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Disconnected.Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        td{
            text-align:center;
        }
        form{
            margin-top:50px;
        }
    </style>
</head>
<body>
    <form id="frmUpdate" runat="server">
        <div>
            <center>
                <table border="1" cellspacing="0" cellpadding="4">
                    <tr>
                        <th colspan="2">Employees Update</th>
                    </tr>
                    <tr>
                        <td>EMP_ID</td>
                        <td>
                            <asp:Label ID="lblId" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>EMP_Name</td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Text="Label"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>EMP_Salary</td>
                        <td>
                            <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Department</td>
                        <td>
                            <asp:DropDownList ID="drlDept" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td>
                            <asp:DropDownList ID="drlLoc" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Manager</td>
                        <td>
                            <asp:DropDownList ID="drlMan" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnEmpUpdate" runat="server" Text="Button" OnClick="btnEmpUpdate_Click" />
                        </td>
                    </tr>

                </table>
            </center>
        </div>
    </form>
</body>
</html>