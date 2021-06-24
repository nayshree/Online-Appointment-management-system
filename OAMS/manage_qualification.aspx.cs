using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
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
    public partial class manage_qualification : System.Web.UI.Page
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

            cmd.CommandText = "select pd.Profession_Type_ID, pd.Details, pt.Profession_Type_ID, pt.Profession_Type from profession_type pt, profession_details pd WHERE pd.Profession_Type_ID = pt.Profession_Type_ID AND pd.Type = 'qualification'";
            connection.Open();
            QualificationRepeater.DataSource = cmd.ExecuteReader();
            QualificationRepeater.DataBind();
            connection.Close();
        }

        protected void updaterecord_click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;

            DropDownList profession_type = item.FindControl("profession_type") as DropDownList;
            profession_type.Visible = true;

            Label profession_type_label = item.FindControl("profession_type_label") as Label;
            profession_type_label.Visible = false;


            TextBox qualification_text = item.FindControl("qualification") as TextBox;
            qualification_text.Enabled = true;
            qualification_text.Visible = true;

            Label qualification_label = item.FindControl("qualification_label") as Label;
            qualification_label.Visible = false;

        }

        protected void doneupdation_click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            DropDownList profession_type = item.FindControl("profession_type") as DropDownList;
            String professiontype = profession_type.SelectedValue;

            Label profession_type_label = item.FindControl("profession_type_label") as Label;
            String profession_label = profession_type_label.Text;

            TextBox qualification_text = item.FindControl("qualification") as TextBox;
            String qualification = qualification_text.Text;

            Label qualification_label = item.FindControl("qualification_label") as Label;
            String qualificationlabel = qualification_label.Text;

            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

            connBuilder.Add("Database", "OAMS");
            connBuilder.Add("Data Source", "contra.cjrbdmxkv84s.ap-south-1.rds.amazonaws.com");
            connBuilder.Add("User Id", "admin");
            connBuilder.Add("Password", "MiloniMadhav");

            MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

            MySqlCommand cmd = connection.CreateCommand();

            if (professiontype == "Select" || qualification == null)
            {
                MessageBox.Show("Error ! Select a valid Profession and Qualification");
                Response.Redirect("~/manage_qualification.aspx");
            }

            else if (professiontype == "Doctor" && qualification != null)
            {
                cmd.CommandText = "update profession_details SET Profession_Type_ID='2', Details='"+qualification+"' where Details='"+qualificationlabel+"'";
                connection.Open();
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    MessageBox.Show("Successfully Updated !");
                    Response.Redirect("~/manage_qualification.aspx");
                }
                else
                {
                    MessageBox.Show("Something's wrong!");
                }
            }

            else if (professiontype == "Lawyer" && qualification != null)
            {
                cmd.CommandText = "update profession_details SET Profession_Type_ID='1', Details='"+qualification+"' where Details='"+qualificationlabel+"'";
                connection.Open();
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    MessageBox.Show("Successfully Updated !");
                    Response.Redirect("~/manage_qualification.aspx");
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

            Label qualification_label = item.FindControl("qualification_label") as Label;
            String qualificationlabel = qualification_label.Text;

            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

            connBuilder.Add("Database", "OAMS");
            connBuilder.Add("Data Source", "contra.cjrbdmxkv84s.ap-south-1.rds.amazonaws.com");
            connBuilder.Add("User Id", "admin");
            connBuilder.Add("Password", "MiloniMadhav");

            MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

            MySqlCommand cmd = connection.CreateCommand();


            cmd.CommandText = "Delete from profession_details where Details='" + qualificationlabel + "'";

            connection.Open();
            int x = cmd.ExecuteNonQuery();
            if (x > 0)
            {
                MessageBox.Show("Successfully deleted !");
                Response.Redirect("~/manage_qualification.aspx");
            }
            else
            {
                MessageBox.Show("Something's wrong!");
            }

            connection.Close();

        }

        protected void addnewqualification_click(object sender, EventArgs e)
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
            TextBox var2 = item.FindControl("qualification_new") as TextBox;

            String variable1 = var1.SelectedValue;
            String variable2 = var2.Text;

            if (variable1 == "Select" || variable2 == null)
            {
                MessageBox.Show("Select a valid Profession");
            }

            if (variable1 == "Doctor" && variable2 != null)
            {
                cmd.CommandText = "insert into profession_details(Profession_Type_ID,Type,Details) values(2,'qualification','"+variable2+"');";
               
                connection.Open();
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    MessageBox.Show("Profession Type and Qualification has been added !");
                    Response.Redirect("~/manage_qualification.aspx");
                }
                else
                {
                    MessageBox.Show("Something's wrong!");
                }

                connection.Close();
            }
            else if (variable1 == "Lawyer" && variable2 != null)
            {
                cmd.CommandText = "insert into profession_details(Profession_Type_ID,Type,Details) values(1,'qualification','"+variable2+"');";

                connection.Open();
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    MessageBox.Show("Profession Type and Qualification has been added !");
                    Response.Redirect("~/manage_qualification.aspx");
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