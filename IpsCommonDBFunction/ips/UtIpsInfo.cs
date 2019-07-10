using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace IpsCommonDBFunction.ips
{
    public class UtIpsInfo
    {
        
        private SqlConnection conn = new SqlConnection("Data Source=.\\mc;Initial Catalog=examOnline;Integrated Security=True");
        
        private SqlCommand comm = new SqlCommand();
        
        private SqlDataAdapter sda = new SqlDataAdapter();
        
        private string sql = string.Empty;

        
        public void nonQueryInfo(string sql)
        {
            if (conn.State == 0)
            {
                conn.Open();
                comm.Connection = conn;
                comm.CommandText = sql;
                comm.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}
