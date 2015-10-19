using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class DBHelper
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["easibookConnectionString"].ConnectionString;

        internal static DataTable ExecuteSelectCommand(string commandName, CommandType cmdtype)
        {
            DataTable table = null;
            using (SqlConnection dbConn = new SqlConnection(connectionString))
            {
                using (SqlCommand dbCmd = dbConn.CreateCommand())
                {
                    dbCmd.CommandType = cmdtype;
                    dbCmd.CommandText = commandName;

                    try
                    {
                        if (dbConn.State != ConnectionState.Open)
                            dbConn.Open();

                        using (SqlDataAdapter da = new SqlDataAdapter(dbCmd))
                        {
                            table = new DataTable();
                            da.Fill(table);
                        }
                    }
                    catch
                    {
                        throw;
                    }
                }
            }
            return table;
        }

        internal static DataTable ExecuteParamerizedSelectCommand(string commandName, CommandType cmdType, SqlParameter[] param)
        {
            DataTable table = new DataTable();

            using (SqlConnection dbConn = new SqlConnection(connectionString))
            {
                using (SqlCommand dbCmd = dbConn.CreateCommand())
                {
                    dbCmd.CommandType = cmdType;
                    dbCmd.CommandText = commandName;
                    dbCmd.Parameters.AddRange(param);

                    try
                    {
                        if (dbConn.State != ConnectionState.Open)
                            dbConn.Open();

                        using (SqlDataAdapter da = new SqlDataAdapter(dbCmd))
                        {
                            da.Fill(table);
                        }
                    }

                    catch
                    {
                        throw;
                    }
                }
            }
            return table;
        }

        public static bool ExecuteNonQuery(string commandName, CommandType cmdType, SqlParameter[] pars)
        {
            int result = 0;
            using (SqlConnection dbConn = new SqlConnection(connectionString))
            {
                using (SqlCommand dbCmd = dbConn.CreateCommand())
                {
                    dbCmd.CommandType = cmdType;
                    dbCmd.CommandText = commandName;
                    dbCmd.Parameters.AddRange(pars);

                    try
                    {
                        if (dbConn.State != ConnectionState.Open)
                            dbConn.Open();

                        result = dbCmd.ExecuteNonQuery();
                    }

                    catch
                    {
                        throw;
                    }
                }
            }
            return (result > 0);
        }
    }
}
