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
    public partial class AdminMemberManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }


        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            deleteMember();
        }


        protected void btnPending_Click(object sender, EventArgs e)
        {
            getUserstatus("Pending");
        }

        protected void btnWarn_Click(object sender, EventArgs e)
        {
            getUserstatus("Deactivate");
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            GetUserdetails();
        }

        protected void btnActive_Click(object sender, EventArgs e)
        {
            getUserstatus("Active");
        }


        //user define Functions
        void GetUserdetails()
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
                    ("SELECT * from member_master_tbl where member_id='" + txtMemberid.Text.Trim() + "';", con);
                //connectied way to access data
                //connected:after operation connection is connect
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    // while is not neccessary but if you want do some event then you can do it in while loop
                    while (dr.Read())
                    {
                        txtFname.Text = dr.GetValue(0).ToString();
                        txtDOB.Text= dr.GetValue(1).ToString();
                        txtContactNo.Text= dr.GetValue(2).ToString();
                        txtCity.Text= dr.GetValue(5).ToString();
                        txtEmail.Text= dr.GetValue(3).ToString();
                        txtPincode.Text= dr.GetValue(6).ToString();
                        txtSate.Text= dr.GetValue(4).ToString();
                        txtAddress.Text= dr.GetValue(7).ToString();
                        txtStatus.Text = dr.GetValue(10).ToString();

                    }

                }
                else
                {
                   Response.Write("<script>alert('Member id is not exist');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

            }
        }
    
        void getUserstatus(string status)
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
                       ("UPDATE member_master_tbl SET account_status='" + status + "' WHERE member_id='" + txtMemberid.Text.Trim() + "'", con);
                //connectied way to access data
                //connected:after operation connection is connect

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Member Account Status Updated');</script>");
                clearForm();
                GridView1.DataBind();
                

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

            }
        }
        void clearForm()
        {
            txtMemberid.Text = "";
            txtPincode.Text = "";
            txtAddress.Text = "";
            txtSate.Text = "";
            txtCity.Text = "";
            txtContactNo.Text = "";
            txtDOB.Text = "";
            txtEmail.Text = "";
            txtFname.Text = "";
            txtStatus.Text = "";
        }

        void deleteMember()
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
                ("DELETE from member_master_tbl  where member_id='" + txtMemberid.Text.Trim() + "';", con);
                //connectied way to access data
                //connected:after operation connection is connect
                SqlDataReader dr = cmd.ExecuteReader();

                        Response.Write("<script>alert('Member Delete Successfully---');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

            }
           
        }
    }
}