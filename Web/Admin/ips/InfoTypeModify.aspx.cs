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
    public partial class InfoTypeModify : System.Web.UI.Page
    {
        UtIpsInfoType utIpsInfoType = new UtIpsInfoType();
        long infoTypeID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //从URl中获取ID
            if (Request.QueryString["infoTypeID"] != null)
            {
                infoTypeID = Convert.ToInt64(Request.QueryString["infoTypeID"].ToString());
            }
            if (!Page.IsPostBack)
            {
                string[] value = utIpsInfoType.getInfoTypeById(infoTypeID);
                txtTypeNo.Text = value[0];
                txtTypeName.Text = value[1];
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sql = "update ut_ips_infoType set name='" + txtTypeName.Text.Trim() + "',";
            sql += "typeNo='" + txtTypeNo.Text.Trim() + "'";
            sql += " where id=" + infoTypeID;
            utIpsInfoType.modifyInfoType(sql);
            string sMessage = "信息类别修改成功！";
            Response.Write(
            "<script language=javascript>alert('"+sMessage+"');history.go(-1);window.opener.location.reload();window.opener=null;window.close();"+
            "</script>"
            );
        }
    }
}