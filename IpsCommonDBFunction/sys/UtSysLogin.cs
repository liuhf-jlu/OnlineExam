using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace IpsCommonDBFunction.sys
{
    public class UtSysLogin
    {
        //数据库连接对象
        private SqlConnection conn = new SqlConnection("Data Source=dell026\\mc;Initial Catalog=examonline;Integrated Security=True");

        //数据库操作对象
        private SqlCommand comm = new SqlCommand();

        //数据适配器
        private SqlDataAdapter sda = new SqlDataAdapter();

        //sql语句
        private string sql = string.Empty;
        
        //验证用户身份
        public long queryLoginId(string nickName,string pwd,string role)
        {
            sql="select id,nickName,pwd,role,stat from ut_sys_login where 1=1";
            sql+=" and nickName='"+nickName+"'";
            sql+=" and pwd='"+pwd+"'";
            sql+=" and role='"+role+"'";
            sql+=" and stat='1'";
            long userLoginId=0;
            if(conn.State==0)
            {
                comm.Connection=conn;
                comm.CommandText=sql;
                sda.SelectCommand=comm;
                DataTable dt=new DataTable();
                sda.Fill(dt);
                userLoginId=Convert.ToInt64(dt.Rows[0]["id"]);
                conn.Close();
            }
            return userLoginId;
        }
    }
}
