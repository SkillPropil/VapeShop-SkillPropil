
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="VapeShop_SkillPropil.Tickets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <style type="text/css">
         .bt_Style {
            height: 29px;
             margin-left: 0px;
         }
         #btBack {
         }
         </style>
</head>
<body>
      <form id="Tickets" runat="server">
      <asp:SqlDataSource ID="sdsTickets" runat="server"></asp:SqlDataSource>
          <asp:Button ID="Button1" runat="server" CssClass="bt_Style"
                    Text="Контакты" OnClick="Button1_Click"  /><br />

                <asp:Button ID="btUpdate" runat="server" CssClass="bt_Style"
                    Text="Девайсы" OnClick="btUpdate_Click"/><br />
        <center>
            <br/>
            

            <asp:Label ID ="lblTitle" runat ="server" Text= "Оформление заявки" 
             Font-Size ="20" Font-Names ="Arial"></asp:Label>
             <br/>
             <br/>
             <br/>
             <asp:SqlDataSource ID="sdsClient" runat="server"
                    SelectCommand="SELECT ID_Client, CardNumber FROM Client"></asp:SqlDataSource>

                
                <asp:DropDownList ID="lstClient" runat="server" DataSourceID="sdsClient" DataTextField="CardNumber" DataValueField="ID_Client" Height="21px" style="margin-left: 0px" Width="216px">
                </asp:DropDownList><br />
             <asp:SqlDataSource ID="sdsVape" runat="server"
                    SelectCommand="SELECT ID_Vape , Name FROM Vape"></asp:SqlDataSource>
            
                
                <asp:DropDownList ID="lstVape" runat="server" DataSourceID="sdsVape" DataTextField="Name" DataValueField="ID_Vape" style="margin-left: 0px" Height="23px" Width="216px">
                </asp:DropDownList><br />
            <br />

            <asp:Label ID="lblName" runat="server"
                    Text="Имя" CssClass="font_style"></asp:Label>
             <br />
                <asp:TextBox ID="tbName" runat ="server" style="margin-left: 0px" Width="211px"></asp:TextBox>
                <br />
            <asp:Label ID="Label3" runat="server"
                    Text="Номер карты" CssClass="font_style"></asp:Label>
             <br />
                <asp:TextBox ID="tbBankCard" runat ="server" style="margin-left: 0px" Width="211px" ForeColor="#999999">0000 0000 0000 0000</asp:TextBox>
                <br />
            <asp:Label ID="Label1" runat="server"
                    Text="Номер телефона" CssClass="font_style"></asp:Label>
             <br />
                <asp:TextBox ID="tbPhone" runat ="server" style="margin-left: 0px" Width="209px" BorderColor="#999999" ForeColor="#999999">+7-   -   -  -  </asp:TextBox>
                <br />
            <asp:Label ID="Label2" runat="server"
                    Text="Тип испарителя" CssClass="font_style"></asp:Label>
             <br />
                <asp:TextBox ID="tbModel" runat ="server" style="margin-left: 0px" Width="208px"></asp:TextBox>
                <br />
            <br />
            <asp:Button ID ="btInsert" runat ="server" 
                        CssClass ="bt_Style" Text ="Оформить заявку" OnClick="btInsert_Click" BackColor="#FFFFCC" />
        </cent>
        <div> 
            
               <asp:Button ID="btBack" runat="server" CssClass="bt_Style"
                    Text="Назад"  Height="27px" Width="91px" OnClick="btBack_Click" /> 
              <div>
         
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="tbName" 
         ErrorMessage="Не заполнили имя" Display="dynamic">
</asp:RequiredFieldValidator>
                      <br>
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="tbModel" 
         ErrorMessage="Не заполнили тип испарителя" Display="dynamic">
</asp:RequiredFieldValidator>
                      <br>
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="tbBankCard" 
         ErrorMessage="Не заполнили номер карты" Display="dynamic">
</asp:RequiredFieldValidator>
                      <br>
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="tbPhone" 
         ErrorMessage="Не заполнили номер телефона" Display="dynamic">
</asp:RequiredFieldValidator>
                      <br>


                      <asp:RegularExpressionValidator runat="server" ID="Phone" 
       ControlToValidate="tbPhone" ValidationExpression="\S{16,16}"
       ErrorMessage="Данные в текстовом поле указаны неверно" Display="dynamic">
</asp:RegularExpressionValidator>










              <asp:ValidationSummary runat="server" ID="Summary" DisplayMode="BulletList" 
        HeaderText="<b>Пожалуйста, исправьте следующие ошибки: </b>" ShowSummary="true" ShowMessageBox="true" />

              </div>
        </div>
            
             
           
    </form>
    
</body>
</html>

