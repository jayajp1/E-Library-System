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
    public partial class AdminPublisherManagement : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e) 
        {
            Success_msg.Visible = false;
            GridView1.DataBind();
        }
        //go button
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkPublisherexist())
                {
                    // Success_msg.Visible = true;
                    getPublisherName();

                }
                else
                {
                    txtPublisherName.Text = "";
                    Response.Write("<script>alert('Publisher Id is wrong');</script>");

                }


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                //  return false;
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkPublisherexist())
                {
                    // Success_msg.Visible = true;

                    Response.Write("<script>alert('Publisher Id Already exist Please take another Publisher id');</script>");
                }
                else
                {
                    addPublisher();
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
                if (checkPublisherexist())
                {
                    // Success_msg.Visible = true;
                    updatePublisher();

                    //  Response.Write("<script>alert('Author Id Already exist Please take another Author id');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Publisher is not exist please check Publisher id');</script>");
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
                if (checkPublisherexist())
                {
                    deletePublisher();
                }
                else
                {
                    Response.Write("<script>alert('Publisher is not exist please check Publisher_id');</script>");
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);

            }
        }

        //user define functions
        bool checkPublisherexist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand("SELECT * from publisher_master_tbl where publisher_id='" + txtPubliisherId.Text.Trim() + "';", con);
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
                Response.Write(ex.Message);
                //  Response.Write(;
                return false;
            }
        }

        void addPublisher()
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
                ("INSERT into publisher_master_tbl(publisher_id,publisher_name) values(@publisher_id, @publisher_name)", con);

                //Attach @parameter values
                cmd.Parameters.AddWithValue("@publisher_id", txtPubliisherId.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", txtPublisherName.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();

                Success_msg.Text = "Publisher Add Successfully...";
                Success_msg.Visible = true;

                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                //  Error_msg.Visible = true;
                //Suceess_msg.Visible = false;
                Response.Write("Something Went Wrong" + ex.Message);

            }
        }
        void updatePublisher()
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
                ("UPDATE publisher_master_tbl SET publisher_name=@publisher_name WHERE publisher_id='" + txtPubliisherId.Text.Trim() + "'", con);

                //Attach @parameter values

                cmd.Parameters.AddWithValue("@publisher_name", txtPublisherName.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();

                Success_msg.Text = "Publisher name Updated Successfully...";
                Success_msg.Visible = true;

                clearForm();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("Something Went Wrong" + ex.Message);

            }

        }

        void deletePublisher()
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
                ("DELETE from publisher_master_tbl  where publisher_id='" + txtPubliisherId.Text.Trim() + "';", con);

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
            txtPubliisherId.Text = "";
            txtPublisherName.Text = "";
        }
        void getPublisherName()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand("SELECT * from publisher_master_tbl where publisher_id='" + txtPubliisherId.Text.Trim() + "';", con);
                //dis-connection way to access data
                //dis-connect:after operation connection is disconnect
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtPublisherName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Publisher id not found');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}