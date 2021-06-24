using System;
using System.Windows.Forms;
using MySql.Data.MySqlClient;



namespace OAMS
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

                connBuilder.Add("Database", "oams");
                connBuilder.Add("Data Source", "localhost");
                connBuilder.Add("User Id", "root");
                connBuilder.Add("Password", "Abcde@123");

                MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

                MySqlCommand cmd = connection.CreateCommand();

                
                String queryStr;
                // Here goes the code needed to perform operations on the
                // database such as querying or inserting rows into a table
                queryStr = "SELECT * FROM `OAMS`.`user_master` inner join user_type_master ON user_master.UTMID=user_type_master.UTMID where user_master.Email_ID='" + TextBox1.Text + "' and user_master.Password ='" + TextBox2.Text +"';";
                Console.WriteLine(queryStr);
                cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, connection);
                connection.Open();
                var result = cmd.ExecuteReader();
                /*Console.WriteLine(result);*/
                
                if (result.HasRows)
                {
                    result.Read();// Get first record.
                    String uname = result.GetString(2);// Get value of first column as string.
                    Session["UTMID"] = result.GetString(0);
                    Session["Role"] = result.GetString(14);
                    Session["Name"] = result.GetString(2);
                    Session["Email"] = result.GetString(3);
                    Session["uid"] = result.GetString(1);
                    Response.Redirect("update_profiles.aspx");
                }
                else
                {
                    MessageBox.Show("Invalid Emailid or Password !");
                }
                result.Close();// Close reader.

                connection.Close();
            }
            catch (MySqlException error)
            {
                MessageBox.Show(error.Message);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgot_password.aspx");
        }
    }
}