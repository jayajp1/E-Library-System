<%@ Page Title="" Language="C#" MasterPageFile="~/Elibrary.Master" AutoEventWireup="true" CodeBehind="AdminPublisherManagement.aspx.cs" Inherits="ELibraryApplication.AdminPublisherManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        
            /*   thead=table head
              It enable SEARCH,PAGINATION,SELECTION OF DATA*/
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image: url(imgs/libraryy.jpg)" class="img-fluid">
        <p>
            <br>
            <br>
        </p>
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                           <h4>Publisher Details</h4>
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                                      <img style="width:100px" src="imgs/publisher.png" />
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Publisher ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                             <asp:TextBox CssClass="form-control" ID="txtPubliisherId" runat="server" placeholder="ID"></asp:TextBox>
                                    <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    <span><small>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="color: red;" ControlToValidate="txtPubliisherId" runat="server"
                                            ErrorMessage="Enter Publisher Id"></asp:RequiredFieldValidator>
                                    </small></span>
                                        </div>
                                    </div>
                                   


                                </div>
                                <div class="col-md-8">
                                    <label>Publisher Name</label>
                                    <asp:TextBox CssClass="form-control" ID="txtPublisherName" runat="server" placeholder="Publisher Name"></asp:TextBox>
                                 <!--   <span><small>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Style="color: red;" ControlToValidate="txtPublisherName" runat="server"
                                            ErrorMessage="Enter Publisher Id"></asp:RequiredFieldValidator>
                                    </small></span>-->

                                </div>
                            </div>
                          
                            <div class="row">
                                <div class="col-4">
                                    <asp:Button ID="btnAdd" class="btn btn-md btn-block btn-success" runat="server" Text="Add" OnClick="btnAdd_Click" />
                                </div>
                                <div class="col-4">
                                    <asp:Button ID="btnUpdate" class="btn btn-md btn-block btn-warning" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                </div>
                                <div class="col-4">
                                    <asp:Button ID="btnDelete" class="btn btn-md btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                                </div>
                            </div>
                              <div class="row">
                                <div class="col">
                                    <br>
                                </div>
                            </div>
                               <span class="container text-center">
                                <asp:Label class="alert alert-warning alert-dismissible fade show" role="alert" Text="L" 
                                    runat="server" ID="Success_msg" Visible="false">
                                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                </asp:Label>
                            </span>
                              <div class="row">
                                <div class="col">
                                    <br />
                            <a href="Home.aspx"><<< Back to Home</a>
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
                           <h4>Publisher List</h4>
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
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString2 %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                                    <asp:GridView class="table table-striped table-responsive-xl table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource2"></asp:GridView>
                                </div>
                            </div>
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
