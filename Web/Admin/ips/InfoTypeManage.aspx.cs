using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using IpsCommonDBFunction.ips;

namespace Web.Admin.ips
{
    public partial class InfoTypeManage : System.Web.UI.Page
    {
        UtIpsInfoType utIpsInfoType = new UtIpsInfoType();

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = utIpsInfoType.getAllIngoType();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                if (dr["stat"].ToString() == "1")
                    dr["stat"] = "正常";
                else
                    dr["stat"] = "停用";
            }
            rpInfoTypeList.DataSource = dt.DefaultView;
            rpInfoTypeList.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sql = "insert into ut_ips_infoType(name,typeNo,stat) values('" + txtTypeName.Text.Trim() + "','" + txtTypeNo.Text.Trim() + "','1');";
            utIpsInfoType.nonQueryType(sql);
            rpInfoTypeList.DataSource = utIpsInfoType.getAllIngoType();
            rpInfoTypeList.DataBind();
            string sMessage = "信息类别名称 " + txtTypeName.Text.Trim() + " 插入成功！";
            string sURL = "InfoTypeManage.aspx";
            Response.Write("<script>alert('"+sMessage+"');location.href='"+sURL+"'</script>");

        }

        protected void lbnDisable_Click(object sender, CommandEventArgs e)
        {
            string typeName = e.CommandName.ToString();
            long typeId=Convert.ToInt64(e.CommandArgument.ToString());
            modifyStat(typeName,typeId,"0");
        }
        protected void lbnEnable_Click(object sender, CommandEventArgs e)
        {
            string typeName = e.CommandName.ToString();
            long typeId = Convert.ToInt64(e.CommandArgument.ToString());
            modifyStat(typeName, typeId, "1");
        }

        private void modifyStat(string typeName, long typeId, string stat)
        {
            string sql="update ut_ips_infoType set stat='"+stat+"' where ID="+typeId;
            utIpsInfoType.nonQueryType(sql);
            string sMessage = "信息分类名称 " + typeName + " 修改操作成功！";
            string sURL = "InfoTypeManage.aspx";
            Response.Write("<script>alert('" + sMessage + "');location.href='" + sURL + "'</script>");
        }
        
        protected void lbnDelete_Click(object sender, CommandEventArgs e)
        {
            string typeName = e.CommandName.ToString();
            int typeID = int.Parse(e.CommandArgument.ToString());
            string sql = "update ut_ips_infotype set stat = 4 where id=" + typeID;
            utIpsInfoType.nonQueryType(sql);
            string sMessage = "类别" + typeName + "删除成功！";
            string sURL = "InfoTypeManage.aspx";
            Response.Write("<script>alert('" + sMessage + "');location.href='" + sURL + "';</script>");
        }
    }
}