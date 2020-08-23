<%@ Page Title="" Language="C#" MasterPageFile="~/Elibrary.Master" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="ELibraryApplication.ViewBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        /*   thead=table head
         It enable SEARCH,PAGINATION,SELECTION OF DATA*/
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid" style="background-image: url(imgs/libraryy.jpg)">   
            <p>
            <br>
            <br>
        </p>
         <div class="container">
             <div class="row">
              <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <a href="home.aspx">
                        << Back to Home</a><span class="clearfix"></span>
                            <br />     
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                              <h4>Book Inventory List</h4>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString4 %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="ID"      ReadOnly="True" SortExpression="book_id" >
                                        
                                        <ControlStyle Font-Bold="True"></ControlStyle>
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                    <div class="container-fluid">
                                                         <div class="row">
                                                             <div class="col-lg-9">
                                                                 <div class="row">
                                                                     <div class="col-12">
                                                                         <asp:Label runat="server" Text='<%# Eval("book_name") %>' ID="bookName"  Font-Size="X-Large" Font-Bold="True"></asp:Label>
                                                                     </div>
                                                                 </div>
                                                                 <br />
                                                                   <div class="row">
                                                                     <div class="col-12">

                                                                         <strong>Author : </strong>
                                                                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                         &nbsp;| <strong>Category : </strong>
                                                                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("category") %>'></asp:Label>
                                                                         &nbsp;| <strong>Language : </strong>
                                                                         <asp:Label ID="Label3" runat="server" Text='<%# Eval("language") %>'></asp:Label>

                                                                     </div>
                                                                 </div>
                                                                 <br />
                                                                   <div class="row">
                                                                     <div class="col-12">

                                                                         <strong>Publisher : </strong>
                                                                         <asp:Label ID="Label4" runat="server" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                         &nbsp;| <strong>Publish-Date : </strong>
                                                                         <asp:Label ID="Label5" runat="server" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                         &nbsp;| <strong>Pages : </strong>
                                                                         <asp:Label ID="Label6" runat="server" Text='<%# Eval("no_of_pagess") %>'></asp:Label>
                                                                         &nbsp;| <strong>Edition : </strong>
                                                                         <asp:Label ID="Label7" runat="server" Text='<%# Eval("edition") %>'></asp:Label>
                                                                         st&nbsp;

                                                                     </div>
                                                                 </div>
                                                                 <br />
                                                                   <div class="row">
                                                                     <div class="col-12">

                                                                         <strong>Cost : </strong>
                                                                         <asp:Label ID="Label8" runat="server" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                         &nbsp;| <strong>Actual Stock : </strong>
                                                                         <asp:Label ID="Label9" runat="server" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                         &nbsp;| <strong>Current Stock : </strong>
                                                                         <asp:Label ID="Label10" runat="server" Text='<%# Eval("current_stock") %>'></asp:Label>

                                                                     </div>
                                                                 </div>
                                                                 <br />
                                                                   <div class="row">
                                                                     <div class="col-12">

                                                                         <strong>Description :</strong><asp:Label ID="Label11" runat="server" Text='<%# Eval("book_description") %>'></asp:Label>

                                                                     </div>
                                                                 </div>
                                                                 <br />
                                                             </div>
                                                               <div class="col-lg-1">
                                                                <hr />
                                                             </div>
                                                             <div class="col-lg-2">
                                                                 <asp:Image ID="Image1" class="img-fluid" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                             </div>
                                                         </div>
                                            </div>
                                            </ItemTemplate>
                                        
                                        </asp:TemplateField>
                                        
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <br />
                    </div>
                </div>
            </div>
                  </div>
         </div>   
                    
                <p>
            <br>
            <br>
        </p>
     </div>
         
</asp:Content>
