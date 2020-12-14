<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="VapeShop_SkillPropil.Registration" Async="true"  %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <asp:SqlDataSource ID="sdsAuthorization" runat="server"></asp:SqlDataSource>
         <center>
        <div>
            <br>
            <br>
            <div class ="div">
            <asp:Label ID ="lblTitle" runat ="server" CssClass ="font_style"
                Text ="Регистрация" ForeColor="Black"></asp:Label> 
             <br>
             <asp:Label ID ="Label1" runat ="server" CssClass ="font_style"
                Text ="После регистрации вы будете перенаправлены в личный кабинет для заполнения контактных данных" ForeColor="Black"></asp:Label> 
            <br>
            <br>
            <asp:TextBox id="tbLogin" runat ="server"
                CssClass ="tb_Style" Width="200px" ForeColor="Gray">Login</asp:TextBox>
            <br>
      
            <br>
            <asp:TextBox id="tbPassword" runat ="server" 
                CssClass ="tb_Style" Width="200px" ForeColor="Gray">Password</asp:TextBox>
            <br>
            <br>
            <asp:TextBox id="tbSurname" runat ="server"
                CssClass ="tb_Style" Width="200px" ForeColor="Gray">Фамилия</asp:TextBox>
             <br>
            <br>
            <asp:TextBox id="tbName" runat ="server"
                CssClass ="tb_Style" Width="200px" ForeColor="Gray">Имя</asp:TextBox>
             <br>
            <br>
            <asp:TextBox id="tbMiddle" runat ="server"
                CssClass ="tb_Style" Width="200px" ForeColor="Gray">Отчество</asp:TextBox>
             <br>
                        <asp:Label ID ="Label5" runat ="server" Text ="Номер карты"
                CssClass ="font_style" ForeColor="Black"></asp:Label>
            <br>
            <asp:TextBox id="tbCardNumber" runat ="server"
                CssClass ="tb_Style" ForeColor="#999999" Width="200px">0000 0000 0000 0000</asp:TextBox>
             <br>
                        <asp:Label ID ="Label6" runat ="server" Text ="Номер телефона"
                CssClass ="font_style" ForeColor="Black"></asp:Label>
            <br>
            <asp:TextBox id="tbPhone" runat ="server"
                CssClass ="tb_Style" Width="200px">+7-   -   -  -  -</asp:TextBox>
             <br>
            <br>
            <asp:Button ID ="btEnter" runat ="server" Text ="Зарегестрироваться" 
                CssClass ="btn btn-danger" OnClick="btEnter_Click" Width="200px" />
        
            <br>
            <br>
                  <div>
          <asp:RequiredFieldValidator runat="server" ID="ValidateQuantity" ControlToValidate="tbLogin" 
         ErrorMessage="Не заполнили логин" Display="dynamic">
</asp:RequiredFieldValidator>
                  <br>
              <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="tbPassword" 
         ErrorMessage="Не заполнили пароль" Display="dynamic">
</asp:RequiredFieldValidator>
                      <br>
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="tbSurname" 
         ErrorMessage="Не заполнили фамилию" Display="dynamic">
</asp:RequiredFieldValidator>
                      <br>
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="tbName" 
         ErrorMessage="Не заполнили имя" Display="dynamic">
</asp:RequiredFieldValidator>
                      <br>
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="tbMiddle" 
         ErrorMessage="Не заполнили отчество" Display="dynamic">
</asp:RequiredFieldValidator>
                      <br>
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="tbCardNumber" 
         ErrorMessage="Не заполнили номер карты" Display="dynamic">
</asp:RequiredFieldValidator>
                      <br>
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="tbPhone" 
         ErrorMessage="Не заполнили номер телефона" Display="dynamic">
</asp:RequiredFieldValidator>
                      <br>

                      
 <br>

                      <asp:RegularExpressionValidator runat="server" ID="Phone" 
       ControlToValidate="tbPhone" ValidationExpression="\S{16,16}"
       ErrorMessage="Некорректный номер телефона" Display="dynamic">
</asp:RegularExpressionValidator>










              <asp:ValidationSummary runat="server" ID="Summary" DisplayMode="BulletList" 
        HeaderText="<b>Пожалуйста, исправьте следующие ошибки: </b>" ShowSummary="true" ShowMessageBox="true" />

              </div>
            </center>
        </div>
        </div>
        </center>
    </form>
</body>
</html>
