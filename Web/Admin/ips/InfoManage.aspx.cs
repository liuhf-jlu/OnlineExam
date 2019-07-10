using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IpsCommonDBFunction.ips;
using System.Data;
using System.Data.SqlClient;

namespace Web.Admin.ips
{
    public partial class InfoManage : System.Web.UI.Page
    {
        UtIpsInfoType utIpsInfoType = new UtIpsInfoType();
        UtIpsInfoDetail utIpsInfoDetail = new UtIpsInfoDetail();
        long infoTypeId = 0;
        string sql = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //加载时绑定Repeater控件
                sql = "select infoId,infoTitle,typeName,infoStat from uv_ips_infoDetail where 1=1 ";
                sql += "and typeStat='1' ";
                sql += "and infoStat<>'0' and infoStat<>'4' ";
                //sql += "and infoEndtime>getdate() ";//日期
                sql += "order by infoTop,infoPublishtime";
                data2Page(sql);
            }

        }

        private void data2Page(string sql)
        {
            DataTable dtInfo = utIpsInfoDetail.getInfoListBySql(sql);
            //修改info状态
            for (int i = 0; i < dtInfo.Rows.Count; i++)
            {
                DataRow dr = dtInfo.Rows[i];
                if (dr["infoStat"].ToString() == "1")
                    dr["infoStat"] = "未审核";
                else if (dr["infoStat"].ToString() == "2")
                    dr["infoStat"] = "审核未通过";
                else if (dr["infoStat"].ToString() == "3")
                    dr["infoStat"] = "审核通过";
            }
            //info绑定控件
            rpInfoList.DataSource = dtInfo;
            rpInfoList.DataBind();
            sql = "select id,name from ut_ips_infoType where stat=1";
            DataTable dtInfoType=utIpsInfoType.getInfoTypeBySql(sql);
            //添加"请选择..."
            DataRow drInfoType = dtInfoType.NewRow();
            drInfoType["id"] = 0;
            drInfoType["name"] = "请选择...";
            dtInfoType.Rows.InsertAt(drInfoType, 0);
            //infoType绑定到控件
            ddlInfoType.DataSource = dtInfoType;
            ddlInfoType.DataTextField = "name";
            ddlInfoType.DataValueField = "id";
            ddlInfoType.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            infoTypeId = Convert.ToInt64(this.ddlInfoType.SelectedValue);
            sql = "select infoId,infoTitle,typeName,infoStat from uv_ips_infoDetail where 1=1 ";
            sql += "and typeStat='1' ";
            sql += "and infoStat<>'0' and infoStat<>'4' ";
            //sql += "and infoEndtime>getdate() ";
            if (ddlInfoType.SelectedValue != "0")
                sql += " and infoTypeId=" + ddlInfoType.SelectedValue;
            if (txtInfoContent.Text.Trim() != "")
                sql += " and infoContent like '%" + txtInfoContent.Text.Trim() + "%'";
            sql += "order by infoTop,infoPublishtime";
            data2Page(sql);
        }

        protected void lbnDelete_Click(object sender, CommandEventArgs e)
        {
            string infoTitle = e.CommandName.ToString();
            int infoId = int.Parse(e.CommandArgument.ToString());
            sql = "update ut_ips_info set stat='4' where id=" + infoId;
            utIpsInfoDetail.updateInfo(sql);
            string sMessage = "信息" + infoTitle + "删除成功！";
            string sURL = "InfoManage.aspx";
            Response.Write("<script>alert('"+sMessage+"');location.href='"+sURL+"';</script>");
        }
    }
}