using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Button = System.Web.UI.WebControls.Button;
using Label = System.Web.UI.WebControls.Label;
using TextBox = System.Web.UI.WebControls.TextBox;

namespace OAMS
{
    public partial class manage_profession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

            connBuilder.Add("Database", "oams");
            connBuilder.Add("Data Source", "localhost");
            connBuilder.Add("User Id", "root");
            connBuilder.Add("Password", "Abcde@123");

            MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

            MySqlCommand cmd = connection.CreateCommand();

            cmd.CommandText = "select pd.Profession_Type_ID, pd.Details, pt.Profession_Type_ID, pt.Profession_Type from profession_type pt, profession_details pd WHERE pd.Profession_Type_ID = pt.Profession_Type_ID AND pd.Type = 'specialization'";
            connection.Open();
            ProfessionRepeater.DataSource = cmd.ExecuteReader();
            ProfessionRepeater.DataBind();
            connection.Close();
        }

        protected void updaterecord_click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            
            DropDownList profession_type = item.FindControl("profession_type") as DropDownList;
            profession_type.Visible = true;

            Label profession_type_label = item.FindControl("profession_type_label") as Label;
            profession_type_label.Visible = false;
            

            TextBox specialization_text = item.FindControl("specialization") as TextBox;
            specialization_text.Enabled = true;
            specialization_text.Visible = true;

            Label specialization_label = item.FindControl("specialization_label") as Label;
            specialization_label.Visible = false;

             /*Response.Redirect("~/updaterecords.aspx?professiontype=" + professiontype+"&specialization="+specialization);*/
           
        }

        protected void doneupdation_click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            DropDownList profession_type = item.FindControl("profession_type") as DropDownList;
            String professiontype = profession_type.SelectedValue;

            Label profession_type_label = item.FindControl("profession_type_label") as Label;
            String profession_label = profession_type_label.Text;

            TextBox specialization_text = item.FindControl("specialization") as TextBox;
            String specialization = specialization_text.Text;

            Label specialization_label = item.FindControl("specialization_label") as Label;
            String specializationlabel = specialization_label.Text;

            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

            connBuilder.Add("Database", "OAMS");
            connBuilder.Add("Data Source", "contra.cjrbdmxkv84s.ap-south-1.rds.amazonaws.com");
            connBuilder.Add("User Id", "admin");
            connBuilder.Add("Password", "MiloniMadhav");

            MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

            MySqlCommand cmd = connection.CreateCommand();

            if (professiontype == "Select" || specialization == null)
            {
                MessageBox.Show("Error ! Select a valid Profession and Specialization");
                Response.Redirect("~/manage_profession.aspx");
            }

            else if(professiontype == "Doctor" && specialization!= null)
            {
                cmd.CommandText = "update profession_details SET Profession_Type_ID='2', Details='"+specialization+"' where Details='"+specializationlabel+"'";
                connection.Open();
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    MessageBox.Show("Successfully Updated !");
                    Response.Redirect("~/manage_profession.aspx");
                }
                else
                {
                    MessageBox.Show("Something's wrong!");
                }
            }

            else if (professiontype == "Lawyer" && specialization != null)
            {
                cmd.CommandText = "update profession_details SET Profession_Type_ID='1', Details='" + specialization+"' where Details='"+ specializationlabel+"'";
                connection.Open();
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    MessageBox.Show("Successfully Updated !");
                    Response.Redirect("~/manage_profession.aspx");
                }
                else
                {
                    MessageBox.Show("Something's wrong!");
                }
            }
            
            connection.Close();
        }

        protected void deleterecord_click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;

            Label specialization_label = item.FindControl("specialization_label") as Label;
            String specializationlabel = specialization_label.Text;

            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

            connBuilder.Add("Database", "OAMS");
            connBuilder.Add("Data Source", "contra.cjrbdmxkv84s.ap-south-1.rds.amazonaws.com");
            connBuilder.Add("User Id", "admin");
            connBuilder.Add("Password", "MiloniMadhav");

            MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

            MySqlCommand cmd = connection.CreateCommand();


            cmd.CommandText = "Delete from profession_details where Details='"+specializationlabel+"'";

            connection.Open();
            int x = cmd.ExecuteNonQuery();
            if (x > 0)
            {
                MessageBox.Show("Successfully deleted !");
                Response.Redirect("~/manage_profession.aspx");
            }
            else
            {
                MessageBox.Show("Something's wrong!");
            }

            connection.Close();
        }


        protected void addnewprofession_click(object sender, EventArgs e)
        { 
            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

            connBuilder.Add("Database", "OAMS");
            connBuilder.Add("Data Source", "contra.cjrbdmxkv84s.ap-south-1.rds.amazonaws.com");
            connBuilder.Add("User Id", "admin");
            connBuilder.Add("Password", "MiloniMadhav");

            MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

            MySqlCommand cmd = connection.CreateCommand();


            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            DropDownList var1 = item.FindControl("professiontype_new") as DropDownList;
            TextBox var2 = item.FindControl("specialization_new") as TextBox;

            String variable1 = var1.SelectedValue;
            String variable2 = var2.Text;
            
            if (variable1 == "Select" || variable2 == null)
            {
                MessageBox.Show("Select a valid Profession");
                Response.Redirect("~/manage_profession.aspx");
            }

            else if(variable1 == "Doctor" && variable2 != null)
            {
                cmd.CommandText = "insert into profession_details(Profession_Type_ID,Type,Details) values(2,'specialization','"+variable2+"');";
                
                connection.Open();
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    MessageBox.Show("Profession Type and Specialization has been added !");
                    Response.Redirect("~/manage_profession.aspx");
                }
                else
                {
                    MessageBox.Show("Something's wrong!");
                }

                connection.Close();
            }

            else if(variable1 == "Lawyer" && variable2 != null)
            {
                cmd.CommandText = "insert into profession_details(Profession_Type_ID,Type,Details) values(1,'specialization','"+variable2+"');";

                connection.Open();
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    MessageBox.Show("Profession Type and Specialization has been added !");
                    Response.Redirect("~/manage_profession.aspx");
                }
                else
                {
                    MessageBox.Show("Something's wrong!");
                }

                connection.Close();
            }

        }

    }
}