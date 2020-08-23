using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryApplication
{
    public partial class Elibrary : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label_User_Admin.Visible = false;
            try
            {  
                if (Session["role"].Equals("User"))
                {
                    Label_User_Admin.Visible = true;
                    Label_User_Admin.Text = "Hello " +Session["username"].ToString();
                    Logout.Visible = true;
                    Sign_In.Visible = false;
                    Admin_Login.Visible = false;
                    User_Login.Visible = false;
                }
                else if (Session["role"].Equals("Admin"))
                {
                    
                    Label_User_Admin.Visible = true;
                    Label_User_Admin.Text = "Hello Admin";
                    Logout.Visible = true;
                    Sign_In.Visible = false;
                    Admin_Login.Visible = true;
                    User_Login.Visible = false;

                    Author_Management.Visible = true;
                    Publicer_Management.Visible = true;
                    Member_Management.Visible = true;
                    Book_Inventory.Visible = true;
                    Book_Issuing.Visible = true;
                }
               else if((Session["role"].Equals("Admin")) && (Session["role"].Equals("User")))
                {
                   
                    Logout.Visible = false;

                    Author_Management.Visible = false;
                    Publicer_Management.Visible = false;
                    Book_Inventory.Visible = false;
                    Book_Issuing.Visible = false;
                    Member_Management.Visible = false;


                }
           }
            catch(Exception ex)
            {
                //Response.Write(ex.Message);
            }
       
        }

        protected void Admin_Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void Author_Management_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAuthorManagement.aspx");
        }

        protected void Publicer_Management_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPublisherManagement.aspx");
        }

        protected void Book_Inventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookInventory.aspx");

        }

        protected void Member_Management_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMemberManagement.aspx");
        }

        protected void Book_Issuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookIssuing.aspx");
        }

        protected void View_Books_Click(object sender, EventArgs e)
        {
          
            Response.Redirect("ViewBooks.aspx");
          
        }

        protected void User_Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void Sign_In_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignup.aspx");
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["role"] = "";
            Session["username"] = "";
            Session["password"] = "";
            Session["account_status"] = "";
            Label_User_Admin.Visible = false;
            Logout.Visible = false;

            Author_Management.Visible = false;
            Publicer_Management.Visible = false;
            Book_Inventory.Visible = false;
            Book_Issuing.Visible = false;
            Member_Management.Visible = false;
            Response.Redirect("Home.aspx");
           
        }

        protected void Label_User_Admin_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
}