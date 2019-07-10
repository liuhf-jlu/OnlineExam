using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IpsCommonDBFunction.ips;
using System.Data;

namespace Web.Admin.ips
{
    public partial class InfoAdd : System.Web.UI.Page
    {
        
        UtIpsInfoType utIpsInfoType = new UtIpsInfoType();
        
        UtIpsInfo utIpsInfo = new UtIpsInfo();
        
        string sql = string.Empty;
        
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
            }
        }
       
        protected void btnSaveDraft_Click(object sender, EventArgs e)
        {
            addInfo("0");
            string sMessage = "信息保存成功！";
            Response.Write("<script language=javascript>alert('" + sMessage + "');location.href='InfoManage.aspx'</script>");
        }
       
        protected void btnSubmitPublish_Click(object sender, EventArgs e)
        {
            addInfo("3");
            string sMessage = "信息插入成功！";
            Response.Write("<script language=javascript>alert('" + sMessage + "');location.href='InfoManage.aspx'</script>");
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
       
        private void addInfo(string stat)
        {
            sql = " insert into ut_ips_info ";
            if (stat == "0")
                sql += " (infoTypeId,title,infoContent,userLoginId,createTime,endTime,browserCount,isTop,stat) values(";
            else
                sql += " (infoTypeId,title,infoContent,userLoginId,createTime,publishTime,endTime,browserCount,isTop,stat) values(";
            sql += ddlInfoType.SelectedValue + ",";
            sql += "'" + txtTitle.Text.Trim() + "',";
            sql += "'" + FreeTextBox1.Text.Trim() + "',";
            sql += Session["loginId"].ToString() + ",";
            sql += "'" + DateTime.Now + "',";
            if (stat == "3" || stat == "1")
                sql += "'" + DateTime.Now + "',";
            sql += "'" + txtEndDate.Text.Trim() + "',";
            sql += "0" + ",";
            sql += "'" + ddlIsTop.SelectedValue + "',";
            sql += "'" + stat + "'";
            sql += ");";
            utIpsInfo.nonQueryInfo(sql);
        }

    }
}