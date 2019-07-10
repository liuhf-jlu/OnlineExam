using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using IpsCommonDBFunction.ips;

namespace Web.Admin.ips
{
    public partial class InfoModify : System.Web.UI.Page
    {
       
        private UtIpsInfoDetail utIpsInfoDetail = new UtIpsInfoDetail();
        
        private UtIpsInfoType utIpsInfoType = new UtIpsInfoType();
        
        private UtIpsInfo utIpsInfo = new UtIpsInfo();
       
        private long infoId;
        
        private long userLoginId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                
                cdEndDate.SelectedDate = DateTime.Today;
                
                string sql = "select id,typeNo,name,stat from ut_ips_infoType where stat='1'";
                DataTable dt = utIpsInfoType.getInfoTypeBySql(sql);
                DataRow dr = dt.NewRow();
                dr["id"] = 0;
                dr["name"] = "请选择...";
                dt.Rows.InsertAt(dr, 0);
                ddlInfoType.DataSource = dt;
                ddlInfoType.DataTextField = "name";
                ddlInfoType.DataValueField = "id";
                ddlInfoType.DataBind();
               
                infoId = Convert.ToInt64(Request.QueryString["infoID"]);
                DataTable dtInfo = utIpsInfoDetail.getInfoById(infoId);
                txtTitle.Text = dtInfo.Rows[0]["infoTitle"].ToString();
                txtEndDate.Text = dtInfo.Rows[0]["infoEndTime"].ToString();
                ddlInfoType.SelectedValue = dtInfo.Rows[0]["infoTypeId"].ToString();
                ddlIsTop.SelectedValue = dtInfo.Rows[0]["infoTop"].ToString();
                FreeTextBox1.Text = dtInfo.Rows[0]["infoContent"].ToString();
                userLoginId = Convert.ToInt64(dtInfo.Rows[0]["infoUserLoginId"]);
            }
        }

        protected void btnSubmitPublish_Click(object sender, EventArgs e)
        {
            long infoId = Convert.ToInt64(Request.QueryString["depId"]);
            string sql = " update ut_ips_info set ";
            sql += "infoTypeId='" + ddlInfoType.SelectedValue + "',";
            sql += "title='" + txtTitle.Text.Trim() + "',";
            sql += "infoContent='" + FreeTextBox1.Text.Trim() + "',";
            if (userLoginId == Convert.ToInt64(Session["loginId"]))
            {
                sql += "publishTime='" + DateTime.Now + "',";
            }
            else
            {
                sql += "updateUserLoginId=" + Session["loginId"] + ",";
                sql += "updateTime='" + DateTime.Now + "',";
            }
            sql += "endTime='" + txtEndDate.Text.Trim() + "',";
            sql += "isTop='" + ddlIsTop.SelectedValue + "',";
            sql += "stat='1' ";
            sql += "where id=" + infoId;
            utIpsInfo.nonQueryInfo(sql);
            string sMessage = txtTitle.Text.Trim() + "  修改操作成功！";
            string sURL = "InfoManage.aspx";
            Response.Write("<script>alert('" + sMessage + "');location.href='" + sURL + "'</script>");
        }
       
        protected void cdEndDate_SelectionChanged(object sender, EventArgs e)
        {
            txtEndDate.Text = cdEndDate.SelectedDate.ToString();
            cdEndDate.Visible = false;
        }
        
        protected void ibnCalendar_Click(object sender, ImageClickEventArgs e)
        {
            cdEndDate.Visible = !cdEndDate.Visible;
        }
    }
}