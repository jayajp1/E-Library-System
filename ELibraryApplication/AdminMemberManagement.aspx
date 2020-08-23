<%@ Page Title="" Language="C#" MasterPageFile="~/Elibrary.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs"
     Inherits="ELibraryApplication.AdminMemberManagement" %>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                           <h4>Member Details</h4>
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                           <img style="width:100px" src="imgs/generaluser.png" />
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                      <label>Member ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox class="form-control" ID="txtMemberid" runat="server" placeholder="ID" ></asp:TextBox>
                                           <asp:Button class="btn btn-primary" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click"/>
                                         
                                        </div>
                                    </div>
                                 <span><small>
                                           
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="color: red;" 
                                                    ControlToValidate="txtMemberid" runat="server"
                                                    ErrorMessage="Enter Memebr Id"></asp:RequiredFieldValidator>
                                            </small></span>
                                </div>
                                <div class="col-md-4">
                                    <label>Full Name</label>
                                    <asp:TextBox CssClass="form-control" ID="txtFname" runat="server" placeholder="Full Name" ReadOnly="true" ></asp:TextBox>
                                   
                                </div>
                                    <div class="col-md-5">
                                    <label>Account Status</label>
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control " ID="txtStatus" ReadOnly="true" runat="server"   placeholder="Status"></asp:TextBox>
                                           <asp:LinkButton class="btn btn-success mr-1"   ID="btnActive" runat="server" OnClick="btnActive_Click" >
                                               <i class="far fa-check-circle"></i>
                                           </asp:LinkButton>
                                           <asp:LinkButton class="btn btn-warning mr-1"  ID="btnPending" runat="server" OnClick="btnPending_Click">
                                                    <i class="far fa-pause-circle"></i>
                                           </asp:LinkButton>
                                           <asp:LinkButton class="btn btn-danger mr-1"  ID="btnWarn" runat="server" OnClick="btnWarn_Click">
                                                   <i class="fas fa-minus-circle"></i>
                                           </asp:LinkButton>
                                            </div>
                                      
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Date Of Birth</label>
                                    <asp:TextBox class="form-control" ID="txtDOB" runat="server" placeholder="Birth date" ReadOnly="true" TextMode="Date"></asp:TextBox>
                                
                                </div>
                                <div class="col-md-4    ">
                                    <label>Contact No.</label>
                                    <asp:TextBox CssClass="form-control" ID="txtContactNo" runat="server" ReadOnly="true" placeholder="Contact No"></asp:TextBox>                       
                                </div>
                                <div class="col-md-4">
                                    <label>Email</label>
                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" ReadOnly="true" placeholder="nname@gmail.com" TextMode="Email"></asp:TextBox>                       
                                </div>

                            </div>
                                 <div class="row">
                                <div class="col">
                                    <br>
                                </div>
                            </div>
                                 <div class="row">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <asp:TextBox class="form-control" ID="txtSate" runat="server" ReadOnly="true" placeholder="State" ></asp:TextBox>
                                
                                </div>
                                <div class="col-md-4">
                                    <label>City</label>
                                    <asp:TextBox CssClass="form-control" ID="txtCity" runat="server" ReadOnly="true" placeholder="City"></asp:TextBox>                       
                                </div>
                                <div class="col-md-4">
                                    <label>PinCode</label>
                                    <asp:TextBox CssClass="form-control" ID="txtPincode" runat="server" placeholder="Pincode" ReadOnly="true" MaxLength="6"></asp:TextBox>                       
                                </div>

                            </div>
                                 <div class="row">
                                <div class="col">
                                    <br>
                                </div>
                            </div>
                               <div class="row">
                                    <div class="col-md-12">
                                                <label>Postal Address</label>
                                        <div class="input-group">

                                  
                                    <asp:TextBox CssClass="form-control" ID="txtAddress" ReadOnly="true" runat="server" placeholder="Postal Address" TextMode="MultiLine"></asp:TextBox>  
                                   
                                        </div> </div>
                                  
                            </div>
                               <div class="row">
                                <div class="col">
                                    <br>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <asp:Button ID="btnDeleteUser" class="btn btn-md btn-block btn-danger" runat="server" Text="Delete User Permanetly" OnClick="btnDeleteUser_Click" />
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
                              <h4>Members List</h4>
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString3 %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                                    <asp:GridView class="table table-striped table-responsive-xl table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="member_id">
                                        <Columns>
                                            <asp:BoundField DataField="member_id" HeaderText="Id" ReadOnly="True" SortExpression="member_id" />
                                            <asp:BoundField DataField="fullname" HeaderText="Name" SortExpression="fullname" />
                                            <asp:BoundField DataField="account_status" HeaderText="Account status" SortExpression="account_status" />
                                            <asp:BoundField DataField="contact_no" HeaderText="Mobile Number" SortExpression="contact_no" />
                                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
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
