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

    public partial class Devices : System.Web.UI.Page
    {
        private string QR = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            QR = DB_Connection.qrWarehouse;
            if (!IsPostBack)
            {
                gvFill(QR);
               
            }
        }

        private void gvFill(string qr)
        {
            sdsVape.ConnectionString = DB_Connection.connection.ConnectionString.ToString();
            sdsVape.SelectCommand = qr;
            sdsVape.DataSourceMode = SqlDataSourceMode.DataReader;
            gvVape.DataSource = sdsVape;
            gvVape.DataBind();
        }

        protected void btBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainMenu.aspx");
        }

        protected void gvVape_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            e.Row.Cells[7].Visible = false;
            e.Row.Cells[8].Visible = false;

        }

    }
}