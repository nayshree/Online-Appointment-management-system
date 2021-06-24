using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace OAMS
{
    public partial class forgot_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendEmail(object sender, EventArgs e)
        {
            string Name = string.Empty;
            string password = string.Empty;


            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

            connBuilder.Add("Database", "oams");
            connBuilder.Add("Data Source", "localhost");
            connBuilder.Add("User Id", "root");
            connBuilder.Add("Password", "Abcde@123");

            MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

            MySqlCommand cmd = connection.CreateCommand();


            String queryStr;
            String emailid = txtEmail.Text;
            // Here goes the code needed to perform operations on the
            // database such as querying or inserting rows into a table
            queryStr = "Select Name,Password FROM user_master Where Email_ID = '"+emailid+"'";
            
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, connection);
            connection.Open();
            var result = cmd.ExecuteReader();
            /*Console.WriteLine(result);*/

            if (result.HasRows)
            {
                Name = result["Name"].ToString();
                password = result["Password"].ToString();
            }

            
            if (!string.IsNullOrEmpty(password))
            {
                MailMessage mm = new MailMessage("sender@gmail.com", txtEmail.Text.Trim());
                mm.Subject = "Password Recovery";
                mm.Body = string.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You.", Name, password);
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential();
                NetworkCred.UserName = "sender@gmail.com";
                NetworkCred.Password = "<Password>";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);

                MessageBox.Show("Password has been sent to your email address.");
            }
            else
            {
                MessageBox.Show("This email address does not match our records.");
            }
        }
    }
}