﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="AMDTestPage.aspx.vb" Inherits="AMDTestPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:Table runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table runat="server" Width="100%" SkinID="White">
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Label ID="lblSelectTestPage" runat="server" Text="Select Test" Font-Size="30pt" SkinID="White" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center">
                            <asp:Table runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtSelectTestFilter" />
                                    </asp:TableCell><asp:TableCell>
                                        <asp:Button runat="server" ID="btnSelectTestFilter" Text="Fliter" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:GridView ID="grvTest" runat="server"
                                AllowPaging="True"
                                AllowSorting="True"
                                AutoGenerateColumns="False"
                                AutoGenerateDeleteButton="False"
                                AutoGenerateEditButton="False"
                                DataKeyNames="TestID"
                                DataSourceID="sdsTest"
                                PageSize="25"
                                SkinID="gridViewSkin"
                                ShowFooter="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Test ID" SortExpression="TestID">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TestID")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Class" SortExpression="Class">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Class")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Test" SortExpression="Test">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Test")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Description")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type" SortExpression="Type">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Type")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button ID="btnTakeTest" runat="server" CausesValidation="True"
                                                CommandName="TakeTest" Text="TakeTest" Width="50pt" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsTest" runat="server"
                                ConnectionString="<%$ ConnectionStrings:MapQuizConnectionString %>"
                                SelectCommand="SELECT Test.TestID, Test.ClassID, Test.Test, Test.Description, Test.Type, Class.Class FROM [Test], [Class] WHERE Test.ClassID = Class.ClassID"
                                UpdateCommand="UPDATE [Test] Set [ClassID]=@ClassID, [Test]=@Test, [Description]=@Description, [Type]=@Type Where [TestID]=@TestID"
                                DeleteCommand="DELETE FROM [Test] Where [TestID]=@TestID"
                                InsertCommand="INSERT INTO [Test] ([ClassID], [Test], [Description], [Type]) VALUES (@ClassID, @Test, @Description, @Type)"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsClassID" runat="server"
                                ConnectionString="<%$ ConnectionStrings:MapQuizConnectionString %>"
                                SelectCommand="SELECT ClassID, Class FROM [Class]"></asp:SqlDataSource>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>


</asp:Content>
