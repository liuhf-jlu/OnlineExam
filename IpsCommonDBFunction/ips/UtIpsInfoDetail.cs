using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace IpsCommonDBFunction.ips
{
    public class UtIpsInfoDetail
    {   
        private SqlConnection conn = new SqlConnection("Data Source=.\\mc; Initial Catalog=examOnline;Integrated Security=True");
        
        private SqlCommand comm = new SqlCommand();
       
        private SqlDataAdapter sda = new SqlDataAdapter();
        
        private string sql = string.Empty;
       
        public DataTable getInfoListBySql(string sql)
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
        
        public void updateInfo(string sql)
        {
            if (conn.State == 0)
            {
                conn.Open();
                comm.CommandText = sql;
                comm.Connection = conn;
                comm.ExecuteNonQuery();
                conn.Close();
            }
        }
        
        public DataTable getInfoById(long infoId)
        {
            sql = "select infoTypeId,infoUserLoginId,typeNo,typeName,typeStat," +
                "infoId,infoTitle,infoContent,infoCreateTime,infoPublishTime,infoEndTime," +
                "infoUpdateUserLoginId,infoUpdateTime,infoBrowserCount,infoTop,infoStat," +
                "infouserloginId,role,loginStat ";
            sql += "from uv_ips_infodetail ";
            sql += "where infoId=" + infoId;
            return getInfoListBySql(sql);
        }
    }
}
