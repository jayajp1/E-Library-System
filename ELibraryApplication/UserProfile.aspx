<%@ Page Title="" Language="C#" MasterPageFile="~/Elibrary.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="ELibraryApplication.UserProfile" %>

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
                                <div class="col  text-center">
                                    <img src="imgs/generaluser.png" style="width: 110px" class="img-fluid">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col  text-center">
                                    <h5>Your Profile</h5>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-center">
                                    Account Status- &nbsp;<asp:Label id="Label1" runat="server" class="badge badge-success">Active</asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col  text-center">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>First Name</label>
                                    <asp:TextBox ID="txtFname" placeholder="First Name" runat="server" class="form-control"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtFname"
                                                ErrorMessage="Enter UserName"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                                <div class="col-md-6">
                                    <label>Date Of Birth</label>
                                    <asp:TextBox ID="txtDOB" placeholder="Date Of Birth" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtDOB"
                                                ErrorMessage="Enter Birth Date"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                            </div>
                            <div class="row">
                              <div class="col-md-6">
                                    <label>Mobile No</label>
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">+91</div>
                                        <asp:TextBox ID="txtMobileNo" placeholder="Mobile Number" runat="server" class="form-control" TextMode="Phone"> 
                                        </asp:TextBox>
                                    </div>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtMobileNo"
                                                ErrorMessage="Enter Mobile Number"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                                <div class="col-md-6">
                                    <label>Email</label>
                                    <asp:TextBox ID="txtEmail" placeholder="youremailid@gmail.com" runat="server" class="form-control" TextMode="Email"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtEmail"
                                                ErrorMessage="Enter Email"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <asp:TextBox ID="txtState" placeholder="State" runat="server" class="form-control"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtState"
                                                ErrorMessage="Enter State"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                                <div class="col-md-4">
                                    <label>City</label>
                                    <asp:TextBox ID="txtCity" placeholder="City" runat="server" class="form-control"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtCity"
                                                ErrorMessage="Enter City"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                                <div class="col-md-4">
                                    <label>PinCode</label>
                                    <asp:TextBox ID="txtPinCode" placeholder="PinCode" runat="server" class="form-control" MaxLength="6"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtPinCode"
                                                ErrorMessage="Enter Pincode"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Address</label>
                                    <asp:TextBox ID="txtAddress" placeholder="Address" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtAddress"
                                                ErrorMessage="Enter Address"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <label><span class="badge badge-primary">Login Credintails</span></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>User Name</label>
                                    <asp:TextBox ID="txtUname" placeholder="User Name" runat="server"  ReadOnly="true" class="form-control"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtUname"
                                                ErrorMessage="Enter UserName"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                                <div class="col-md-4">
                                    <label>Old Password</label>
                                    <asp:TextBox ID="txtOPassword" placeholder="Old Password" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtOPassword"
                                                ErrorMessage="Enter Old Passsword"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                                <div class="col-md-4">
                                    <label>New Password</label>
                                    <asp:TextBox ID="txtNPassword" placeholder="New Password" runat="server" class="form-control"></asp:TextBox>
                               
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6 mx-auto text-center">

                                    <asp:Button ID="updateUserinfo" runat="server" Text="Update" class="btn btn-primary btn-block btn-md" OnClick="updateUserinfo_Click" />
                                </div>
                            </div>
                            <br>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col  text-center">
                                    <img src="imgs/books.png" style="width: 110px" class="img-fluid">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col  text-center">
                                    <h5>Your Issued Books</h5>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col  text-center">
                                    <label>
                                        <span class="badge badge-info">Info about books due date</span></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col  text-center">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div>
                                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString5 %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                                        <asp:GridView ID="GridView1" runat="server" class="table table-responsive-xl table-striped table-bordered" AutoGenerateColumns="False"  OnRowDataBound="GridView1_RowDataBound">
                                            <Columns>
                                                <asp:BoundField DataField="member_id" HeaderText="member_id" SortExpression="member_id" />
                                                <asp:BoundField DataField="member_name" HeaderText="member_name" SortExpression="member_name" />
                                                <asp:BoundField DataField="book_id" HeaderText="book_id" SortExpression="book_id" />
                                                <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                                                <asp:BoundField DataField="issue_date" HeaderText="issue_date" SortExpression="issue_date" />
                                                <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
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
