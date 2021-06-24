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
    public partial class viewAppointment : System.Web.UI.Page
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


            cmd.CommandText = "select *,DATE(dob) as 'DateOfBirth' from appointment_master inner join user_master ON user_master.UID=appointment_master.UID where appointment_master.CID=" + CID + " and appointment_master.Status='Approved';";
            connection.Open();
            Viewappointments.DataSource = cmd.ExecuteReader();
            Viewappointments.DataBind();
            connection.Close();
        }
    }
    }
