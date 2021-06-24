using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace OAMS
{
    public partial class book_appointment : System.Web.UI.Page
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

            cmd.CommandText = "SELECT * FROM OAMS.profession_master join OAMS.consultant_master on OAMS.profession_master.cid = OAMS.consultant_master.cid join OAMS.user_master on OAMS.consultant_master.uid = OAMS.user_master.uid join OAMS.schedule on OAMS.schedule.CID = OAMS.consultant_master.CID where OAMS.profession_master.Profession_Type_ID = '2' or OAMS.profession_master.Profession_Type_ID ='1' ; ";
            connection.Open();
            book_appoint.DataSource = cmd.ExecuteReader();
            book_appoint.DataBind();
            connection.Close();

        }


        protected void get_profession(object sender, EventArgs e)
        {

            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

            connBuilder.Add("Database", "OAMS");
            connBuilder.Add("Data Source", "contra.cjrbdmxkv84s.ap-south-1.rds.amazonaws.com");
            connBuilder.Add("User Id", "admin");
            connBuilder.Add("Password", "MiloniMadhav");

            MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

            MySqlCommand cmd = connection.CreateCommand();

            int h1 = Int32.Parse(select1.SelectedValue.ToString());
            if (h1 == 0)
            {
                cmd.CommandText = "SELECT * FROM OAMS.profession_master join OAMS.consultant_master on OAMS.profession_master.cid = OAMS.consultant_master.cid join OAMS.user_master on OAMS.consultant_master.uid = OAMS.user_master.uid join OAMS.schedule on OAMS.schedule.CID = OAMS.consultant_master.CID where OAMS.profession_master.Profession_Type_ID = '2' or OAMS.profession_master.Profession_Type_ID ='1' ; ";
            }
            else
            {
                cmd.CommandText = "SELECT * FROM OAMS.profession_master join OAMS.consultant_master on OAMS.profession_master.cid = OAMS.consultant_master.cid join OAMS.user_master on OAMS.consultant_master.uid = OAMS.user_master.uid join OAMS.schedule on OAMS.schedule.CID = OAMS.consultant_master.CID where OAMS.profession_master.Profession_Type_ID = '" + h1 + "'; ";
            }

            connection.Open();
            book_appoint.DataSource = cmd.ExecuteReader();
            book_appoint.DataBind();
            connection.Close();

            

        }

        protected void user_booking(object sender, EventArgs e)
        {
            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();

            connBuilder.Add("Database", "OAMS");
            connBuilder.Add("Data Source", "contra.cjrbdmxkv84s.ap-south-1.rds.amazonaws.com");
            connBuilder.Add("User Id", "admin");
            connBuilder.Add("Password", "MiloniMadhav");

            MySqlConnection connection = new MySqlConnection(connBuilder.ConnectionString);

            MySqlCommand cmd = connection.CreateCommand();


            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;



            System.Web.UI.WebControls.TextBox var1 = item.FindControl("cid") as TextBox;
            TextBox var2 = item.FindControl("date1") as TextBox;
            TextBox var3 = item.FindControl("time1") as TextBox;
            String date1 = var2.Text;
            String time1 = var3.Text;
            String cid = var1.Text;
            cmd.CommandText = "insert into OAMS.appointment_master(uid,cid,date,time,status) values('" + Session["uid"] + "','" + cid + "','" + date1 + "','" + time1 + "','pending' );";
            connection.Open();
            int x = cmd.ExecuteNonQuery();
            if (x>0)
            {
                System.Windows.Forms.MessageBox.Show("Request has been registered");
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("Something's wrong!");
            }
               
            connection.Close();

        }
    }

}