using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IpsCommonDBFunction.sys;
using IpsCommonDBFunction.ips;
using System.Data;
using System.Data.SqlClient;

namespace Web
{
    public partial class xxfb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {   
                //生成随机验证码
                txtCrePar.Text = RndNum(Convert.ToInt16(4));
                //加载时，绑定Reapter控件，显示新闻列表;
                string sql = "select infoId,infoTitle,typeName,infoBrowserCount,infoStat from uv_ips_infoDetail where 1=1 ";
                sql += "and typeStat='1' ";//类别状态正常
                sql += "and infoStat='3' ";//查询已发布的信息
                sql += "and infoEndtime<getdate() ";    //下架日期在当前日期之后
                sql += "order by infoTop,infoPublishtime";//排序
                UtIpsInfoDetail utIpsInfoDetail = new UtIpsInfoDetail();
                DataTable dt = utIpsInfoDetail.getInfoListBySql(sql);
                rpInfoList.DataSource = dt.DefaultView;
                rpInfoList.DataBind();
            }
        }
        //生成验证码
        private string RndNum(int VcodeNum)
        {
            string MaxNum="";
            string MinNum="";
            for(int i=0;i<VcodeNum;i++)
            {
                MaxNum=MaxNum+"9";
            }
            MinNum=MaxNum.Remove(0,1);
            Random rd=new Random();
            string VNum=Convert.ToString(rd.Next(Convert.ToInt32(MinNum),Convert.ToInt32(MaxNum)));
            return VNum;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtPar.Text == txtCrePar.Text)
            {
                UtSysLogin utSysLogin = new UtSysLogin();
                string role = ddlRole.SelectedValue;
                long loginId = utSysLogin.queryLoginId(txtNickName.Text.Trim(), txtPwd.Text.Trim(), role);
                if (loginId > 0)
                {
                    Session.Add("loginId", loginId);
                    if (role == "2")//管理员
                    {
                        Response.Redirect("Admin/ips/InfoTypeManage.aspx");
                    }
                    else if (role == "1")//教师
                    {

                    }
                    else if (role == "0")//学生
                    {

                    }
                }
                else
                {
                    Response.Write("<script>alert('请输入正确的验证码');</script>");
                }

            }
        }

        protected void btnRegester_Click(object sender, EventArgs e)
        {
            Response.Redirect("Front/ips/Regist.aspx");
        }
    }
}