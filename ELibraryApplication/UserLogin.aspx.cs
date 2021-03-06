﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryApplication
{
    public partial class UserLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUname.Focus();
           
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if (checkValiduser())
            {
                Response.Redirect("Home.aspx");
                Error_msg.Visible = false;
            }
            else
            {
                Error_msg.Visible = true;
            }
        }
        bool checkValiduser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand
                    ("SELECT * from member_master_tbl where member_id='" + txtUname.Text.Trim() + "' AND password='"+txtPassword.Text.Trim()+"';", con);
                //connectied way to access data
                //connected:after operation connection is connect
                SqlDataReader dr = cmd.ExecuteReader();
               
                if (dr.HasRows)
                {
                    // while is not neccessary but if you want do some event then you can do it in while loop
                    while (dr.Read())
                    {
                        // For creating session variable
                        Session["username"] = dr.GetValue(8).ToString();
                        Session["password"] = dr.GetValue(9).ToString();
                        Session["account_status"] = dr.GetValue(10).ToString();
                        Session["role"] = "User";
                    }
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                
                Error_msg.Visible = true;
                //  Response.Write("<script>alert(' UserName is already taken.please choose another username.');</script>");
                return false;
            }
        }
    }
}