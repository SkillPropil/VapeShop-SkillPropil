using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VapeShop_SkillPropil
{
    public partial class IQOS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Ecigbt_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ecig.aspx");
        }

        protected void Pods_Click(object sender, EventArgs e)
        {
            Response.Redirect("POD.aspx");
        }

        protected void Mods_Click(object sender, EventArgs e)
        {
            Response.Redirect("MODS.aspx");

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Oformlenie.aspx");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Oformlenie.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Oformlenie.aspx");
        }

        protected void btBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Catalog.aspx");
        }

        protected void Parts_Click(object sender, EventArgs e)
        {
            Response.Redirect("Parts.aspx");
        }

        protected void Жидкость_Click(object sender, EventArgs e)
        {
            Response.Redirect("Liquor.aspx");
        }
    }
}