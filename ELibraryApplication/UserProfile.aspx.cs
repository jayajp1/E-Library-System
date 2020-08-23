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
    public partial class UserProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Session["username"].ToString()=="" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired')</script>");
                    Response.Redirect("UserLogin.aspx");
                }
                else
                {
                    getUserBookdata();
                    if (!Page.IsPostBack)
                    {
                        getUserInfo();  
                    }
                   
                  //  GridView2.DataBind();
                }

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Session Expired')</script>");
                Response.Redirect("UserLogin.aspx");
            }
          
           
        }

        protected void updateUserinfo_Click(object sender, EventArgs e)
        {
            updateUserInfo();
        }

        //user define function
       void getUserInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='"+Session["username"].ToString()+"';", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtUname.Text = dt.Rows[0]["member_id"].ToString();
                    txtOPassword.Text = dt.Rows[0]["password"].ToString();
                    txtAddress.Text= dt.Rows[0]["full_address"].ToString();
                    txtCity.Text= dt.Rows[0]["city"].ToString();
                    txtDOB.Text= dt.Rows[0]["dob"].ToString();
                    txtEmail.Text= dt.Rows[0]["email"].ToString();
                    txtFname.Text= dt.Rows[0]["fullname"].ToString();
                    txtMobileNo.Text= dt.Rows[0]["contact_no"].ToString();
                    txtPinCode.Text= dt.Rows[0]["pincode"].ToString();
                    txtState.Text= dt.Rows[0]["state"].ToString();
                    
                    Label1.Text = dt.Rows[0]["account_status"].ToString().Trim();

                    if (dt.Rows[0]["account_status"].ToString().Trim() == "Active")
                    {
                        Label1.Attributes.Add("class", "badge badge-pill badge-success");
                    }
                    else if (dt.Rows[0]["account_status"].ToString().Trim() == "Pending")
                    {
                        Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                    }
                    else if (dt.Rows[0]["account_status"].ToString().Trim() == "Deactive")
                    {
                        Label1.Attributes.Add("class", "badge badge-pill badge-danger");
                    }
                    else
                    {
                        Label1.Attributes.Add("class", "badge badge-pill badge-info");
                    }
                }
                else
                {
                    
                }

                con.Close();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {

                Response.Write(ex);
            }

        }

        void getUserBookdata()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from book_issue_tbl where member_id='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
              
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
              

                con.Close();
                

            }
            catch (Exception ex)
            {

                Response.Write(ex);
            }
        }

      void updateUserInfo()
        {
            string password = "";
            if (txtNPassword.Text.Trim() == "")
            {
                password = txtOPassword.Text.Trim();
            }
            else
            {
                password = txtNPassword.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Update member_master_tbl set fullname=@fullname,dob=@dob,full_address=@full_address,state=@state,city=@city,pincode=@pincode,contact_no=@contact_no,email=@email,password=@password where member_id='" + Session["username"].ToString() + "';", con);

                cmd.Parameters.AddWithValue("@fullname", txtFname.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txtDOB.Text.Trim());
                cmd.Parameters.AddWithValue("full_address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@state", txtState.Text.Trim());
                cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txtPinCode.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@contact_no", txtMobileNo.Text.Trim());

               int result= cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Write("<script>alert('Your infomation Upadte Successfully');</script>");
                    getUserBookdata();
                    getUserInfo();
                }else
                {
                    Response.Write("<script>alert('Invalid Entry');</script>");
                }

                con.Close();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {

                Response.Write(ex);
            }

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.Red;
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}