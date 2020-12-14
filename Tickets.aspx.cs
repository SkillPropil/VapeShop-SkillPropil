using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace VapeShop_SkillPropil
{
    public partial class Tickets : System.Web.UI.Page
    {
        private string QR = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            QR = DB_Connection.qrTickets;
            if (!IsPostBack)
            {
                gvFill(QR);
                FillDropLists1();
                FillDropLists2();
            }
        }

        private void gvFill(string qr)
        {
            sdsTickets.ConnectionString = DB_Connection.connection.ConnectionString.ToString();
            sdsTickets.SelectCommand = qr;
            sdsTickets.DataSourceMode = SqlDataSourceMode.DataReader;
        }

        public void FillDropLists1()
        {
            sdsVape.ConnectionString = DB_Connection.connection.ConnectionString.ToString();
            sdsVape.DataSourceMode = SqlDataSourceMode.DataReader;

        }

        public void FillDropLists2()
        {
            sdsClient.ConnectionString = DB_Connection.connection.ConnectionString.ToString();
            sdsClient.DataSourceMode = SqlDataSourceMode.DataReader;


        }

        protected void btInsert_Click(object sender, EventArgs e)
        {
            bool err = false;

            List<TextBox> textBoxes = new List<TextBox>();
            textBoxes.Add(tbName);
            textBoxes.Add(tbPhone);
            textBoxes.Add(tbModel);

            if (!err)
            {
                SqlCommand command = new SqlCommand("", DB_Connection.connection);


                int Vape_ID = int.Parse(lstVape.SelectedValue);
                int Client_ID = int.Parse(lstClient.SelectedValue);

                command.CommandText = "INSERT INTO [dbo].[Rent_Tickets] ([Name_of_Client],[Phone],[Vape_Model],[BankCard],[Vape_ID],[Client_ID]) values ('" + tbName.Text + "','" + tbPhone.Text + "','"+ tbModel.Text + "','" + tbBankCard.Text + "','" + lstVape.SelectedValue + "','" + lstClient.SelectedValue + "')";



                DB_Connection.connection.Open();
                command.ExecuteNonQuery();
                DB_Connection.connection.Close();
                gvFill(QR);
                Response.Redirect("Zayava.aspx");

            }

           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");
        }

        protected void btBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainMenu.aspx");
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Devices.aspx");
        }
    }
}