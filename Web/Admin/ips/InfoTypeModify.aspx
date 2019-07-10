﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoTypeModify.aspx.cs" Inherits="Web.Admin.ips.InfoTypeModify" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" id ="Head1">
    <title>在线考试——信息发布子系统</title>
    <link href="~/css/public.css" rel="stylesheet" type="text/css" />
    </head>
<body>
   <div id = "container">
        <!--logo-->
        <div id = "logo_ips">
        
        </div>
        <!--导航区-->
        <div id = "navigation">
            <table>
                <tr>
                    <td class="pagePosition">当前位置：信息类别修改</td>
                </tr>
            </table>
        </div>
        <!--中间区-->
        <div id="middle">
            <!--功能区-->
            <div id="function">
                    <table style="margin-left:0px;margin-top:4px;">
                    <!--第一行：放置ValidationSummary验证控件-->
                        <tr>
                            <td>
                               
                                <asp:HyperLink ID="hlHomePage" runat="server" BorderColor="Silver" 
                                    BorderStyle="Ridge" BorderWidth="0px" Font-Bold="True" ForeColor="#0181C8" 
                                    NavigateUrl="~/xxfb.aspx">返回主页</asp:HyperLink>
                               
                            </td>
                        </tr>
                    <!--第二行：Label TextBox 等控件-->
                        <tr>
                            <td>
                            
                                <asp:HyperLink ID="hlInfoTypeManage" runat="server" BorderColor="Silver" 
                                    BorderStyle="Ridge" BorderWidth="0px" Font-Bold="True" ForeColor="#0181C8" 
                                    NavigateUrl="~/Admin/ips/InfoTypeManage.aspx">信息分类管理</asp:HyperLink>
                            </td>
                        </tr>
                    <!--第三行：Label TextBox 等控件-->
                        <tr>
                            <td>                                
                              
                                <asp:HyperLink ID="hlInfoManage" runat="server" BorderColor="Silver" 
                                    BorderStyle="Ridge" BorderWidth="0px" Font-Bold="True" ForeColor="#0181C8" 
                                    NavigateUrl="~/Admin/ips/InfoManage.aspx">信息管理</asp:HyperLink>
                             </td>
                        </tr>
                    <!--第四行：-->
                    <tr>
                        <td>
                        
                                <asp:HyperLink ID="hlInfoAdd" runat="server" BorderColor="Silver" 
                                    BorderStyle="Ridge" BorderWidth="0px" Font-Bold="True" ForeColor="#0181C8" 
                                    NavigateUrl="~/Admin/ips/InfoAdd.aspx">信息添加</asp:HyperLink>
                        </td>
                    </tr>
                    </table>
            </div>
            <!--内容区-->
            <div id="content">
                <form id="infoTypeModifyForm" runat="server">
                    <table>
                    <!--第一行-->
                        <tr>
                            <td colspan="2">信息类别修改</td>
                        </tr>
                    <!--第二行-->
                        <tr>
                            <td>类别编号</td>
                            <td>
                                <asp:TextBox ID="txtTypeNo" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    <!--第三行-->
                        <tr>
                            <td>类别名称</td>
                            <td>
                                <asp:TextBox ID="txtTypeName" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                      <!--第四行-->
                        <tr>
                            <td></td>
                            <td>
                                
                                <asp:Button ID="btnSubmit" runat="server" CssClass="button" 
                                    onclick="btnSubmit_Click" Text="确定" />
                                
                            </td>
                        </tr>
                     </table>
                </form>
            </div>
        </div>
        <!--copyright-->
        <div id="copyright">
        
        </div>
   </div>
</body>
</html>
