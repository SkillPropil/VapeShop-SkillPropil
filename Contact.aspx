<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="VapeShop_SkillPropil.Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <style type="text/css">
                body {
            background: #000 url(phonk.jpg); /* Фоновый цвет и фоновый рисунок*/
            color: #fff; /*Цвет текста на странице*/
            background-attachment: fixed; /* Фон страницы фиксируется */
            background-repeat: repeat-x; /* Изображение повторяется по горизонтали */
            background-size: 100%;
        }

        .Button {
            border-radius: 5px;
        }


        .div {
            background: #fff; /* Цвет фона */
            color: #000000; /* Цвет текста */
            /* Чёрная рамка */
            padding: 10px; /* Поля вокруг текста */
            border-radius: 5px;
            height: 560px;
            width: 526px;
        }
         </style>

    <script type="text/javascript" charset="utf-8" class="div" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A45971dbbe3184895879d14d322ee5c27abc5577efe0b03b8cfcaab6e02bdab54&amp;width=1032&amp;height=610&amp;lang=ru_RU&amp;scroll=true;id:mymap"></script>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body style="height: 468px">
 <asp:Label ID ="lblTitle" runat ="server" Text= "Контакты:" 
             Font-Size ="20pt" Font-Names ="Arial" BorderStyle="None" style="margin-left: 8px"></asp:Label>
     <br />
     
    <asp:Label ID ="Label1" runat ="server" Text= "Адрес: ул.Балаклавский пр-т, д.5" 
             Font-Size ="15pt" Font-Names ="Arial" BorderStyle="None" style="margin-left: 8px"></asp:Label>
    <br />
    <asp:Label ID ="Label2" runat ="server" Text= "Режим работы: 10:00 - 22:00" 
             Font-Size ="15pt" Font-Names ="Arial" BorderStyle="None" style="margin-left: 8px"></asp:Label>
    <br />
     <asp:Label ID ="Label3" runat ="server" Text= "Телефон: 8-800-555-36-35" 
             Font-Size ="15pt" Font-Names ="Arial" BorderStyle="None" style="margin-left: 8px"></asp:Label>
    <form id="form1" runat="server" >
        <center>
        <div id="mymap" ;">
            
        </div>
          </center>
         <asp:Button ID="btBack" runat="server" CssClass="btn btn-warning Button"
                    Text="Назад" OnClick="btBack_Click" Height="40px" Width="100px"   />
    </form>
             
</body>
</html>
