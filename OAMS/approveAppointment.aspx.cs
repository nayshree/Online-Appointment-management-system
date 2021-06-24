using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace OAMS
{
    public partial class approveAppointment : System.Web.UI.Page
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
            String queryStr;
            queryStr = "select CID from user_master inner join consultant_master ON user_master.UID=consultant_master.UID where user_master.Email_ID='" + Session["Email"] + "';";
            Int32 CID = 0;
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, connection);
            connection.Open();
            var result = cmd.ExecuteReader();
            if (result.HasRows)
            {
                while (result.Read())
                {
                     CID = result.GetInt32(0);
                }
            }
            connection.Close();

            
            cmd.CommandText = "select *,DATE(dob) as 'DateOfBirth' from appointment_master inner join user_master ON user_master.UID=appointment_master.UID where appointment_master.CID="+ CID + ";";
            connection.Open();
            appointments.DataSource = cmd.ExecuteReader();
            appointments.DataBind();
            connection.Close();
        }
        protected void changeAppointment(object sender, EventArgs e)
        {
            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

            connBuilder.Add("Database", "OAMS");
            connBuilder.Add("Data Source", "contra.cjrbdmxkv84s.ap-south-1.rds.amazonaws.com");
            connBuilder.Add("User Id", "admin");
            connBuilder.Add("Password", "MiloniMadhav");

            MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

            MySqlCommand cmd = connection.CreateCommand();
            connection.Open();
            try
            {
                LinkButton btn = (LinkButton)sender;
                var btn1 = btn.CommandArgument;
                var btn1_Text = btn.Text;
                MessageBox.Show("Running"+btn1.ToString()+btn1_Text);
                cmd.CommandText = "UPDATE `OAMS`.`appointment_master` SET Status=@Status where AID=@AID;";
                cmd.Parameters.Add("@status", MySqlDbType.VarString).Value = "Approved";
                cmd.Parameters.Add("@AID", MySqlDbType.VarString).Value = btn1;

                cmd.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception ex)
            { 
                MessageBox.Show("Can not open connection ! " + ex.ToString());
            }
        }
        }
}