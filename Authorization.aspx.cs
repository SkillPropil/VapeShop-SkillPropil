using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace VapeShop_SkillPropil
{
    public partial class Authorization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkConnection();
        }

        public static bool checkConnection()
        {
            SqlConnection conn = new SqlConnection(@"Data Source=LAPTOP-A2PIL339\LYSYISERVER");
            try
            {
                conn.Open();
                return true;
            }
            catch (Exception ex) { return false; }
        }
        protected void btEnter_Click(object sender, EventArgs e)
        {
            DB_Connection connection = new DB_Connection();
            connection.dbEnter(tbLogin.Text, tbPassword.Text);


            switch (DB_Connection.IDuser)
            {
                case (0):
                    tbLogin.BackColor = System.Drawing.Color.Red;
                    tbPassword.BackColor = System.Drawing.Color.Red;

                    lblTitle.Text = "Введён не верный логин или пароль!";
                    tbPassword.Text = "";
                    tbLogin.Text = "";
                    break;
                default:
                    Response.Redirect("MainMenu.aspx");
                    break;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        
    }
}