using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Threading.Tasks;

namespace VapeShop_SkillPropil
{
    public partial class Registration : System.Web.UI.Page
    {
        private string QR = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            QR = DB_Connection.qrClient;
            if (!IsPostBack)
            {
                gvFill(QR);
         
            }
        }

        private void gvFill(string qr)
        {
            sdsAuthorization.ConnectionString = DB_Connection.connection.ConnectionString.ToString();
            sdsAuthorization.SelectCommand = qr;
            sdsAuthorization.DataSourceMode = SqlDataSourceMode.DataReader;
        }

        async Task<bool> Symb(string str)
        {
            bool znach = true;
            await Task.Run(() =>
            {
                if (str.Contains("!") || str.Contains("@") || str.Contains("#") || str.Contains("$") ||
                str.Contains("%") || str.Contains("^") || str.Contains("&") || str.Contains("*") ||
                    str.Contains("(") || str.Contains(")") || str.Contains("_") || str.Contains("+") ||
                str.Contains("=") || str.Contains("%"))
                    znach = false;
            });
            return znach;
        }

        async Task<bool> Symb1(string str)
        {
            bool znach = true;
            await Task.Run(() =>
            {
                if (str.Contains("1") || str.Contains("2") || str.Contains("3") || str.Contains("4") ||
                str.Contains("5") || str.Contains("6") || str.Contains("7") || str.Contains("8") ||
                    str.Contains("9") || str.Contains("0"))
                    znach = false;
            });
            return znach;
        }

        async Task<bool> Symb2(string str)
        {
            bool znach = true;
            await Task.Run(() =>
            {
                if (str.Contains("Q") || str.Contains("W") || str.Contains("E") || str.Contains("R") ||
                str.Contains("T") || str.Contains("Y") || str.Contains("U") || str.Contains("I") ||
                    str.Contains("O") || str.Contains("P") || str.Contains("A") || str.Contains("S") || str.Contains("D") || str.Contains("F") ||
                str.Contains("G") || str.Contains("H") || str.Contains("J") || str.Contains("K") ||
                    str.Contains("L") || str.Contains("Z") || str.Contains("X") || str.Contains("C") || str.Contains("V") || str.Contains("B") ||
                    str.Contains("N") || str.Contains("M"))
                    znach = false;
            });
            return znach;
        }

        protected async void btEnter_Click(object sender, EventArgs e)
        {
            bool znach1 = await Symb(tbPassword.Text);
            bool znach2 = await Symb1(tbPassword.Text);
            bool znach3 = await Symb2(tbPassword.Text);
            bool err = false;
          

            List<TextBox> textBoxes = new List<TextBox>();
            textBoxes.Add(tbLogin);
            textBoxes.Add(tbPassword);
            textBoxes.Add(tbSurname);
            textBoxes.Add(tbName);
            textBoxes.Add(tbMiddle);
            textBoxes.Add(tbCardNumber);
            textBoxes.Add(tbPhone);
            

            if (tbName.Text == "")
            {
                lblTitle.Text = "Не введено новое значение";

            }
            else
            {
                foreach (TextBox textBox in textBoxes)
                {
                    textBox.BackColor = System.Drawing.Color.Red;
                    if (textBox.Text.Length > 30 || textBox.Text == "")
                    {

                        textBox.BackColor = System.Drawing.Color.Red;
                        err = true;
                    }
                }

                if (znach1 || tbPassword.Text.Length < 5 || znach2 || znach3)
                {
                    err = true;
                    tbPassword.BackColor = System.Drawing.Color.Red;
                    lblTitle.Text = "Неверный формат ввода";
                }
                SqlCommand command = new SqlCommand("", DB_Connection.connection);

                command.CommandText = "INSERT INTO [dbo].[Client] ([LoginC],[PasswordC],[Surname],[Name],[Middle_Name],[CardNumber],[Phone]) values ('" + tbLogin.Text +  "','"  + tbPassword.Text  + "','" + tbSurname.Text + "','"  + tbName.Text + "','" + tbMiddle.Text + "','" + tbCardNumber.Text  + "','" + tbPhone.Text + "')";



                DB_Connection.connection.Open();
                command.ExecuteNonQuery();
                DB_Connection.connection.Close();
                gvFill(QR);
                Response.Redirect("Authorization.aspx");

            }
        }
    }
}