<%@ Page Title="" Language="C#" MasterPageFile="~/Elibrary.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="ELibraryApplication.UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image: url(imgs/libraryy.jpg)" class="img-fluid">
        <p>
            <br />
            <br />
        </p>
        <div class="container card" style="width: 450px; padding: 25px; background-color: white; left: 6px; top: 2px;">
            <div class="text-center">
                <img src="imgs/generaluser.png" style="width: 110px" class="img-fluid" />
                <h5>User Login</h5>
            </div>
            <hr />
            <label>Username</label>
            <asp:TextBox ID="txtUname" placeholder="Username" runat="server" class="form-control">
            </asp:TextBox>
            <span>
                <small>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="color: red; padding-left: 5px" runat="server" ControlToValidate="txtUname"
                        ErrorMessage="Enter UserName"></asp:RequiredFieldValidator></small>  </span>
            <label>Password</label>
            <asp:TextBox ID="txtPassword" type="password" placeholder="Password" runat="server" class="form-control">

            </asp:TextBox>
            <span>
                <small>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Style="color: red; padding-left: 5px" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="Enter Password"></asp:RequiredFieldValidator></small></span>
            <br />
            <div>
                <asp:Button runat="server" ID="Login" type="submit" Text="Login" class="btn btn-success btn-lg btn-block" OnClick="Login_Click" />
            </div>
            <br />
            <div>
                <a href="UserSignup.aspx" style="text-decoration: none">
                    <input type="button" class="btn btn-primary btn-lg btn-block" value="SignUp" /></a>
            </div>
           
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label class="container-fluid alert alert-danger" runat="server" Visible="false"
                ID="Error_msg">
                <b>Username</b> or <b>Password</b> is invallid
            </asp:Label>
            <a href="Home.aspx"><<< Back to Home</a>
        </div>
        <p>
           <br/>
            <br />
        </p>
    </div>
</asp:Content>
