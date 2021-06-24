using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
namespace OAMS
{
    public partial class User_viewappointment : System.Web.UI.Page
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

            cmd.CommandText = "select appointment_master.status,consultant_master.city,consultant_master.add_line1,consultant_master.add_line2,Email_ID,Name,time,consultant_master.uid,DATE(appointment_master.date) as 'AppDate' from OAMS.appointment_master join OAMS.consultant_master on appointment_master.cid=consultant_master.cid join OAMS.user_master on consultant_master.uid=user_master.uid where appointment_master.uid=" + Session["uid"] + ";";
            connection.Open();
            userappointment.DataSource = cmd.ExecuteReader();

            userappointment.DataBind();
            connection.Close();
        }
    }
}