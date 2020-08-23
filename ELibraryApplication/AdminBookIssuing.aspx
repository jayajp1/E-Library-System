<%@ Page Title="" Language="C#" MasterPageFile="~/Elibrary.Master" AutoEventWireup="true" CodeBehind="AdminBookIssuing.aspx.cs" Inherits="ELibraryApplication.AdminBookIssuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                           <h4>Book Issuing</h4>
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                           <img style="width:100px" src="imgs/books.png" />
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Member ID</label>
                                    <asp:TextBox CssClass="form-control" ID="txtMemberid" runat="server" placeholder="Member ID" MaxLength="4"></asp:TextBox>
                                    <span><small>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="color: red;" ControlToValidate="txtMemberid" runat="server" ErrorMessage="Enter Memebr Id"></asp:RequiredFieldValidator>
                                    </small></span>
                                </div>
                                <div class="col-md-6">
                                    <label>Book ID</label>
                                    <div class="input-group">
                                         <asp:TextBox CssClass="form-control" ID="txtBookId" runat="server" placeholder="Book ID" MaxLength="4"></asp:TextBox>
                                          <asp:Button class="btn btn-dark" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
                                      </div>  
                                    <span><small>
                                      
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Style="color: red;" ControlToValidate="txtBookId" runat="server"
                                            ErrorMessage="Enter Book Id"></asp:RequiredFieldValidator>
                                    </small></span>
                                   
                                   
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Member Name</label>
                                    <asp:TextBox class="form-control" ID="txtMemberName"  ReadOnly="true" runat="server" placeholder="Member Name"></asp:TextBox>
                                  
                                </div>
                                <div class="col-md-6">
                                    <label>Book Name</label>
                                    <asp:TextBox CssClass="form-control" ID="txtBookName" runat="server" ReadOnly="true" placeholder="Book Name" ></asp:TextBox>
                                   
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Start Date</label>
                                    <asp:TextBox class="form-control" ID="txtStartDate" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                                         <!--<span><small>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Style="color: red;" ControlToValidate="txtStartDate" color="red" runat="server"
                                            ErrorMessage="Enter Start Date"></asp:RequiredFieldValidator>
                                    </small></span>     -->
                                </div>
                                <div class="col-md-6">
                                    <label>End Date</label>
                                    <asp:TextBox class="form-control" ID="txtEndDate" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                                 <!--  <span><small>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Style="color: red;" ControlToValidate="txtEndDate" runat="server"
                                        ErrorMessage="Enter End Date"></asp:RequiredFieldValidator>                           
                                         </small></span>      --></div>
                            </div>
                               <div class="row">
                                <br />
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <asp:Button ID="isuueButton" class="btn btn-md btn-block btn-primary" runat="server" Text="Issue" OnClick="isuueButton_Click" />
                                </div>
                                <div class="col-6">
                                    <asp:Button ID="returnButton" class="btn btn-md btn-block btn-success" runat="server" Text="Return" OnClick="returnButton_Click" />
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
                           <h4>Issue Books List</h4>
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString5 %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                                    <asp:GridView class="table table-striped table-responsive-xl table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                        <Columns>
                                            <asp:BoundField DataField="member_id" HeaderText="Member_Id" SortExpression="member_id" />
                                            <asp:BoundField DataField="member_name" HeaderText="Member_Name" SortExpression="member_name" />
                                            <asp:BoundField DataField="book_id" HeaderText="Book_Id" SortExpression="book_id" />
                                            <asp:BoundField DataField="book_name" HeaderText="Book_Name" SortExpression="book_name" />
                                            <asp:BoundField DataField="issue_date" HeaderText="Issue_Date" SortExpression="issue_date" />
                                            <asp:BoundField DataField="due_date" HeaderText="Due_Date" SortExpression="due_date" />
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
