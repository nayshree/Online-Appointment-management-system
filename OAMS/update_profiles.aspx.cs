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
    public partial class update_profile: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
                    queryStr = "SELECT Name,Email_ID,Password,Gender,Phone_No,City,State,Pincode FROM `OAMS`.`user_master` where user_master.Email_ID='" + Session["Email"] + "';";

                    cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, connection);
                    connection.Open();
                    var result = cmd.ExecuteReader();
                    /*result.GetValue(result.GetOrdinal("CustomerID"));*/
                    Console.WriteLine(result);
                    if (result.HasRows)
                    {
                        while (result.Read())
                        {
                            Name.Value = result.GetString(0);
                            email.Value = result.GetString(1);
                            password.Value = result.GetString(2);
                            gender.Value = result.GetString(3);
                            phone.Value = result.GetString(4).ToString();
                            city.Value = result.GetString(5);
                            state.Value = result.GetString(6);
                            pincode.Value = result.GetString(7);

                        }
                    }

                }
                catch (MySqlException error)
                {
                    MessageBox.Show(error.Message);
                }
            
        }
        protected void Submit(object sender, EventArgs e)
        {
            try
            {
                string name = Name.Value;

                MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

                connBuilder.Add("Database", "OAMS");
                connBuilder.Add("Data Source", "contra.cjrbdmxkv84s.ap-south-1.rds.amazonaws.com");
                connBuilder.Add("User Id", "admin");
                connBuilder.Add("Password", "MiloniMadhav");

                MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

                MySqlCommand cmd = connection.CreateCommand();
                connection.Open();

                
                
                cmd.CommandText = "UPDATE `OAMS`.`user_master` SET `Name` =@Name," +
                    "`Email_ID` = @emailid,`Phone_No` = @phone,`Gender` = @gender," +
                    "`Password` = @password,`City` = @city,`State` = @state,`Pincode` = @pincode" +
                    " WHERE `Email_ID` = @sessEmail;";

                cmd.Parameters.Add("@Name", MySqlDbType.VarString).Value = Name.Value;
                cmd.Parameters.Add("@emailid", MySqlDbType.VarString).Value = email.Value;
                cmd.Parameters.Add("@phone", MySqlDbType.VarString).Value = phone.Value;
                cmd.Parameters.Add("@gender", MySqlDbType.VarString).Value = gender.Value;
                cmd.Parameters.Add("@password", MySqlDbType.VarString).Value = password.Value;
                cmd.Parameters.Add("@city", MySqlDbType.VarString).Value = city.Value;
                cmd.Parameters.Add("@state", MySqlDbType.VarString).Value = state.Value;
                cmd.Parameters.Add("@pincode", MySqlDbType.VarString).Value = pincode.Value;


                /* cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, connection);*/
                connection.Open();
                var result = cmd.ExecuteNonQuery();
            }
            catch (Exception error)
            {
                MessageBox.Show(error.Message);
            }
            
        }
    }
}