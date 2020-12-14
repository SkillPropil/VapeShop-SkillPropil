using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Windows;
using System.Net;


namespace VapeShop_SkillPropil
{
    public class DB_Connection
    {
        public static string connectionString = @"Data Source=LAPTOP-A2PIL339\LYSYISERVER; Initial Catalog=Vape_Shop;Integrated Security=True;" +
            @"Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;" +
            @"ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        public static SqlConnection connection = new SqlConnection(connectionString);

        public DataTable dtAuthorization = new DataTable("Authorization");
        public DataTable dtClient = new DataTable("Client");
        public DataTable dtPosition = new DataTable("Position");
        public DataTable dtDepartment = new DataTable("Department");
        public DataTable dtPayment = new DataTable("Payment");
        public DataTable dtParts = new DataTable("Parts");
        public DataTable dtVape = new DataTable("Vape");
        public DataTable dtSupply = new DataTable("Supply");
        public DataTable dtWarehouse = new DataTable("Warehouse");
        public DataTable dtEmployee = new DataTable("Employee");
        public DataTable dtCheck = new DataTable("Check");
        public DataTable dtSoldProduct = new DataTable("Sold_Product");
        public DataTable dtRentTickets = new DataTable("Rent_Tickets");

        public static string qrAuthorization = "SELECT " +
          "[ID_Authorization], " +
          "[Login], " +
          "[Password] " +
          "FROM [dbo].[Authorization]  ",

          qrClient = "SELECT " +
          "[ID_Client], " +
          //"[Authorization_ID],  " +
          "[LoginC] " +
          "[PasswordC] " +
          "[Surname], " +
          "[Name], " +
          "[Middle_Name], " +
          "[CardNumber], " +
          "[Phone] " +
          "FROM [dbo].[Client] " ,
          //"INNER JOIN [dbo].[Authorization] ON [ID_Authorization] = [Authorization_ID] ",

          qrPosition = "SELECT " +
          "[ID_Position],  " +
          "[Name_of_Position], " +
          "[Salary] " +
          "FROM [dbo].[Job_Seeker] ",

          qrDepartment = "SELECT " +
          "[ID_Department], " +
          "[Name_of_Department], " +
          "[Employee_Quantity] " +
          "FROM [dbo].[Department] ",

          qrPayment = "SELECT " +
          "[ID_Type_of_Payment], " +
          "[Type_of_Payment] " +
          "FROM [dbo].[Payment] ",

          qrParts = "SELECT " +
          "[ID_Parts], " +
          "[Type_of_Parts], " +
          "[Name] " +
          "FROM [dbo].[Parts]",

          qrVape = "SELECT " +
          "[ID_Vape], " +
          "[Naime] as \"Наименование\", " +
          "[Cost] as \"Цена\", " +
          "[Comment] as \"Описание\" " +
          "FROM [dbo].[Vape]" +
          "INNER JOIN [dbo].[Parts] ON [ID_Parts] = [Parts_ID] ",

          qrSupply = "SELECT " +
          "[ID_Supply], " +
          "[Name_of_Supplyer], " +
          "[Name_of_Product], " +
          "[Supply_Product_Quantity], " +
          "[Invoice_Nubmer] " +
          "FROM [dbo].[Supply] ",

          qrWarehouse = "SELECT " +
          "[ID_Warehouse], " +
          "[Product_Quantity] as \"Kolichestvo\", " +
          "[Unit] as \"Edinitsy Izmereniya\", " +
          "[Name] as \"Naimenovanie\", " +
          "[Comment] as \"Opisanie\", " +
          "[Name_of_Supplyer] as \"Naimenovanie postavshika\", " +
          "[Vape_ID], [Supply_ID] " +
          "FROM [dbo].[Warehouse] " +
          "INNER JOIN [dbo].[Vape] ON [ID_Vape] = [Vape_ID] " +
          "INNER JOIN [dbo].[Supply] ON [ID_Supply] = [Supply_ID] ",

          qrEmployee = "SELECT " +
          "[ID_Employee], " +
          "[Authorization_ID],  " +
          "[Surname_emp], " +
          "[Name_emp], " +
          "[Middle_Name_emp], " +
          "[Experience], " +
          "[Phone], " +
          "[Position_ID], [Department_ID] " +
          "FROM [dbo].[Employee] " +
          "INNER JOIN [dbo].[Authorization] ON [ID_Authorization] = [Authorization_ID] " +
          "INNER JOIN [dbo].[Position] ON [ID_Position] = [Position_ID] " +
          "INNER JOIN [dbo].[Department] ON [ID_Department] = [Department_ID] ",

        qrCheck = "SELECT " +
          "[ID_Check], " +
          "[Check_Number],  " +
          "[Sale_Data], " +
           "[Client_ID]," +
          "[Type_of_Payment_ID], [Employee_ID] " +
          "FROM [dbo].[Check] " +
          "INNER JOIN [dbo].[Client] ON [ID_Client] = [Client_ID] " +
          "INNER JOIN [dbo].[Payment] ON [ID_Type_of_Payment] = [Type_of_Payment_ID] " +
          "INNER JOIN [dbo].[Employee] ON [ID_Employee] = [Employee_ID] ",

            qrSoldProduct = "SELECT " +
          "[ID_Sold_Product], " +
          "[Vape_ID], [Check_ID] " +
          "FROM [dbo].[Sold_Product], " +
          "INNER JOIN [dbo].[Vape] ON [ID_Vape] = [Vape_ID] " +
          "INNER JOIN [dbo].[Check] ON [ID_Check] = [Check_ID] ",

             qrTickets = "SELECT " +
          "[ID_Ticket], " +
          "[Name_of_Client], " +
          "[BankCard], " +
          "[Phone], " +
          "[Vape_Model], " +
          "[Vape_ID], " +
          "[Client_ID] " +
          "FROM [dbo].[Rent_Tickets] " +
          "INNER JOIN [dbo].[Vape] ON [ID_Vape] = [Vape_ID] " +
          "INNER JOIN [dbo].[Client] ON [ID_Client] = [Client_ID] ";

        private SqlCommand command = new SqlCommand("", connection);
        public static Int32 IDrecord, IDuser;

        public void dbEnter(string login, string password)
        {
            command.CommandText = "SELECT count(*) FROM [dbo].[Client]" +
                "where [LoginC] = '" + login + "' and [PasswordC] = '" +
                password + "'";
            connection.Open();
            IDuser = Convert.ToInt32(command.ExecuteScalar().ToString());
            connection.Close();
        }

       

        private void dtFill(DataTable table, string query)
        {
            command.CommandText = query;
            connection.Open();
            table.Load(command.ExecuteReader());
            connection.Close();
        }

        public Int32 Authorization(string User_Login, string User_Password)
        {
            Int32 ID_record = 0;
            command.CommandType = System.Data.CommandType.Text;
            command.CommandText = "select [dbo].[Client]('"
                + User_Login + "','" + User_Password + "')";
            DB_Connection.connection.Open();
            ID_record = Convert.ToInt32(command.ExecuteScalar().ToString());
            DB_Connection.connection.Close();
            return (ID_record);
        }
    }
}
