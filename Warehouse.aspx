<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Warehouse.aspx.cs" Inherits="VapeShop_SkillPropil.Warehouse" EnableEventValidation="false" %>

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
    </style>
</head>
<body>
      <form id="Warehouse" runat="server">
      <asp:SqlDataSource ID="sdsWarehouse" runat="server"></asp:SqlDataSource>
        <center>
            <asp:Label ID ="lblTitle" runat ="server" Text= "Учет товара на складе" 
                Font-Size ="20pt" Font-Names ="Arial" ForeColor="Black"></asp:Label>
        </center>
        <div style="overflow: unset">
            <div style="float: left">
                
                <asp:SqlDataSource ID="sdsVape" runat="server"
                    SelectCommand="SELECT ID_Vape , Name FROM Vape"></asp:SqlDataSource>

                
                <asp:DropDownList ID="lstVape" runat="server" DataSourceID="sdsVape" DataTextField="Name" DataValueField="ID_Vape">
                </asp:DropDownList><br />

                <asp:SqlDataSource ID="sdsSupply" runat="server"
                    SelectCommand="SELECT ID_Supply, Name_of_Supplyer FROM Supply"></asp:SqlDataSource>

                
                <asp:DropDownList ID="lstSupply" runat="server" DataSourceID="sdsSupply" DataTextField="Name_of_Supplyer" DataValueField="ID_Supply">
                </asp:DropDownList><br />

                <br />

                <br />

                
                <asp:Label ID="lblQuantity" runat="server"
                    Text="Количество" CssClass="font_style" ForeColor="Black"></asp:Label>
                <br />
                <asp:TextBox ID="tbQuantity" runat ="server" style="margin-left: 0px"></asp:TextBox>
                <br />


                
                <asp:Label ID="lblUnit" runat="server"
                    CssClass="font_style" Text="Еденицы измерения" ForeColor="Black"></asp:Label>
                <br />
                <asp:TextBox ID="tbUnit" runat ="server" style="margin-left: 0px"></asp:TextBox>
                <br />
                 
               
             
               
                

                


                


                <br />
                 <asp:ImageButton   alt="" class="auto-style1" ID="ImageButton1" runat="server" Height="37px" Width="70px" ImageUrl="~/file-excel-fill.png" OnClick="ImageButton1_Click" />

              
                 <asp:ImageButton   alt="" class="auto-style1" ID="ImageButton2" runat="server" Height="41px" Width="70px" ImageUrl="~/file_pdf_icon_153412.png" OnClick="ImageButton2_Click" />

              
                  <asp:ImageButton   alt="" class="auto-style1" ID="ImageButton3" runat="server" Height="32px" Width="68px" ImageUrl="~/microsoft_word_icon_132203.png" OnClick="ImageButton3_Click" />

              
                <br />

              
                <br />

                <asp:Button ID="btInsert" runat="server" CssClass="btn Button btn-secondary"

                    Text="Добавить" OnClick="btInsert_Click" /><br />

                <asp:Button ID="btUpdate" runat="server" CssClass="btn Button btn-secondary"
                    Text="Изменить" OnClick="btUpdate_Click" /><br />
                <asp:Button ID="btDelete" runat="server" CssClass="btn Button btn-secondary"
                    Text="Удалить" OnClick="btDelete_Click" /><br />
                <asp:Button ID="btBack" runat="server" CssClass="btn Button btn-secondary"
                    Text="Назад" OnClick="btBack_Click" /><br />
            </div>
            <div>
                <center>
                    <asp:Label ID ="lblSearch" runat ="server" 
                        Text ="Введите значение для поиска" CssClass="font_style" ForeColor="Black"></asp:Label>
                    <asp:TextBox ID="tbSearch" runat ="server" 
                        CssClass ="tb_Style"></asp:TextBox>
                    <br>
                    <asp:Button ID ="btSearch" runat ="server" 
                        CssClass ="btn Button btn-secondary" Text ="Поиск" OnClick="btSearch_Click"/>
                    <asp:Button ID ="btFilter" runat ="server" 
                        CssClass ="btn Button btn-secondary" Text ="Фильтр" OnClick="btFilter_Click"/>
                    <asp:Button ID ="btCancel" runat ="server" 
                        CssClass ="btn Button btn-secondary" Text ="Отмена" OnClick="btCancel_Click"/>
                <asp:GridView ID ="gvWarehouse" runat ="server"
                  
                    AllowSorting ="true"
                    CssClass ="gvWarehouse" 
                    CurrentSortField ="" CurrentSortDirection ="ASC"  OnRowDataBound="gvWarehouse_RowDataBound" OnSorting="gvWarehouse_Sorting" OnSelectedIndexChanged="gvWarehouse_SelectedIndexChanged" ForeColor="Black">
                    <Columns>
                        <asp:CommandField ShowSelectButton ="true" />
                    </Columns>
                    <HeaderStyle  CssClass="table table-primary" 
                    BackColor="Black" 
                    HorizontalAlign="Center"/>
                </asp:GridView>
                    <div>
          <asp:RequiredFieldValidator runat="server" ID="ValidateQuantity" ControlToValidate="tbQuantity" 
         ErrorMessage="Не заполнили количество" Display="dynamic">
</asp:RequiredFieldValidator>
                         <br>
              <asp:RequiredFieldValidator runat="server" ID="ValidateUnit" ControlToValidate="tbQuantity" 
         ErrorMessage="Не заполнили единицы измерения" Display="dynamic">
</asp:RequiredFieldValidator>
                        

<asp:RangeValidator runat="server" ID="ValidateDayOff2" ControlToValidate="tbQuantity" 
        MinimumValue="1" MaximumValue="10000" Type="Integer" 
        ErrorMessage="В текстовом поле данные указаны неверно" Display="dynamic" 
        SetFocusOnError="True">*
</asp:RangeValidator>










              <asp:ValidationSummary runat="server" ID="Summary" DisplayMode="BulletList" 
        HeaderText="<b>Пожалуйста, исправьте следующие ошибки: </b>" ShowSummary="true" ShowMessageBox="true" />

              </div>
            </center>
            </div>
        </div>
          
    </form>
</body>
</html>
