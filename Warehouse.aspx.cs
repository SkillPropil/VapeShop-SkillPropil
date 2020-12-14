using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using iTextSharp.text;
using System.Configuration;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Web.UI.HtmlControls;

namespace VapeShop_SkillPropil
{
    public partial class Warehouse : System.Web.UI.Page
    {
        private string QR = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            QR = DB_Connection.qrWarehouse;
            if (!IsPostBack)
            {
                gvFill(QR);

                FillDropLists1();
                FillDropLists2();
            }
        }

        protected void gvWarehouse_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvWarehouse.SelectedRow;
            tbQuantity.Text = row.Cells[2].Text.ToString();
            tbUnit.Text = row.Cells[3].Text.ToString();


            lstVape.SelectedValue = row.Cells[7].Text;
            lstSupply.SelectedValue = row.Cells[8].Text;
            DB_Connection.IDrecord = Convert.ToInt32(row.Cells[1].Text.ToString());
        }

        protected void gvWarehouse_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            e.Row.Cells[7].Visible = false;
            e.Row.Cells[8].Visible = false;
        }

        protected void gvWarehouse_Sorting(object sender, GridViewSortEventArgs e)
        {
            SortDirection sortDirection = SortDirection.Ascending;
            string strField = string.Empty;
            switch (e.SortExpression)
            {
                case ("Количество"):
                    e.SortExpression = "[Product_Quantity]";
                    break;
                case ("Наименование поставщика"):
                    e.SortExpression = "[Name_of_Supplyer]";
                    break;
                case ("Электронный испаритель"):
                    e.SortExpression = "[Name]";
                    break;
                case ("Ед.Измерения"):
                    e.SortExpression = "[Unit]";
                    break;
            }
            sortGridView(gvWarehouse, e, out sortDirection, out strField);
            string strDirection = sortDirection
                == SortDirection.Ascending ? "ASC" : "DESC";
            gvFill(QR + " order by " + e.SortExpression + " " + strDirection);
        }

        private void sortGridView(GridView gridView,
          GridViewSortEventArgs e,
          out SortDirection sortDirection,
          out string strSortField)
        {
            strSortField = e.SortExpression;
            sortDirection = e.SortDirection;

            if (gridView.Attributes["CurrentSortField"] != null &&
                gridView.Attributes["CurrentSortDirection"] != null)
            {
                if (strSortField ==
                    gridView.Attributes["CurrentSortField"])
                {
                    if (gridView.Attributes["CurrentSortDirection"]
                        == "ASC")
                    {
                        sortDirection = SortDirection.Descending;
                    }
                    else
                    {
                        sortDirection = SortDirection.Ascending;
                    }
                }
            }
            gridView.Attributes["CurrentSortField"] = strSortField;
            gridView.Attributes["CurrentSortDirection"] =
                (sortDirection == SortDirection.Ascending ? "ASC"
                : "DESC");
        }

        private void gvFill(string qr)
        {
            sdsWarehouse.ConnectionString = DB_Connection.connection.ConnectionString.ToString();
            sdsWarehouse.SelectCommand = qr;
            sdsWarehouse.DataSourceMode = SqlDataSourceMode.DataReader;
            gvWarehouse.DataSource = sdsWarehouse;
            gvWarehouse.DataBind();

        }

        public void FillDropLists1()
        {
            sdsVape.ConnectionString = DB_Connection.connection.ConnectionString.ToString();
            sdsVape.DataSourceMode = SqlDataSourceMode.DataReader;

        }

        public void FillDropLists2()
        {
            sdsSupply.ConnectionString = DB_Connection.connection.ConnectionString.ToString();
            sdsSupply.DataSourceMode = SqlDataSourceMode.DataReader;


        }


        protected void btInsert_Click(object sender, EventArgs e)
        {
            bool err = false;

            List<TextBox> textBoxes = new List<TextBox>();
            textBoxes.Add(tbQuantity);
            textBoxes.Add(tbUnit);
            



            if (!err)
            {
                SqlCommand command = new SqlCommand("", DB_Connection.connection);


                int Vape_ID = int.Parse(lstVape.SelectedValue);
                int Supply_ID = int.Parse(lstSupply.SelectedValue);

                command.CommandText = "INSERT INTO [dbo].[Warehouse] ([Product_Quantity],[Unit],[Vape_ID],[Supply_ID]) values ('" + tbQuantity.Text + "','" + tbUnit.Text + "','" + lstVape.SelectedValue + "','" + lstSupply.SelectedValue + "')";



                DB_Connection.connection.Open();
                command.ExecuteNonQuery();
                DB_Connection.connection.Close();
                Response.Redirect(Request.RawUrl);
                gvFill(QR);

            }

        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            switch (tbQuantity.Text == "")
            {
                case (true):
                    tbQuantity.BackColor = System.Drawing.Color.Red;
                    break;
                case (false):
                    tbQuantity.BackColor = System.Drawing.Color.White;
                    switch (tbUnit.Text == "")
                    {
                        case (true):
                            tbUnit.BackColor = System.Drawing.Color.Red;
                            break;
                        case (false):
                            tbUnit.BackColor = System.Drawing.Color.White;
                            SqlCommand command = new SqlCommand("", DB_Connection.connection);
                            command.CommandText = "update [dbo].[Warehouse] set " +
                                "[Product_Quantity] ='" + tbQuantity.Text + "', " +
                                "[Unit] ='" + tbUnit.Text + "', " +
                                "[Vape_ID] ='" + lstVape.SelectedValue + "', " +
                                "[Supply_ID] ='" + lstSupply.SelectedValue + "' " +
                                " where ID_Warehouse = " + DB_Connection.IDrecord + "";

                            DB_Connection.connection.Open();
                            command.ExecuteNonQuery();
                            DB_Connection.connection.Close();
                            gvFill(QR);
                            Response.Redirect(Request.RawUrl);
                            break;
                    }
                    break;
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand("", DB_Connection.connection);
            command.CommandText = "delete from [dbo].[Warehouse] " +
                "where ID_Warehouse = " + DB_Connection.IDrecord + "";
            DB_Connection.connection.Open();
            command.ExecuteNonQuery();
            DB_Connection.connection.Close();
            gvFill(QR);
            Response.Redirect(Request.RawUrl);
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvWarehouse.Rows)
            {
                if (row.Cells[2].Text.Equals(tbSearch.Text)
                    || row.Cells[2].Text.Equals(tbSearch.Text)
                    || row.Cells[3].Text.Equals(tbSearch.Text)
                    || row.Cells[4].Text.Equals(tbSearch.Text)
                    || row.Cells[5].Text.Equals(tbSearch.Text))
                    //|| row.Cells[10].Text.Equals(tbSearch.Text)
                    //|| row.Cells[13].Text.Equals(tbSearch.Text)
                    //|| row.Cells[16].Text.Equals(tbSearch.Text)
                    //|| row.Cells[19].Text.Equals(tbSearch.Text)
                    //|| row.Cells[13].Text.Equals(tbSearch.Text))
                    ////|| row.Cells[18].Text.Equals(tbSearch.Text))

                    row.BackColor = System.Drawing.Color.Green;
                else
                    row.BackColor = System.Drawing.Color.White;
            }
        }

        protected void btFilter_Click(object sender, EventArgs e)
        {
            string newQr = QR + " where [Product_Quantity] like '%" + tbSearch.Text + "%' or " + "[Name] like '%" + tbSearch.Text + "%' or " + "[Name_of_Supplyer] like '%" + tbSearch.Text + "%' or " + "[Unit] like '%" + tbSearch.Text + "%'";


            gvFill(newQr);
        }

        protected void btCancel_Click(object sender, EventArgs e)
        {
            tbSearch.Text = "";
            btSearch_Click(sender, e);
            gvFill(QR);



            gvWarehouse.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            GridView gv = new GridView();
            GridView gridView = gvWarehouse;
            DB_Connection.connection.Open();
            gv.DataSource = sdsWarehouse;
            DB_Connection.connection.Close();
            gvFill(QR);





            gv.DataBind();

            Response.ClearContent();
            Response.Buffer = true;
            gvWarehouse.AllowPaging = false;
            Response.AddHeader("content-disposition", "attachment; filename=" + DateTime.Now.ToShortDateString() + ".xls");
            Response.ContentType = "application/vnd.ms-excel";
            Response.ContentEncoding = System.Text.Encoding.Unicode;
            Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gv.RenderControl(htw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
            //Response.Clear();
            //Response.Buffer = true;
            //Response.Charset = "";
            //Response.AddHeader("content-disposition", "attachment;filename= Warehouse.xls");
            //Response.ContentType = "application/ms-excel";
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter hw = new HtmlTextWriter(sw);

            //gvWarehouse.AllowPaging = false;
            //gvWarehouse.DataBind();

            //Response.Output.Write(sw.ToString());
            //Response.Flush();
            //Response.End();
        }

        protected void btBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainMenu.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            ExportGridToPDF();

        }

        [Obsolete]
        private void ExportGridToPDF()
        {


            GridView gv = new GridView();
            GridView gridView = gvWarehouse;
            DB_Connection.connection.Open();
            gv.DataSource = sdsWarehouse;
            DB_Connection.connection.Close();
            gvFill(QR);





            gvWarehouse.DataBind();
            Response.ClearContent();
            Response.Buffer = true;
            gvWarehouse.AllowPaging = false;
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition",
             "attachment;filename=GridViewExport.pdf");
            gvWarehouse.HeaderStyle.Font.Bold = true;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            gvWarehouse.AllowPaging = false;
            gv.DataBind();
            gv.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            StringReader sr = new StringReader(sw.ToString());
            FontFactory.Register("C:\\Users\\Лысый\\Downloads\\arial.ttf"); // путь к файлу шрифтa
            Document pdfDoc = new Document(PageSize.A4, 7f, 7f, 7f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.Flush();
            Response.End();
        }

        

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            GridView gv = new GridView();
            GridView gridView = gvWarehouse;
            DB_Connection.connection.Open();
            gv.DataSource = sdsWarehouse;
            DB_Connection.connection.Close();
            gvFill(QR);


            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Vithal" + DateTime.Now + ".doc";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/msword";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            gvWarehouse.GridLines = GridLines.Both;
            gvWarehouse.HeaderStyle.Font.Bold = true;
            gvWarehouse.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
    }
}

    

