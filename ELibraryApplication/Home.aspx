<%@ Page Title="" Language="C#" MasterPageFile="~/Elibrary.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ELibraryApplication.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div style="background-color: black; font-size: 26px; color: azure"
            class="col-xs-12 col-sm-12 col-md-12 col-xl-12 text-center">
            ONLINE LIBRARY MANAGEMENT
        </div>
        <img src="imgs/libaray2.jpg" class="img-fluid" />

    </section>
    <section id="Features">
        <div class="container" style="padding-bottom: 45px;padding-top:5px">
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center">Our Features</h1>
                </div>
            </div>
            <div class="card-deck">
                <div class="card">
                    <span class="text-center" style="padding-top: 10px">
                        <img style="width: 120px;" src="imgs/digital-inventory.png" class="img-center" alt="..." /></span>
                    <div class="card-body">
                        <h5 class="card-title text-center">Digital Book Inventory</h5>
                        <p class="card-text">
                            This is a place where you can read book and buy book as well 
                        </p>
                    </div>
                </div>
                <div class="card">
                    <span class="text-center" style="padding-top: 10px">
                        <img style="width: 120px;" src="imgs/search-online.png" alt="..." />
                    </span>
                    <div class="card-body">
                        <h5 class="card-title text-center">Search Books</h5>
                        <p class="card-text">
                            Here,You can serch the book if you cannot find book that you want.
                        </p>
                    </div>
                </div>
                <div class="card">
                    <span class="text-center" style="padding-top: 10px">
                        <img style="width: 120px;" src="imgs/defaulters-list.png" /></span>
                    <div class="card-body">
                        <h5 class="card-title text-center">Defaulter List</h5>
                        <p class="card-text">
                            This is a place where you can read book and buy book as well 
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <img src="imgs/in-homepage-banner.jpg" class="img-fluid" />
    </section>
    <section id="Process">
        <div class="container" style="padding-bottom: 45px; padding-top:5px">
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center">Our Process</h1>
                </div>
            </div>
            <div class="card-deck">
                <div class="card">
                    <span class="text-center" style="padding-top: 10px">
                        <img src="imgs/sign-up.png" style="width: 120px;" /></span>
                    <div class="card-body">
                        <h5 class="card-title text-center">SignUp</h5>
                        <p class="card-text">
                            You must signup if you want to nuy a books.signup page will ask you basic infomation.
                        </p>
                    </div>
                </div>
                <div class="card">
                    <span class="text-center" style="padding-top: 10px">
                        <img style="width: 120px;" src="imgs/search-online.png" alt="..." />
                    </span>
                    <div class="card-body">
                        <h5 class="card-title text-center">Search Books</h5>
                        <p class="card-text">
                            Here,You can serch the book if you cannot find book that you want.
                        </p>
                    </div>
                </div>
                <div class="card">
                    <span class="text-center" style="padding-top: 10px">
                        <img style="width: 120px;" src="imgs/library.png" />
                    </span>
                    <div class="card-body">
                        <h5 class="card-title text-center">Visit Us</h5>
                        <p class="card-text">
                            This is a place where you can read book and buy book as well 
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
