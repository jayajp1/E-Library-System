<%@ Page Title="" Language="C#" MasterPageFile="~/Elibrary.Master" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="ELibraryApplication.UserSignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image: url(imgs/libraryy.jpg)" class="img-fluid">
        <p>
            <br />
            <br />
        </p>
                  

            <span class="container-fluid text-center">
            <asp:Label class="alert alert-warning alert-dismissible fade show text-center" role="alert" runat="server" ID="Error_msg" Visible="false">
                      UserName is already taken.please choose another username.
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
            </asp:Label>
        </span>
        <span class="container-fluid text-center">
            <asp:Label class="alert alert-success text-center" role="alert" runat="server" ID="Suceess_msg" Visible="false">
           Registration Done Successfully...
            <a href="Home.aspx" class="alert-link"><b>Back To Home</b></a>
            </asp:Label>
        </span>
    
  
        <div class="container" id="container">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col  text-center">
                                    <img src="imgs/generaluser.png" style="width: 110px" class="img-fluid" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col text-center">
                                    <h5>User Sign Up</h5>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>First Name</label>
                                    <asp:TextBox ID="txtFname" placeholder="First Name" runat="server" class="form-control">
                                    </asp:TextBox>
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtDOB"
                                                ErrorMessage="Enter Date Of Birth"></asp:RequiredFieldValidator></small>  </span>
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtMobileNo"
                                                ErrorMessage="Enter Mobile Number"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                                <div class="col-md-6">
                                    <label>Email</label>
                                    <asp:TextBox ID="txtEmail" placeholder="user@gmail.com" runat="server" class="form-control" TextMode="Email"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtEmail"
                                                ErrorMessage="Enter Date Of Birth"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <asp:TextBox ID="txtState" placeholder="State" runat="server" class="form-control"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtState"
                                                ErrorMessage="Enter State"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                                <div class="col-md-4">
                                    <label>City</label>
                                    <asp:TextBox ID="txtCity" placeholder="City" runat="server" class="form-control"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtCity"
                                                ErrorMessage="Enter City"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                                <div class="col-md-4">
                                    <label>PinCode</label>
                                    <asp:TextBox ID="txtPinCode" placeholder="PinCode" runat="server" class="form-control" MaxLength="6"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtPinCode"
                                                ErrorMessage="Enter PinCode"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Address</label>
                                    <asp:TextBox ID="txtAddress" placeholder="Address" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Style="color: red; padding-left: 5px"
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
                                <div class="col-md-6">
                                    <label>User Name</label>
                                    <asp:TextBox ID="txtUname" placeholder="User Name" runat="server" class="form-control">
                                    </asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtUname"
                                                ErrorMessage="Enter User Name"></asp:RequiredFieldValidator></small>  </span>
                                </div>
                                <div class="col-md-6">
                                    <label>Password</label>
                                    <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                                    <span>
                                        <small>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Style="color: red; padding-left: 5px"
                                                runat="server" ControlToValidate="txtPassword"
                                                ErrorMessage="Enter Password"></asp:RequiredFieldValidator></small>  </span>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <asp:Button runat="server" ID="SignUp" Text="Sign Up" class="btn btn-success btn-lg btn-block" OnClick="SignUp_Click" />
                                </div>
                            </div>
                            <br />
                            <a href="Home.aspx"><<< Back to Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <p>

            <br />
            <br />
        </p>
    </div>
</asp:Content>
