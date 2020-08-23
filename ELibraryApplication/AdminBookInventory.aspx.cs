using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryApplication
{
    public partial class AdminBookInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string globalfilepath;
        static int globalCurrentStock, globalActualStock, globalIsuuedbook;
        protected void Page_Load(object sender, EventArgs e)
        {
            //clearForm();
            if (!IsPostBack)
            {

                fillAuthorPublisherValues();

            }
            GridView1.DataBind();
        }

        protected void txtAddbook_Click(object sender, EventArgs e)
        {
            if (checkBookexist())
            {
                Response.Write("<script>alert('Book Is already exist, please try another book id');</script>");
            }
            else
            {
                addBook();
               
                GridView1.DataBind();
           
            }

        }

        protected void txtUpdatebook_Click(object sender, EventArgs e)
        {
            if (checkBookexist())
            {
                updateBook();
               Response.Write("<script>alert('Book details update successfully...');</script>");
            }
            else
            {
                Response.Write("<script>alert('Book Is already exist');</script>");
               
            }
        }

        protected void txtDeletebook_Click(object sender, EventArgs e)
        {
            if (checkBookexist())
            {
                deleteBook();
                Response.Write("<script>alert('Book delete successfully...');</script>");
            }
            else
            {
                Response.Write("<script>alert('Book Is already exist');</script>");
            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getBookid();
            /*if (checkBookexist())
            {
                getBookid();
            }
            else
            {
                Response.Write("<script>alert('Booki id doesnot exist');</script>");
            }*/
        }
        void getBookid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where book_id='" + txtBookId.Text.Trim() + "';", con);
                //dis-connection way to access data
                //dis-connect:after operation connection is disconnect
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtBookName.Text = dt.Rows[0]["book_name"].ToString();
                    txtEdition.Text = dt.Rows[0]["edition"].ToString();
                    txtPdate.Text = dt.Rows[0]["publish_date"].ToString();
                    txtBookCost.Text = dt.Rows[0]["book_cost"].ToString();
                    txtPages.Text = dt.Rows[0]["no_of_pagess"].ToString();
                    txtDes.Text = dt.Rows[0]["book_description"].ToString();
                    txtAStock.Text = dt.Rows[0]["actual_stock"].ToString();
                    txtCStock.Text = dt.Rows[0]["current_stock"].ToString();
                    txtIssuedBooks.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString())-Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));
                    DLLang.SelectedValue = dt.Rows[0]["language"].ToString();

                    DLCategory.ClearSelection();
                    string[] cate = dt.Rows[0]["category"].ToString().Trim().Split(',');   
                    for(int i = 0; i < cate.Length; i++)
                    {
                        for(int j = 0; j < DLCategory.Items.Count; j++)
                        {
                            if (DLCategory.Items[j].ToString() == cate[i])
                            {
                                DLCategory.Items[j].Selected = true;
                            }
                        }
                    } 

                    DLAuthorName.SelectedValue = dt.Rows[0]["author_name"].ToString();
                    DLPublisherName.SelectedValue = dt.Rows[0]["publisher_name"].ToString();


                    globalActualStock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    globalCurrentStock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    globalIsuuedbook = globalActualStock - globalCurrentStock;
                    globalfilepath = dt.Rows[0]["book_img_link"].ToString(); 


                }
                else
                {
                    Response.Write("<script>alert('Book id not exist or wrong...');</script>");
                    clearForm();
                }
             


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                
            }
        }
        //user-define functions
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
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where book_id='" + txtBookId.Text.Trim() + "' OR book_name='"+txtBookName.Text.Trim()+"';", con);
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
                Response.Write(ex.Message);
                return false;
            }
        }
        bool checkBookidexist()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where book_id='" + txtBookId.Text.Trim() + "';", con);
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
                Response.Write(ex.Message);
                return false;
            }
        }
            void addBook()
        {
            try
            {
                //for multiples category
                string DLCategoryy ="";
                foreach (int i in DLCategory.GetSelectedIndices())
                {
                    DLCategoryy = DLCategoryy + DLCategory.Items[i]+",";
                }

                // DLCategory=horro,health,
                //so remove comma at last we have do one thing
                DLCategoryy = DLCategoryy.Remove(DLCategoryy.Length - 1);



                // for upload file 
                string basepath = "~/bookinventory/books.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("bookinventory/" + filename)) ;
                basepath = "~/bookinventory/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                // query with placeholder 
                SqlCommand cmd = new SqlCommand
                ("INSERT into book_master_tbl(book_id,book_name,category,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pagess,book_description,actual_stock,current_stock,book_img_link) values(@book_id,@book_name,@category,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pagess,@book_description,@actual_stock,@current_stock,@book_img_link)", con);

                //Attach @parameter values
                cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());
                
                cmd.Parameters.AddWithValue("@author_name", DLAuthorName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DLPublisherName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", txtPdate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DLLang.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", txtEdition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", txtBookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pagess", txtPages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", txtDes.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", txtAStock.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", txtAStock.Text.Trim());

                // Multiple selected items Dropdownlisst
                cmd.Parameters.AddWithValue("@category", DLCategoryy);

                //Img path store in DB
                cmd.Parameters.AddWithValue("@book_img_link", basepath);

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Book deatils Enter Successfully...');</script>");
                con.Close();
                clearForm();
               // clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                //  Error_msg.Visible = true;
                //Suceess_msg.Visible = false;
                Response.Write("Something Went Wrong" + ex.Message);

            }
        }
        void updateBook()
        {
            try
            {

                //for update value of current and Actual stock
                int actual_stock = Convert.ToInt32(txtAStock.Text.Trim());
                int current_stock = Convert.ToInt32(txtCStock.Text.Trim());

                if (globalActualStock == actual_stock)
                {

                }
                else
                {
                    if (actual_stock < globalIsuuedbook)
                    {
                        Response.Write("<script>alert('Actual stock can not be less than current stock');</script>");
                        return;
                    }else
                    {
                        current_stock = actual_stock - globalIsuuedbook;
                        txtCStock.Text = " "+current_stock;
                    }
                }

                //for multiples category
                string DLCategoryy = "";
                foreach (int i in DLCategory.GetSelectedIndices())
                {
                    DLCategoryy = DLCategoryy + DLCategory.Items[i] + ",";
                }

                // DLCategory=horro,health,
                //so remove comma at last we have do one thing
                DLCategoryy = DLCategoryy.Remove(DLCategoryy.Length - 1);


                // for upload file 
                string basepath = "~/bookinventory/books.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("bookinventory/" + filename));
                if(filename=="" || filename == null)
                {
                    basepath = globalfilepath;
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("bookinventory/" + filename));
                    basepath = "~/bookinventory/" + filename;
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand
                ("UPDATE book_master_tbl SET book_name=@book_name,category=@category,author_name=@author_name,publisher_name=@publisher_name,publish_date=@publish_date,language=@language,edition=@edition,book_cost=@book_cost,no_of_pagess=@no_of_pagess,book_description=@book_description,actual_stock=@actual_stock,current_stock=@current_stock,book_img_link=@book_img_link WHERE book_id='" + txtBookId.Text.Trim()+"'", con);

                //Attach @parameter values

                cmd.Parameters.AddWithValue("@book_name",txtBookName.Text.Trim());

                cmd.Parameters.AddWithValue("@category", DLCategoryy);
                cmd.Parameters.AddWithValue("@author_name", DLAuthorName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", txtPdate.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", DLPublisherName.SelectedItem.Value);
                         
                cmd.Parameters.AddWithValue("@language", DLLang.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", txtEdition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", txtBookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pagess", txtPages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", txtDes.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                cmd.Parameters.AddWithValue("@book_img_link", basepath);


                cmd.ExecuteNonQuery();
                con.Close();

               
                GridView1.DataBind();

                Response.Write("<script>alert('Book Details Update succcesfuuky..');</csript>");
                clearForm();

            }
            catch (Exception ex)
            {
                Response.Write("Something Went Wrong" + ex.Message);

            }
        }
        void deleteBook()
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
                ("DELETE from book_master_tbl  where book_id='" + txtBookId.Text.Trim() + "';", con);

                cmd.ExecuteNonQuery();
                con.Close();

                clearForm();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("Something Went Wrong" + ex.Message);

            }
        }
        void fillAuthorPublisherValues()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // query with placeholder 
                SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tbl ", con);
                //dis-connection way to access data
                //dis-connect:after operation connection is disconnect
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DLAuthorName.DataSource = dt;
                DLAuthorName.DataValueField = "author_name";
                DLAuthorName.DataBind();


                cmd = new SqlCommand("SELECT publisher_name from publisher_master_tbl", con);
                 sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                sda.Fill(dt);
                DLPublisherName.DataSource = dt;
                DLPublisherName.DataValueField = "publisher_name";
                DLPublisherName.DataBind();

             //   con.Close();
            

            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
              
            }
        }

        void clearForm()
        {
            txtBookId.Text = "";
            txtBookName.Text = "";
            txtAStock.Text = "";
            txtBookCost.Text = "";
            txtCStock.Text = "";
            txtDes.Text = "";
            txtPages.Text = "";
            txtPdate.Text = "";
            txtEdition.Text = "";
          /*  DLLang.ClearSelection();
            DLCategory.ClearSelection();
            DLAuthorName.ClearSelection();
            DLPublisherName.ClearSelection();*/
            
        }
    }
}