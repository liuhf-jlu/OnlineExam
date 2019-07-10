using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IpsCommonDBFunction.sys;
using IpsCommonDBFunction.ips;
using System.Data;

namespace web.Front.ips
{
    public partial class InfoDetailView : System.Web.UI.Page
    {
        UtIpsInfoDetail utIpsInfoDetail = new UtIpsInfoDetail();
        UtIpsInfoType utIpsInfoType = new UtIpsInfoType();
        UtSysLogin utSysLogin = new UtSysLogin();
        UtSysAdmin utSysAdmin = new UtSysAdmin();

        protected void Page_Load(object sender, EventArgs e)
        {
            long infoId = Convert.ToInt64(Request.QueryString["infoId"]);
            string sql = "update ut_ips_info set browserCount=browserCount+1 where id=" + infoId;
            utIpsInfoType.nonQueryInfoType(sql);
            DataTable dtInfo = utIpsInfoDetail.getInfoById(infoId);
            lblInfoBrowserCount.Text = dtInfo.Rows[0]["infoBrowserCount"].ToString();
            lblInfoContent.Text = dtInfo.Rows[0]["infoContent"].ToString();
            lblInfoPublishTime.Text = dtInfo.Rows[0]["infoPublishTime"].ToString();
            lblInfoTitle.Text = dtInfo.Rows[0]["infoTitle"].ToString();
            lblUserName.Text = utSysAdmin.queryUserNameById(Convert.ToInt64(dtInfo.Rows[0]["infouserloginId"]));
        }
    }
}