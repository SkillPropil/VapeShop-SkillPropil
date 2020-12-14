<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ecig.aspx.cs" Inherits="VapeShop_SkillPropil.Ecig" %>

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
            height: 560px;
            width: 526px;
        }



        sizeChanged {
            display: grid;
            grid-gap: 200px;
            grid-template-columns: repeat(auto-fit, minmax(750px,1fr));
            grid-template-rows: repeat(2,100px);
            margin-left: 10px;
        }
        .bt_Style {}
    </style>
  
</head>
<body style="background-size:100% ; background-repeat: no-repeat;">



  
   
        
        
        
    <form id="form1" runat="server">
         <asp:Button ID="btBack" runat="server" CssClass="btn btn-warning Button"
                    Text="Назад" OnClick="btBack_Click" Height="31px" Width="104px"  /><br />
        <center>
        <div class="div" style="background-image: url('https://localhost:44377/ecig.18mD1.png'); background-repeat: no-repeat; background-attachment: scroll; width: 1519px; height: 750px;">
            
        <asp:Button ID="Ecigbt" runat="server" Text="Электронные сигареты"  BackColor="#696969" ForeColor="Black" Height="77px" Width="342px" CssClass="btn Button" />
        <asp:Button ID="Pods" runat="server" Text="Pod-системы"  BackColor="#C0C0C0" ForeColor="Black" Height="77px" Width="271px" OnClick="Pods_Click" CssClass="btn Button" />
        <asp:Button ID="Mods" runat="server" Text="Моды"  BackColor="#C0C0C0" ForeColor="Black" Height="77px" Width="180px" OnClick="Mods_Click" CssClass="btn Button" />
        <asp:Button ID="IQOS" runat="server" Text="IQOS"  BackColor="#C0C0C0" ForeColor="Black" Height="77px" Width="150px" OnClick="IQOS_Click" CssClass="btn Button" />
        <asp:Button ID="Parts" runat="server" Text="Комлпектующие"  BackColor="#C0C0C0" ForeColor="Black" Height="77px" Width="269px" OnClick="Parts_Click" CssClass="btn Button" />
        <asp:Button ID="Жидкость" runat="server" Text="Жидкости"  BackColor="#C0C0C0" ForeColor="Black" Height="77px" Width="273px" OnClick="Жидкость_Click" CssClass="btn Button" />
             <br/>
             <br/>
             <br/>
             <br/>
             
            
          <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="C:\Users\Лысый\Pictures\photo_2020-06-01_22-26-34.jpg" Height="744px" Width="512px" style="margin-top: 10px;" OnClick="ImageButton2_Click" />
            
       
             
        
          <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="C:\Users\Лысый\Pictures\photo_2020-06-01_21-54-45.jpg" Height="762px" Width="480px" style="margin-top: 10px;" OnClick="ImageButton3_Click" />
  
    
        
        
        
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="C:\Users\Лысый\Pictures\photo_2020-06-01_21-59-03.jpg" Height="768px" Width="480px" style="margin-top: 0px;  margin-bottom: 0px;" BorderStyle="None" OnClick="ImageButton1_Click" />
        </div>
              </center>
          </form>
  
    
</body>
</html>

