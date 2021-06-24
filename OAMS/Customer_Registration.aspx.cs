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
    public partial class Customer_Registration : System.Web.UI.Page
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

                connection.Open();

                // Here goes the code needed to perform operations on the
                // database such as querying or inserting rows into a table
                cmd.CommandText = "INSERT INTO `OAMS`.`user_master`(`UTMID`,`Name`,`Email_ID`,`Phone_No`,`Gender`,`DOB`," +
                    "`Password`,`City`,`State`,`Pincode`,`Activation`)" + "VALUES(4,?Name,?emailid,?phno,?gender,?dob,?password,?city,?state,?pincode,'Activated');";
                cmd.Parameters.Add("?Name", MySqlDbType.VarString).Value = TextBox1.Text;
                cmd.Parameters.Add("?phno", MySqlDbType.VarString).Value = Int64.Parse(TextBox2.Text);
                cmd.Parameters.Add("?emailid", MySqlDbType.VarString).Value = TextBox3.Text;
                cmd.Parameters.Add("?dob", MySqlDbType.VarString).Value = TextBox7.Text;
                cmd.Parameters.Add("?gender", MySqlDbType.VarString).Value = DropDownList2.Text;
                cmd.Parameters.Add("?city", MySqlDbType.VarString).Value = TextBox9.Text;
                cmd.Parameters.Add("?state", MySqlDbType.VarString).Value = DropDownList1.Text;

                cmd.Parameters.Add("?pincode", MySqlDbType.VarString).Value = Int64.Parse(TextBox13.Text);
                if (TextBox17.Text == TextBox19.Text)
                {
                    cmd.Parameters.Add("?password", MySqlDbType.VarString).Value = TextBox17.Text;
                }
                else
                {
                    MessageBox.Show("Passwords Dont Match");
                }

                cmd.ExecuteNonQuery();

                connection.Close();
            }
            catch (MySqlException error)
            {
                MessageBox.Show(error.Message);
            }

        }
    }
}