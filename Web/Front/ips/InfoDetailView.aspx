<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoDetailView.aspx.cs" Inherits="web.Front.ips.InfoDetailView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="~/css/public.css" type="text/css"/>
    <style type="text/css">
        .container
        {
            margin-top:20px;
            margin-left:auto;
            margin-right:auto;
            width:1000px;
            height:800px;
        }
        .infoTitle
        {
            margin-top:10px;
            text-align:center;
            vertical-align:middle;
            font-size:14pt;
            font-weight:bold;
            height:30px;
        }
        .infoAuthor
        {
            text-align:center;
            height:30px;
            font-size:10pt;
            
        }
        .infoContent
        {
            margin-top:20px;
            text-align:left;
        }
        .infoCloseButtonArear
        {
            height:30px;
            text-align:center;
            vertical-align:middle;
        }
    </style>
</head>
<body>
    
    <div id="container">
    <!--logo-->
        <div id="logo_ips"></div>
        <!--导航区-->
        <div id="navigation">
            <table>
                <tr>
                    <td class="pagePostion">&nbsp;&nbsp;当前位置:  首页</td>
                </tr>
           </table>
        </div>
         <!--中间区-->
            <div id="middle">
                <div id="function">
                </div>
            </div>
        <!--内容区-->
        <div id="content">
             <form id="Form1" name="infoDetailForm" runat="server">
                <div class="infoTitle">
                    <asp:Label ID="lblInfoTitle" runat="server"></asp:Label>
                </div>
                <div class="infoAuthor">
                    发布者：<asp:Label ID="lblUserName" runat="server" ></asp:Label>|
                    发布日期：<asp:Label ID="lblInfoPublishTime" runat="server" ></asp:Label>|
                    浏览量：<asp:Label ID="lblInfoBrowserCount" runat="server" ></asp:Label>
                </div>
                <div class="infoContent">
                        <asp:Label ID="lblInfoContent" runat="server" ></asp:Label>
                </div>
                <div class="infoCloseButtonArear">
                    <asp:Button ID="btnClose" runat="server" Text="关闭" CssClass="button" OnClientClick="javascript:window.close();" />
                </div>
            </form>
       </div>
        
        
        <!--copyright-->
        <div id="copyright"></div>

    </div>
    <div class="container">
           
    </div>
   
</body>
</html>
