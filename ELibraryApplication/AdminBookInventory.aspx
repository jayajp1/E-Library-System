<%@ Page Title="" Language="C#" MasterPageFile="~/Elibrary.Master" AutoEventWireup="true" CodeBehind="AdminBookInventory.aspx.cs"
    Inherits="ELibraryApplication.AdminBookInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        /*   thead=table head
         It enable SEARCH,PAGINATION,SELECTION OF DATA*/
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgView').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image: url(imgs/libraryy.jpg)" class="img-fluid">
        <p>
            <br>
            <br>
        </p>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                           <h4>Books Details</h4>
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                                    <center>
                                           <img style="width:100px" ID="imgView" src="imgs/books.png" />
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
                                   <asp:FileUpload ID="FileUpload1" onChange="readURL(this)" class="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Book ID</label>
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtBookId" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
                                    </div>
                            <!--        <span><small>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="color: red;" ControlToValidate="txtBookId" runat="server"
                                            ErrorMessage="Enter Book Id"></asp:RequiredFieldValidator> 
                                    </small></span>-->
                                </div>
                                <div class="col-md-8">
                                    <label>Book Name</label>
                                    <asp:TextBox CssClass="form-control" ID="txtBookName" runat="server" placeholder="Book Name">
                                        
                                    </asp:TextBox>
                         <!--           <span><small>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Style="color: red;" ControlToValidate="txtBookName" runat="server"
                                            ErrorMessage="Enter Publisher Id"></asp:RequiredFieldValidator>
                                    </small></span>-->

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>Language</label>
                                    <asp:DropDownList ID="DLLang" class="form-control" runat="server">
                                     
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Gujarari" Value="Gujarati" />
                                    </asp:DropDownList>
                            <!--        <span><small>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Style="color: red;" ControlToValidate="DLLang" runat="server"
                                            ErrorMessage="Enter Language"></asp:RequiredFieldValidator>
                                    </small></span>-->

                                    <label>Publisher name</label>
                                    <asp:DropDownList ID="DLPublisherName" class="form-control" runat="server">
                                
                                        <asp:ListItem Text="Jay" Value="Jay" />
                                        <asp:ListItem Text="Aj" Value="Aj" />
                                        <asp:ListItem Text="Deadshot" Value="Deadshot" />
                                    </asp:DropDownList>
                                 <!--   <span><small>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Style="color: red;" ControlToValidate="DLPublisherName" runat="server"
                                            ErrorMessage="Enter Publisher Name"></asp:RequiredFieldValidator>
                                    </small></span>-->
                                </div>

                                <div class="col-md-4">
                                    <label>Author Name</label>

                                    <asp:DropDownList ID="DLAuthorName" class="form-control" runat="server">
                                     
                                        <asp:ListItem Text="Jay" Value="Jay" />
                                        <asp:ListItem Text="Aj" Value="Aj" />
                                        <asp:ListItem Text="Deadshot" Value="Deadshot" />
                                    </asp:DropDownList>

                             <!--       <span><small>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Style="color: red;" ControlToValidate="DLAuthorName" runat="server"
                                            ErrorMessage="Enter Author Name"></asp:RequiredFieldValidator> 
                                    </small></span>-->

                                    <label>Publisher Date</label>
                                    <asp:TextBox class="form-control" ID="txtPdate" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>


                              <!--      <span><small>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Style="color: red;" ControlToValidate="txtPdate" runat="server"
                                            ErrorMessage="Enter Date"></asp:RequiredFieldValidator>
                                    </small></span>-->

                                </div>
                            <div class="col-md-4">
                                <label>Category</label>
                                <asp:ListBox ID="DLCategory" class="form-control" SelectionMode="Multiple" runat="server" Rows="5">
                                    <asp:ListItem Text="Crime" Value="crime"></asp:ListItem>
                                    <asp:ListItem Text="Suspence" Value="Suspence"></asp:ListItem>
                                    <asp:ListItem Text="Drama" Value="Drama"></asp:ListItem>
                                    <asp:ListItem Text="Motivational" Value="crime"></asp:ListItem>
                                    <asp:ListItem Text="Healthy" Value="Suspence"></asp:ListItem>
                                    <asp:ListItem Text="Drama" Value="Drama"></asp:ListItem>
                                    <asp:ListItem Text="Crime" Value="crime"></asp:ListItem>
                                    <asp:ListItem Text="Suspence" Value="Suspence"></asp:ListItem>
                                    <asp:ListItem Text="Drama" Value="Drama"></asp:ListItem>
                                </asp:ListBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Edition</label>
                                <asp:TextBox class="form-control" ID="txtEdition" MaxLength="4" runat="server" placeholder="Edition"></asp:TextBox>
                      <!--          <span><small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Style="color: red;" ControlToValidate="txtEdition" runat="server"
                                        ErrorMessage="Enter Edition"></asp:RequiredFieldValidator>
                                </small></span>-->
                            </div>
                            <div class="col-md-4">
                                <label>Books Cost(Per unit)</label>
                                <asp:TextBox CssClass="form-control" ID="txtBookCost" runat="server" placeholder="Cost"></asp:TextBox>
                   <!--             <span><small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Style="color: red;" ControlToValidate="txtBookCost" runat="server"
                                        ErrorMessage="Enter Book Cost"></asp:RequiredFieldValidator>
                                </small></span>-->
                            </div>
                            <div class="col-md-4">
                                <label>Pages</label>
                                <asp:TextBox CssClass="form-control" ID="txtPages" runat="server" placeholder="Pages" MaxLength="5"></asp:TextBox>
                           <!--     <span><small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Style="color: red;" ControlToValidate="txtPages" runat="server"
                                        ErrorMessage="Enter Book Pages"></asp:RequiredFieldValidator>
                                </small></span>-->
                            </div>

                        </div>
                         <div class="row">
                                      <div class="col-md-4">
                                <label>Acutual Stock</label>
                                    <asp:TextBox CssClass="form-control" ID="txtAStock" runat="server" placeholder="15"
                                        ></asp:TextBox> 
                          <!--      <span><small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" Style="color: red;" ControlToValidate="txtAStock" runat="server"
                                        ErrorMessage="Enter Actual Stock"></asp:RequiredFieldValidator>
                                </small></span>-->
                            </div>
                            <div class="col-md-4">
                                <label>Current Stock</label>
                                    <asp:TextBox CssClass="form-control" ID="txtCStock" runat="server" Readonly="true" placeholder="13"
                                        ></asp:TextBox>     
                            </div>
                      
                               <div class="col-md-4">
                                <label>Issued Books</label>
                                    <asp:TextBox CssClass="form-control" ID="txtIssuedBooks" runat="server" ReadOnly="true" placeholder="2"
                                        ></asp:TextBox> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Book Description</label>
                             
                                    <asp:TextBox CssClass="form-control" ID="txtDes" runat="server" placeholder="Book Description"
                                        TextMode="MultiLine"></asp:TextBox>

                              
                             <!--   <span><small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Style="color: red;" ControlToValidate="txtDes" runat="server"
                                        ErrorMessage="Enter Book Description"></asp:RequiredFieldValidator>
                                </small></span>-->
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <br>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Button ID="txtAddbook" class="btn btn-md btn-block btn-success m-1" runat="server" Text="Add" OnClick="txtAddbook_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="txtUpdatebook" class="btn btn-md btn-block btn-primary m-1" runat="server" Text="Update" OnClick="txtUpdatebook_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="txtDeletebook" class="btn btn-md btn-block btn-danger m-1" runat="server" Text="Delete" OnClick="txtDeletebook_Click" />
                            </div>
                        </div>


                    </div>
                </div>

                <br>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
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
                                <asp:GridView class="table table-striped table-responsive-xl table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
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
