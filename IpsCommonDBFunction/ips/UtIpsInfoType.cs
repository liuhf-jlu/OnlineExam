using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace IpsCommonDBFunction.ips
{
    public class UtIpsInfoType
    {
        //数据库连接对象
        private SqlConnection conn = new SqlConnection("Data Source=dell026\\mc;Initial Catalog=examonline;Integrated Security=True");

        //数据库操作对象
        private SqlCommand comm = new SqlCommand();

        //数据适配器
        private SqlDataAdapter sda = new SqlDataAdapter();

        //sql语句
        private string sql = string.Empty;

        //查询结果
        public DataTable getInfoTypeBySql(string sql)
        {
            DataTable dt = new DataTable();
            if (conn.State == 0)
            {
                conn.Open();
                comm.Connection = conn;
                comm.CommandText = sql;
                sda.SelectCommand = comm;
                sda.Fill(dt);
                conn.Close();
            }
            return dt;
        }

        //获取所有类别
        public DataTable getAllIngoType()
        {
            string sql = "select id,typeNo,name,stat from ut_ips_infoType where 1=1 and stat <> 4;";
            return getInfoTypeBySql(sql);
        }

        //非查询（插入、修改、删除）信息类别
        public void nonQueryType(string sql)
        {
            conn.Open();
            comm.Connection = conn;
            comm.CommandText = sql;
            comm.ExecuteNonQuery();
            conn.Close();
        }

        //查询类别编号和类别名称
        public string[] getInfoTypeById(long infoTypeId)
        {
            string[] value={string.Empty,string.Empty};
            sql="select id,typeNo,name,stat from ut_ips_infoType where (ID="+infoTypeId+");";
            DataTable dt=getInfoTypeBySql(sql);
            value[0]=dt.Rows[0]["typeNo"].ToString();
            value[1]=dt.Rows[0]["name"].ToString();
            return value;
        }

        //修改类别
        public void modifyInfoType(string sql)
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

        /// <summary>
        /// 非查询（插入、修改、删除）信息类别
        /// </summary>
        /// <param name="sql">sql语句</param>
        public void nonQueryInfoType(string sql)
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
