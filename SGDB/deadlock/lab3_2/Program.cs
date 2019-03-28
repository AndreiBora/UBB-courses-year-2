using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Threading;

namespace lab3_2
{
    class Program
    {
        static void firstRun()
        {
            SqlConnection conn = new SqlConnection("Data Source =DESKTOP-QLSBE2K\\SQLEXPRESS;" +
                "Initial Catalog = Students;" +
                "Integrated Security = true");
            conn.Open();
            try
            {
                SqlTransaction transaction = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("dbo.deadlock1", conn, transaction);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.ExecuteNonQuery();
                transaction.Commit();
                Console.WriteLine("First transaction commited");
            }
            catch(SqlException e)
            {
                if(e.Number == 1205)
                {
                    Console.WriteLine("First Transaction is chosen as a deadlock victim - restart");
                    firstRun();
                }
            }
        }

        static void secondRun()
        {
            SqlConnection conn = new SqlConnection("Data Source =DESKTOP-QLSBE2K\\SQLEXPRESS;" +
                "Initial Catalog = Students;" +
                "Integrated Security = true");
            conn.Open();
            try
            {
                SqlTransaction transaction = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("dbo.deadlock2", conn, transaction);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.ExecuteNonQuery();
                transaction.Commit();
                Console.WriteLine("Second transaction commited");
            }
            catch (SqlException e)
            {
                if (e.Number == 1205)
                {
                    Console.WriteLine("Second Transaction was chosen as a deadlock victim - restart");
                    secondRun();
                }
            }
        }



        static void Main(string[] args)
        {
            Thread t1 = new Thread(new ThreadStart(firstRun));
            Thread t2 = new Thread(new ThreadStart(secondRun));
            t1.Start();
            t2.Start();
            t1.Join();
            t2.Join();
            Console.Write("done");
            Console.ReadKey();
        }
    }
}
