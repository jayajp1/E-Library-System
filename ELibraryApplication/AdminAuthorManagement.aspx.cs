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
    public partial class AdminAuthorManagement : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Success_msg.Visible = false;
            GridView1.DataBind();
        }
      
      
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkAuthorexist())
                {
                   // Success_msg.Visible = true;

                    Response.Write("<script>alert('Author Id Already exist Please take another Author id');</script>");
                }
                else
                {
                    addAuthor();
                }
                

            }
            catch (Exception ex)
            { 
                  Response.Write(ex.Message);
              //  return false;
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkAuthorexist())
                {
                    // Success_msg.Visible = true;
                    updateAuthor();

                  //  Response.Write("<script>alert('Author Id Already exist Please take another Author id');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Author is not exist please check Author_id');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                //  return false;
            }
           
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkAuthorexist())
                {
                    deleteAuthor();
                }
                else
                {
                    Response.Write("<script>alert('Author is not exist please check Author_id');</script>");
                }
            }
            catch (Exception ex)
            {
               
               Response.Write(ex.Message);
             
            }
        }

        //user Defined Functions
        bool checkAuthorexist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + txtAuthorId.Text.Trim() + "';", con);
                //dis-connection way to access data
                //dis-connect:after operation connection is disconnect
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count >= 1)
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
                //  Error_msg.Visible = true;
                RequiredFieldValidator1.Text = "Author id already Exist.";
                //  Response.Write(;
                return false;
            }
        }

        void addAuthor()
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
                ("INSERT into author_master_tbl(author_id,author_name) values(@author_id, @author_name)", con);

                //Attach @parameter values
                cmd.Parameters.AddWithValue("@author_id", txtAuthorId.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", txtAuthorName.Text.Trim());
               

                cmd.ExecuteNonQuery();
                con.Close();

                Success_msg.Text = "Author Add Successfully...";
                Success_msg.Visible = true;

                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
              //  Error_msg.Visible = true;
                //Suceess_msg.Visible = false;
                Response.Write("Something Went Wrong"+ex.Message);

            }
        }
        void updateAuthor()
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
                    ("UPDATE author_master_tbl SET author_name=@author_name WHERE author_id='" + txtAuthorId.Text.Trim() + "'", con);

                    //Attach @parameter values
                    
                    cmd.Parameters.AddWithValue("@author_name", txtAuthorName.Text.Trim());


                    cmd.ExecuteNonQuery();
                    con.Close();

                    Success_msg.Text = "Author name Updated Successfully...";
                    Success_msg.Visible = true;

                    clearForm();
                    GridView1.DataBind();
              
                }
                catch (Exception ex)
                {
                    Response.Write("Something Went Wrong" + ex.Message);

                }
            
        }

        void deleteAuthor()
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
                        ("DELETE from author_master_tbl  where author_id='" + txtAuthorId.Text.Trim() + "';", con);

                        cmd.ExecuteNonQuery();
                        con.Close();

                        Success_msg.Text = "Record Delete Successfully";
                        Success_msg.Visible = true;

                        clearForm();
                        GridView1.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Something Went Wrong" + ex.Message);

                    }
        }
        void clearForm()
        {
            txtAuthorId.Text = "";
            txtAuthorName.Text = "";
        }
        protected void btnGo_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkAuthorexist())
                {
                    // Success_msg.Visible = true;
                    getAuthorName();
                 
                }
                else
                {
                    txtAuthorName.Text = "";
                    Response.Write("<script>alert('Author Id is wrong');</script>");
                    
                }


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                //  return false;
            }

        }

        void getAuthorName()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + txtAuthorId.Text.Trim() + "';", con);
                //dis-connection way to access data
                //dis-connect:after operation connection is disconnect
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtAuthorName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Author id not found');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

       
    }
}