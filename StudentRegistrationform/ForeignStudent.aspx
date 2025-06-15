<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForeignStudent.aspx.cs" Inherits="StudentRegistrationform.ForeignStudent" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Foreign Student Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        form {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        table {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            border-collapse: separate;
            border-spacing: 8px;
            max-width: 600px;
            width: 100%;
            font-size: 14px;
        }

        td {
            padding: 4px;
            vertical-align: middle;
        }

        td:first-child {
            font-weight: 500;
            text-align: right;
            color: #333;
            width: 35%;
        }

        input[type="text"], select, textarea, .aspNet-TextBox {
            width: 100%;
            padding: 5px;
            font-size: 13px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .aspNet-Button {
            background-color: #007BFF;
            color: white;
            padding: 6px 12px;
            font-size: 13px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .aspNet-Button:hover {
            background-color: #0056b3;
        }

        .message-label {
            color: red;
            font-size: 13px;
            font-weight: bold;
            text-align: center;
        }

        .gridview {
            margin-top: 20px;
            font-size: 13px;
        }

        .gridview th, .gridview td {
            padding: 6px;
            border: 1px solid #ccc;
        }

        .gridview th {
            background-color: #007BFF;
            color: white;
        }

        .gridview td {
            background-color: #f9f9f9;
            text-align: center;
        }

        .delete-button {
            color: red;
            font-size: 13px;
            font-weight: bold;
        }

        .edit-button {
            color: blue;
            font-size: 13px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Full Name</td>
                    <td><asp:TextBox ID="stdname" runat="server" CssClass="aspNet-TextBox" /></td>
                </tr>
                <tr>
                    <td>Father's Name</td>
                    <td><asp:TextBox ID="fathername" runat="server" CssClass="aspNet-TextBox" /></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><asp:RadioButtonList ID="stdgender" runat="server" RepeatDirection="Horizontal" /></td>
                </tr>
                <tr>
                    <td>Marital Status</td>
                    <td><asp:RadioButtonList ID="maritalstatus" runat="server" RepeatDirection="Horizontal" /></td>
                </tr>
                <tr>
                    <td>Nationality</td>
                    <td><asp:DropDownList ID="nationality" runat="server" AutoPostBack="true" OnSelectedIndexChanged="nationality_SelectedIndexChanged" /></td>
                </tr>
                <tr>
                    <td>State</td>
                    <td><asp:DropDownList ID="stdstate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="stdstate_SelectedIndexChanged" /></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><asp:DropDownList ID="stdcity" runat="server" /></td>
                </tr>
                <tr>
                    <td>Passport Number</td>
                    <td><asp:TextBox ID="passportnumber" runat="server" CssClass="aspNet-TextBox" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnsubmit" CssClass="aspNet-Button" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMessage" runat="server" CssClass="message-label" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvdata" runat="server" AutoGenerateColumns="false" CssClass="gridview" OnRowCommand="gvdata_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="Student Id"><ItemTemplate><%# Eval("studentid") %></ItemTemplate></asp:TemplateField>
                                <asp:TemplateField HeaderText="Student Name"><ItemTemplate><%# Eval("studentname") %></ItemTemplate></asp:TemplateField>
                                <asp:TemplateField HeaderText="Father Name"><ItemTemplate><%# Eval("fathename") %></ItemTemplate></asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender"><ItemTemplate><%# Eval("gendername") %></ItemTemplate></asp:TemplateField>
                                <asp:TemplateField HeaderText="Marital Status"><ItemTemplate><%# Eval("maristatus") %></ItemTemplate></asp:TemplateField>
                                <asp:TemplateField HeaderText="Country"><ItemTemplate><%# Eval("countryname") %></ItemTemplate></asp:TemplateField>
                                <asp:TemplateField HeaderText="State"><ItemTemplate><%# Eval("statename") %></ItemTemplate></asp:TemplateField>
                                <asp:TemplateField HeaderText="City"><ItemTemplate><%# Eval("cityname") %></ItemTemplate></asp:TemplateField>
                                <asp:TemplateField HeaderText="Passport"><ItemTemplate><%# Eval("stdpass") %></ItemTemplate></asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="delbtn" runat="server" Text="Delete" CssClass="delete-button" CommandName="deltabtn" CommandArgument='<%# Eval("studentid") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="edtbtn" runat="server" Text="Edit" CssClass="edit-button" CommandName="editbtn" CommandArgument='<%# Eval("studentid") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
