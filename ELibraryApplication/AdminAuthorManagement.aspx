<%@ Page Title="" Language="C#" MasterPageFile="~/Elibrary.Master" AutoEventWireup="true" CodeBehind="AdminAuthorManagement.aspx.cs" Inherits="ELibraryApplication.AdminAuthorManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            width: 100%;
            -ms-flex-preferred-size: 0;
            flex-basis: 0;
            -ms-flex-positive: 1;
            flex-grow: 1;
            max-width: 100%;
            left: 0px;
            top: -726px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
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
                           <h4>Author Details</h4>
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                           <img style="width:100px" src="imgs/writer.png" />
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
                                    <label>Author ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox class="form-control" ID="txtAuthorId" runat="server" placeholder="ID" MaxLength="4"></asp:TextBox>
                                           <asp:Button class="btn btn-primary" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click"/>
                                          <span><small>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="color: red;" 
                                                    ControlToValidate="txtAuthorId" runat="server"
                                                    ErrorMessage="Enter Author Id"></asp:RequiredFieldValidator>
                                            </small></span>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <label>Author Name</label>

                                    <asp:TextBox CssClass="form-control" ID="txtAuthorName" runat="server" placeholder="Author Name"></asp:TextBox>
                                 <!--   <span><small>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Style="color: red;" ControlToValidate="txtAuthorName" runat="server"
                                            ErrorMessage="Enter Author NAme"></asp:RequiredFieldValidator>
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
                                <div class="auto-style1">
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
                                <div class="auto-style1">
                                    <br>
                                </div>
                            </div>
                            <a href="Home.aspx"> <<< Back to Home</a>
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
                           <h4>Author List</h4>
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-responsive-xl table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                                            <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
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
