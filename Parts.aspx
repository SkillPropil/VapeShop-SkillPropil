<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parts.aspx.cs" Inherits="VapeShop_SkillPropil.Parts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 750px;
            width: 1519px;
            margin-right: 172px;
        }
    </style>
 </style>
</head>
<body style="background-position: 750px 1519px; height: 750px; width: 1519px;  background-repeat: no-repeat;">



  
   
        
        
        
    <form id="form1" runat="server">
         <asp:Button ID="btBack" runat="server" CssClass="bt_Style"
                    Text="Назад" OnClick="btBack_Click"   /><br />
        <div style="background-image: url('https://localhost:44377/parts.YvZGp.png'); background-repeat: no-repeat; background-attachment: scroll; width: 1519px; height: 921px;">
            
        <asp:Button ID="Ecigbt" runat="server" Text="Электронные сигареты"  BackColor="#C0C0C0" ForeColor="Black" Height="77px" Width="342px" OnClick="Ecigbt_Click"   />
        <asp:Button ID="Pods" runat="server" Text="Pod-системы"  BackColor="#C0C0C0" ForeColor="Black" Height="77px" Width="271px" OnClick="Pods_Click"   />
        <asp:Button ID="Mods" runat="server" Text="Моды"  BackColor="#C0C0C0" ForeColor="Black" Height="76px" Width="180px" OnClick="Mods_Click"   />
        <asp:Button ID="IQOSbtn" runat="server" Text="IQOS"  BackColor="#C0C0C0" ForeColor="Black" Height="77px" Width="150px" OnClick="IQOSbtn_Click" />
        <asp:Button ID="Partsbtn" runat="server" Text="Комлпектующие"  BackColor="#696969" ForeColor="Black" Height="74px" Width="269px" />
        <asp:Button ID="Жидкость" runat="server" Text="Жидкости"  BackColor="#C0C0C0" ForeColor="Black" Height="75px" Width="273px" OnClick="Жидкость_Click" />
             <br/>
             <br/>
             <br/>
             <br/>
             
            
          <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="C:\Users\Лысый\Pictures\photo_2020-06-01_22-26-34.jpg" Height="761px" Width="511px" style="margin-top: 10px;" OnClick="ImageButton2_Click"    />
            
       
             
        
          <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="C:\Users\Лысый\Pictures\photo_2020-06-01_21-54-45.jpg" Height="783px" Width="480px" style="margin-top: 10px;" OnClick="ImageButton3_Click"   />
  
    
        
        
        
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="C:\Users\Лысый\Pictures\photo_2020-06-01_21-59-03.jpg" Height="785px" Width="480px" style="margin-top: 0px;  margin-bottom: 0px;" BorderStyle="None" OnClick="ImageButton1_Click"     />
        </div>
          </form>
  
    
</body>
</html>
