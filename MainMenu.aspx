<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="VapeShop_SkillPropil.MainMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
       .Button {
            border-radius: 5px;
        }

        body {
            background: #000 url(phonk.jpg); /* Фоновый цвет и фоновый рисунок*/
            color: #fff; /*Цвет текста на странице*/
            background-attachment: fixed; /* Фон страницы фиксируется */
            background-repeat: repeat-x; /* Изображение повторяется по горизонтали */
            background-size: 100%;
        }

           .div {
            background: #fff; /* Цвет фона */
            color: #000000; /* Цвет текста */
            /* Чёрная рамка */
            padding: 10px; /* Поля вокруг текста */
            border-radius: 5px;
            height: 1080px;
            width: 1920px;
        }



        sizeChanged {
            display: grid;
            grid-gap: 200px;
            grid-template-columns: repeat(auto-fit, minmax(750px,1fr));
            grid-template-rows: repeat(2,100px);
            margin-left: 10px;
        }
        }
    </style>
</head>
<body style="background-size:100% ; background-repeat: no-repeat;">



  
   
        
        
        
    <form id="form1" runat="server">


        <asp:Button ID="btBack" runat="server" CssClass="btn Button btn-warning"
            OnClick="btBack_Click" Text="Назад" ToolTip="Обратно к авторизации" />
        
        <div class="div"; style="background-image: url('https://localhost:44377/главное_меню.ZIxkC.png'); background-size:100%; background-repeat: no-repeat; background-attachment: scroll; margin-right: 45px;">
            
        

            <br />
          <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="C:\Users\Лысый\Desktop\КУРСАЧ/ИБ1.jpg" Height="314px" Width="296px" style="margin-top: 102px; margin-left: 77px;" OnClick="ImageButton2_Click" />
          <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="C:\Users\Лысый\Desktop\КУРСАЧ/ИБ2.jpg" Height="318px" Width="443px" style="margin-top: 102px; margin-right: 107px; margin-left: 138px;" OnClick="ImageButton3_Click" />
  
    
        
        
        
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="C:\Users\Лысый\Desktop\КУРСАЧ/ИБ3.jpg" Height="253px" Width="410px" style="margin-top: 28px; margin-bottom: 0px;" OnClick="ImageButton1_Click" BorderStyle="None" />
        </div>
          
          </form>
  
    
</body>
</html>
