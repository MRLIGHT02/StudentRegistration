<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForeignStudent.aspx.cs" Inherits="StudentRegistrationform.ForeignStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Full Name</td>
                    <td>
                        <asp:TextBox ID="stdname" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Father's Name</td>
                    <td>
                        <asp:TextBox ID="fathername" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Gender</td>
                    <td>
                        <asp:RadioButtonList runat="server" ID="stdgender" RepeatDirection="Horizontal"></asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Marital Status</td>
                    <td>
                        <asp:RadioButtonList ID="maritalstatus" runat="server" RepeatDirection="Horizontal">
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Nationality</td>
                    <td>
                        <asp:DropDownList ID="nationality" AutoPostBack="true" runat="server" OnSelectedIndexChanged="nationality_SelectedIndexChanged">
                        </asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td>State</td>
                    <td>
                        <asp:DropDownList ID="stdstate" runat="server" OnSelectedIndexChanged="stdstate_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td>City</td>
                    <td>
                        <asp:DropDownList ID="stdcity" runat="server">
                        </asp:DropDownList>

                    </td>
                </tr>

                <tr>
                    <td>Passport Number</td>
                    <td>
                        <asp:TextBox ID="passportnumber" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" /></td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:GridView ID="gvdata" runat="server" AutoGenerateColumns="false" OnRowCommand="gvdata_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="Student Id">
                                    <ItemTemplate>
                                        <%#Eval("studentid") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Student Name">
                                    <ItemTemplate>
                                        <%#Eval("studentname") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Father Name">
                                    <ItemTemplate>
                                        <%#Eval("fathename") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Student Gender">
                                    <ItemTemplate>
                                        <%#Eval("gendername") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Maritial Status">
                                    <ItemTemplate>
                                        <%#Eval("maristatus") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Student Country">
                                    <ItemTemplate>
                                        <%#Eval("countryname") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Student State">
                                    <ItemTemplate>
                                        <%#Eval("statename") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Student City">
                                    <ItemTemplate>
                                        <%#Eval("cityname") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PassPort Id">
                                    <ItemTemplate>
                                        <%#Eval("stdpass") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="delbtn" Text="Delete" ForeColor="Red" runat="server" CommandName="deltabtn" CommandArgument=' <%# Eval("studentid") %>'></asp:LinkButton>
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
