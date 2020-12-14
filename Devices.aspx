<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Devices.aspx.cs" Inherits="VapeShop_SkillPropil.Devices" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
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
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <asp:SqlDataSource ID="sdsVape" runat="server"></asp:SqlDataSource>
    <form id="form1" runat="server">
        <asp:Button ID="btBack" runat="server" CssClass="btn btn-warning Button"
                    Text="Назад" OnClick="btBack_Click"/><br />
          <br />
          <br />
          <br />
          <br />
        <div>
            <center>
             <asp:GridView ID ="gvVape" runat ="server" 
                    AllowSorting ="true"
                    CssClass ="table table-striped table-responsive table-hover table-bordered" 
                    CurrentSortField ="" CurrentSortDirection ="ASC" OnRowDataBound="gvVape_RowDataBound"  >
                    <Columns>
                        <asp:CommandField ShowSelectButton ="false" />
                    </Columns>
                  <HeaderStyle  CssClass="table table-primary" 
                    BackColor="Black" 
                    HorizontalAlign="Center"/>
                </asp:GridView>
                </center>
        </div>
    </form>
</body>
</html>
