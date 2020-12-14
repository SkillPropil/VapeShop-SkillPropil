<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zayava.aspx.cs" Inherits="VapeShop_SkillPropil.Zayava" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
           height: 750px;
            width: 1519px;
           
           
        }
    </style>
</head>
<body style="background-position: 750px 1519px; height: 750px; width: 1519px;  background-repeat: no-repeat;">

    
            <asp:Label ID ="lblTitle" runat ="server" Text= "Заявка оформлена" 
             Font-Size ="20pt" Font-Names ="Arial" BorderStyle="None" style="margin-left: 406px"></asp:Label>
    <form id="form1" runat="server">
          <asp:Button ID="btBack" runat="server" CssClass="bt_Style"
                    Text="Назад" OnClick="btBack_Click" /><br />
        <div
            style="                background-image: url('https://localhost:44377/типа_заява.IJcLE.png');
                background-position: center center;
                background-repeat: no-repeat;
                background-attachment: scroll;
                height: 750px;
                width: 1519px;">
           
                <br />
        </div>
    </form>
</body>
</html>
