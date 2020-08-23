using System;
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
    public partial class UserSignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            if (checkUsername())
            {
                //Response.Write("<script>alert(' UserName is already taken.please choose another username.');</script>");

                 Error_msg.Visible = true;
                Suceess_msg.Visible = false;
            }
            else
            {
                user_Signup();
            }


        }
        bool checkUsername()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    // query with placeholder 
                    SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + txtUname.Text.Trim() + "';", con);
                    //dis-connection way to access data
                    //dis-connect:after operation connection is disconnect
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                if (dt.Rows.Count>=1)
                {
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
                Suceess_msg.Visible = false;
                //  Response.Write("<script>alert(' UserName is already taken.please choose another username.');</script>");
                return false;
            }

        }
        void user_Signup()
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
                ("INSERT into member_master_tbl(fullname,dob,contact_no,email,state,city,pincode,full_address,member_id,password,account_status) values(@full_name,@dob,@contact_no, @email, @state, @city, @pincode, @full_address, @member_id, @password,@account_status)", con);

                //Attach @parameter values
                cmd.Parameters.AddWithValue("@full_name", txtFname.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txtDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txtMobileNo.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@state", txtState.Text.Trim());
                cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txtPinCode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", txtUname.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();

                Suceess_msg.Visible = true;
                Error_msg.Visible = false;

            }
            catch (Exception ex)
            {
               Error_msg.Visible = true;
                Suceess_msg.Visible = false;
                //Response.Write("<script>alert(' UserName is already taken.please choose another username.');</script>");
            }
        }
    }
}