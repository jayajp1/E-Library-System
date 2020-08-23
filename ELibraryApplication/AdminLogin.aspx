<%@ Page Title="" Language="C#" MasterPageFile="~/Elibrary.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ELibraryApplication.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image: url(imgs/libraryy.jpg)" class="img-fluid">
        <p>
            <br />
            <br />
        </p>
        <div class="container card" style="width: 450px; padding: 25px; background-color: white">
            <div class="text-center">
                <img src="imgs/adminuser.png" style="width: 120px" class="img-fluid" />
                <h5>Admin Login</h5>
            </div>
            <hr />
            <label>Username</label>
            <asp:TextBox ID="txtAUname" placeholder="Username" runat="server" class="form-control">
            </asp:TextBox>
            <span>
                <small>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="color: red; padding-left: 5px" runat="server" ControlToValidate="txtAUname"
                        ErrorMessage="Enter UserName"></asp:RequiredFieldValidator></small>  </span>


            <label>Password</label>
            <asp:TextBox ID="txtAPassword" type="password" placeholder="Password" runat="server" class="form-control">

            </asp:TextBox>
            <span>
                <small>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Style="color: red; padding-left: 5px" runat="server" ControlToValidate="txtAPassword"
                        ErrorMessage="Enter Password"></asp:RequiredFieldValidator></small></span>
        <br>

         <div>
                <asp:Button runat="server" ID="admin_Login" type="submit" text="Login" class="btn btn-success btn-lg btn-block" OnClick="admin_Login_Click"/></div>
                  
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label class="container-fluid alert alert-danger" runat="server" Visible="false"
                ID="Error_msg">
                <b>Username</b> or <b>Password</b> is invallid
            </asp:Label>
           <br />
            <a href="Home.aspx"><<< Back to Home</a>
        </div>
        <p>
            <br />
            <br />
        </p>
    </div>
</asp:Content>
