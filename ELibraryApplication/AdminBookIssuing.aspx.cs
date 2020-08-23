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
    public partial class AdminBookIssuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getMembernameAndBookname();
        }

        protected void isuueButton_Click(object sender, EventArgs e)
        {
          if(checkBookexist() && checkMemberexist())
            {
                if (checkIssueBookAlreadyexist())
                {
                    Response.Write("<script>alert('Book Already issue by youself')</script>");
                }
                else
                {
                    issueBook();
                }
                
            }
          else
            {
                Response.Write("<script>alert('Wrong Book id or Member id');</script>");
            }
        }

        protected void returnButton_Click(object sender, EventArgs e)
        {
            if (checkBookexist() && checkMemberexist())
            {
                if (checkIssueBookAlreadyexist())
                {
                    returnBook(); 
                }
                else
                {
                    Response.Write("<script>alert('Book Already return by youself')</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Wrong Book id or Member id');</script>");
            }
        }
        //user define functions:
        void getMembernameAndBookname()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand("SELECT book_name from book_master_tbl where book_id='" + txtBookId.Text.Trim() + "';", con);

                //dis-connection way to access data
                //dis-connect:after operation connection is disconnect
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    txtBookName.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Book Id');</script>");
                }
                cmd = new SqlCommand("SELECT fullname from member_master_tbl where member_id='" + txtMemberid.Text.Trim() + "';", con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtMemberName.Text = dt.Rows[0]["fullname"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Member Id');</script>");
                }

            }
            catch(Exception e)
            {
                Response.Write(e);
            }

        }
        bool checkBookexist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where book_id='" + txtBookId.Text.Trim() + "'AND current_stock>0 ", con);
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
                
                return false;
            }
        }
        bool checkMemberexist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + txtMemberid.Text.Trim() + "';", con);
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
                Response.Write(ex);
                return false;
            }
        }
        bool checkIssueBookAlreadyexist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand("SELECT * from book_issue_tbl where member_id='" + txtMemberid.Text.Trim() + "'AND book_id='" + txtBookId.Text.Trim() + "' ;", con);
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
                Response.Write(ex);
                return false;
            }
        }

        void issueBook()
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
                ("INSERT into book_issue_tbl(member_id,member_name,book_id,book_name,issue_date,due_date) values(@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date)", con);

                //Attach @parameter values
                cmd.Parameters.AddWithValue("@member_id", txtMemberid.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", txtMemberName.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", txtStartDate.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", txtEndDate.Text.Trim());

                cmd.ExecuteNonQuery();

                //Reduce Book count
                cmd = new SqlCommand("Update book_master_tbl set current_stock=current_stock-1 WHERE book_id='" + txtBookId.Text.Trim() + "';",con);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Your Book Issue Successfully');</script>");


                //clearForm();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {

                Response.Write(ex);
            }
        }
        void returnBook()
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
                ("DELETE from book_issue_tbl where book_id='"+txtBookId.Text.Trim()+"'AND member_id='"+txtMemberid.Text.Trim()+"';", con);

                int result=cmd.ExecuteNonQuery();
                if (result > 0)
                {     //increment Book count
                    cmd = new SqlCommand("Update book_master_tbl set current_stock=current_stock+1 WHERE book_id='" + txtBookId.Text.Trim() + "';", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Your Book return Successfully');</script>");

                    GridView1.DataBind();
                }

            

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