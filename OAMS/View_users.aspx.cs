using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Button = System.Web.UI.WebControls.Button;
using TextBox = System.Web.UI.WebControls.TextBox;


namespace OAMS
{
    public partial class View_users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

            connBuilder.Add("Database", "oams");
            connBuilder.Add("Data Source", "localhost");
            connBuilder.Add("User Id", "root");
            connBuilder.Add("Password", "Abcde@123");


            MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);
            connection.Open();
            MySqlDataAdapter da = new MySqlDataAdapter("select * from user_master where utmid = 4", connection);
            DataTable dt = new DataTable();
            da.Fill(dt);
            RepeatInformation.DataSource = dt;
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

            if(status == "Activated")
            {
                cmd.CommandText = "UPDATE user_master SET Activation = '" + "Deactivated" + "' WHERE UID = ' " + userid + "';";
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                    MessageBox.Show("User - "+uname+" Deactivated Successfully !");
                else
                    MessageBox.Show("Error changing the status !");
                connection.Close();
            }

            else if(status == "Deactivated")
            {
                cmd.CommandText = "UPDATE user_master SET Activation = '" + "Activated" + "' WHERE UID = ' " + userid + "';";
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                    MessageBox.Show("User - "+uname+" Activated Successfully !");
                else
                    MessageBox.Show("Error changing the status !");
                connection.Close();
            }

            Response.Redirect("~/View_users.aspx");
        }

        protected void c_admincomplaints(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            TextBox uid = item.FindControl("uid") as TextBox;
            String userid = uid.Text;
            Response.Redirect("~/admincomplaints.aspx?uid=" + Server.UrlEncode(uid.Text));
        }
    }
}