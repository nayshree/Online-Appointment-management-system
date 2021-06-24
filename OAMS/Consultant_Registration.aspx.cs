using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace OAMS
{
    public partial class Consultant_Registration : System.Web.UI.Page
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
            MySqlDataAdapter da = new MySqlDataAdapter("select Details from profession_details where Type = 'specialization'", connection);
            DataSet ds = new DataSet();
            da.Fill(ds,"Table");
            for(int i=0; i<ds.Tables[0].Rows.Count - 1;i++)
            {
                ListBox1.Items.Add(new ListItem(ds.Tables[0].Rows[i]["Details"].ToString()));
            }

            MySqlDataAdapter da2 = new MySqlDataAdapter("select Details from profession_details where Type = 'qualification'", connection);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2, "Table");
            for (int i = 0; i < ds2.Tables[0].Rows.Count - 1; i++)
            {
                ListBox2.Items.Add(new ListItem(ds2.Tables[0].Rows[i]["Details"].ToString()));
            }
            connection.Close();
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

           
            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

                connBuilder.Add("Database", "OAMS");
                connBuilder.Add("Data Source", "contra.cjrbdmxkv84s.ap-south-1.rds.amazonaws.com");
                connBuilder.Add("User Id", "admin");
                connBuilder.Add("Password", "MiloniMadhav");

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
                cmd.Parameters.Add("?dob", MySqlDbType.VarString).Value = TextBox4.Text;
                cmd.Parameters.Add("?gender", MySqlDbType.VarString).Value = TextBox5.Text;
                cmd.Parameters.Add("?city", MySqlDbType.VarString).Value = TextBox6.Text;
                cmd.Parameters.Add("?state", MySqlDbType.VarString).Value = DropDownList1.Text;

                cmd.Parameters.Add("?pincode", MySqlDbType.VarString).Value = Int64.Parse(TextBox8.Text);
                if (TextBox10.Text == TextBox9.Text)
                {
                    cmd.Parameters.Add("?password", MySqlDbType.VarString).Value = TextBox10.Text;
                }
                else
                {
                    MessageBox.Show("Passwords Dont Match");
                }

               int x = cmd.ExecuteNonQuery();
                if(x >0)
                {
                    MessageBox.Show("Successfully Registered.");
                }

                else
                {
                    MessageBox.Show("something wrong has happened");
                }
                connection.Close();
           
        }
    }
}