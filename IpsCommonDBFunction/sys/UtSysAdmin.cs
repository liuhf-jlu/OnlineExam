using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace IpsCommonDBFunction.sys
{
    public class UtSysAdmin
    {
        /// <summary>
        /// 数据库连接对象
        /// </summary>
        private SqlConnection conn = new SqlConnection("Data Source=.\\mc;Initial Catalog=examOnline;Integrated Security=True");
        /// <summary>
        /// 数据库操作对象
        /// </summary>
        private SqlCommand comm = new SqlCommand();
        /// <summary>
        /// 数据适配器
        /// </summary>
        private SqlDataAdapter sda = new SqlDataAdapter();
        /// <summary>
        /// sql语句
        /// </summary>
        private string sql = string.Empty;

        /// <summary>
        /// 根据管理员id，查询管理员的姓名
        /// </summary>
        /// <param name="id">管理员id</param>
        /// <returns>管理员姓名</returns>
        public string queryUserNameById(long id)
        {
            //用户名
            string userName = string.Empty;
            //查询命令
            sql = "select id,loginId,name,stat ";
            sql += "from ut_sys_admin ";
            sql += "where id=" + id;
            //数据库查询
            if (conn.State == 0)
            {
                comm.Connection = conn;
                comm.CommandText = sql;
                sda.SelectCommand = comm;
                DataTable dt = new DataTable();
                sda.Fill(dt);
                userName = dt.Rows[0]["name"].ToString();
                conn.Close();
            }
            return userName;
        }
    }
}
