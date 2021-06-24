using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using Button = System.Web.UI.WebControls.Button;
using TextBox = System.Web.UI.WebControls.TextBox;

namespace OAMS
{
    public partial class View_consultants : System.Web.UI.Page
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
            
            cmd.CommandText = "select * from user_master where utmid = 3";
            connection.Open();
            RepeatInformation.DataSource = cmd.ExecuteReader();
            RepeatInformation.DataBind();
            connection.Close();
        }

        protected void changestatus(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            TextBox uid = item.FindControl("uid") as TextBox;
            TextBox activation = item.FindControl("activation") as TextBox;
            TextBox name = item.FindControl("name") as TextBox;
            String userid = uid.Text;
            String status = activation.Text;
            String uname = name.Text;


            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

            connBuilder.Add("Database", "OAMS");
            connBuilder.Add("Data Source", "contra.cjrbdmxkv84s.ap-south-1.rds.amazonaws.com");
            connBuilder.Add("User Id", "admin");
            connBuilder.Add("Password", "MiloniMadhav");

            MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

            MySqlCommand cmd = connection.CreateCommand();
            connection.Open();

            if (status == "Activated")
            {
                cmd.CommandText = "UPDATE user_master SET Activation = '" + "Deactivated" + "' WHERE UID = ' " + userid + "';";
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                    MessageBox.Show("Consultant - " +uname+ " Deactivated Successfully !");
                else
                    MessageBox.Show("Error changing the status !");
                connection.Close();
            }

            else if (status == "Deactivated")
            {
                cmd.CommandText = "UPDATE user_master SET Activation = '" + "Activated" + "' WHERE UID = ' " + userid + "';";
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                    MessageBox.Show("Consultant - "+uname+ " Activated Successfully !");
                else
                    MessageBox.Show("Error changing the status !");
                connection.Close();                
            }
            Response.Redirect("~/View_consultants.aspx");
        }

        protected void admincomplaints(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            TextBox uid = item.FindControl("uid") as TextBox;
            String userid = uid.Text;
            Response.Redirect("~/admincomplaints.aspx?uid=" + Server.UrlEncode(uid.Text));
        }

        protected void adminfeedbacks(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            TextBox uid = item.FindControl("uid") as TextBox;
            String userid = uid.Text;
            Response.Redirect("~/adminfeedbacks.aspx?uid=" + Server.UrlEncode(uid.Text));
        }
    }
}