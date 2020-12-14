<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Oformlenie.aspx.cs" Inherits="VapeShop_SkillPropil.Oformlenie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
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
            height: 440px;
            width: 526px;
        }


        sizeChanged {
            display: grid;
            grid-gap: 200px;
            grid-template-columns: repeat(auto-fit, minmax(750px,1fr));
            grid-template-rows: repeat(2,100px);
            margin-left: 10px;
        }
    </style>
</head>
</head>
<body>
      <form id="Tickets" runat="server">
      <asp:SqlDataSource ID="sdsTickets" runat="server"></asp:SqlDataSource>
          <asp:Button ID="btBack" runat="server" CssClass="btn btn-warning"
                    Text="Назад"  Height="35px" Width="91px" OnClick="btBack_Click"  /> 
        <center>
            <br/>
            

            <asp:Label ID ="lblTitle" runat ="server" Text= "Оформление заявки" 
             Font-Size ="20pt" Font-Names ="Arial" ForeColor="Black"></asp:Label>
            <div class="div">


              <br/>
             <asp:Label ID="Label4" runat="server"
                    Text="Лицевой счет для перевода" CssClass="font_style" ForeColor="Black"></asp:Label>
             <br/>

                
                <asp:DropDownList ID="lstClient" runat="server" DataSourceID="sdsClient" DataTextField="CardNumber" DataValueField="ID_Client" style="margin-left: 0px" Height="27px" Width="236px">
                </asp:DropDownList>
            
             <br/>
             <asp:SqlDataSource ID="sdsClient" runat="server"
                    SelectCommand="SELECT ID_Client, CardNumber FROM Client"></asp:SqlDataSource>
            <br/>
               <asp:Label ID="Label5" runat="server"
                    Text="Модель испарителя" CssClass="font_style" ForeColor="Black"></asp:Label>
             <br/>
                

                
                <asp:DropDownList ID="lstVape" runat="server" DataSourceID="sdsVape" DataTextField="Name" DataValueField="ID_Vape" style="margin-left: 0px" Height="27px" Width="236px">
                </asp:DropDownList><br />
             <asp:SqlDataSource ID="sdsVape" runat="server"
                    SelectCommand="SELECT ID_Vape , Name FROM Vape"></asp:SqlDataSource>
            
                 <asp:Label ID="Label3" runat="server"
                    Text="Номер карты" CssClass="font_style" ForeColor="Black"></asp:Label>
                <br />

                
                <asp:TextBox ID="tbCard" runat="server" DataSourceID="sdsClient" DataTextField="CardNumber" DataValueField="ID_Client" Height="27px" style="margin-left: 0px" Width="236px" ForeColor="#999999">0000 0000 0000 0000</asp:TextBox>
            <br />

            <asp:Label ID="lblName" runat="server"
                    Text="Имя" CssClass="font_style" ForeColor="Black"></asp:Label>
             <br />
                <asp:TextBox ID="tbName" runat ="server" style="margin-left: 0px" Height="27px" Width="236px" ForeColor="#999999"></asp:TextBox>
                <br />
            <asp:Label ID="Label1" runat="server"
                    Text="Номер телефона" CssClass="font_style" ForeColor="Black"></asp:Label>
             <br />
                <asp:TextBox ID="tbPhone" runat ="server" style="margin-left: 0px" Width="236px" ForeColor="#999999" Height="27px">+7-   -   -  -  -</asp:TextBox>
                <br />
            <asp:Label ID="Label2" runat="server"
                    Text="Тип испарителя" CssClass="font_style" ForeColor="Black"></asp:Label>
             <br />
                <asp:TextBox ID="tbModel" runat ="server" style="margin-left: 0px" Width="236px" Height="27px"></asp:TextBox>
                <br />
            <br />
            <asp:Button ID ="btInsert" runat ="server" 
                        CssClass ="btn btn-danger" Text ="Оформить заявку" OnClick="btInsert_Click"  />
        </center>
          </div>
       
            
             
           
    </form>
    
</body>
</html>
