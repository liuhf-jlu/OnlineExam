<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xxfb.aspx.cs" Inherits="Web.xxfb" %>

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
                    <td class="pagePosition">&nbsp;&nbsp;当前位置：首页</td>
                </tr>
            </table>
        </div>
        <!--中间区-->
        <div id="middle">
            <!--功能区-->
            <div id="function">
                <form id ="loginForm" runat="server">
                    <table style="margin-left:0px;margin-top:4px;">
                    <!--第一行：放置ValidationSummary验证控件-->
                        <tr>
                            <td colspan="4">
                                <asp:ValidationSummary ID="validationSummary" runat="server"
                                ShowMessageBox="true" ShowSummary="false" ValidationGroup="G1" />
                            </td>
                        </tr>
                    <!--第二行：Label TextBox 等控件-->
                        <tr>
                            <td>
                                <asp:Label ID="lblNickName" runat="server" Text="登陆账号"></asp:Label>
                              </td>
                              <td colspan="2"> 
                                <asp:TextBox ID="txtNickName" width="90px" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                <asp:RequiredFieldValidator ID="rfvFieldValidator" runat="server" 
                                    ControlToValidate="txtNickName" Display="Dynamic" ErrorMessage="请输入账号" 
                                    ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                                    </td>
                        </tr>
                    <!--第三行：Label TextBox 等控件-->
                        <tr>
                            <td class="style1">                                
                                <asp:Label ID="lblPwd" runat="server" Text="登录密码"></asp:Label>
                                 </td>
                                 <td colspan="2">
                                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="90px"></asp:TextBox>
                                </td>
                                <td>
                                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" 
                                    ControlToValidate="txtPwd" Display="Dynamic" EnableViewState="False" 
                                    ErrorMessage="密码不为空" ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                                </td>
                           
                        </tr>
                    <!--第四行：-->
                    <tr>
                        <td>
                        
                            <asp:Label ID="lblRole" runat="server" Text="登录身份"></asp:Label>
                        
                        </td>
                        <td colspan="2">
                        
                            <asp:DropDownList ID="ddlRole" runat="server">
                                <asp:ListItem>请选择...</asp:ListItem>
                                <asp:ListItem Value="0">学生</asp:ListItem>
                                <asp:ListItem Value="1">教师</asp:ListItem>
                                <asp:ListItem Value="2">管理员</asp:ListItem>
                            </asp:DropDownList>
                        
                        </td>
                        <td>
                        
                            <asp:RequiredFieldValidator ID="rfvRole" runat="server" 
                                ControlToValidate="ddlRole" Display="Dynamic" EnableViewState="False" 
                                ErrorMessage="验证码不能为空" ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                        
                        </td>
                    </tr>
                    <!--第五行：-->
                    <tr>
                        <td>
                        
                            <asp:Label ID="lblpar" runat="server" Text="验证码"></asp:Label>
                        
                        </td>

                        <td>
                        
                            <asp:TextBox ID="txtPar" runat="server" Width="40px"></asp:TextBox>
                        
                        </td>

                        <td>
                        
                            <asp:TextBox ID="txtCrePar" runat="server" BackColor="#E9EDF0" 
                                BorderStyle="None" Width="40px"></asp:TextBox>
                        
                        </td>

                        <td>

                            <asp:RequiredFieldValidator ID="rfvPar" runat="server" 
                                ControlToValidate="txtPar" Display="Dynamic" ErrorMessage="验证码不能为空" 
                                ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvPar" runat="server" ControlToCompare="txtCrePar" 
                                ControlToValidate="txtPar" ErrorMessage="验证码错误" ForeColor="Red">*</asp:CompareValidator>

                        </td>
                    </tr>
                    <!--第六行：-->
                    <tr>
                        <td colspan="4">
                            
                            <asp:Button ID="btnLogin" runat="server" Text="登陆" 
                                CausesValidation="true" ValidationGroup="G1" CssClass="button" 
                                onclick="btnLogin_Click"/>
                            &nbsp;
                            <asp:Button ID="btnRegester" runat="server" 
                                onclientclick="javascript:alert('注册功能暂未开放');" CssClass="button" Text="注册" 
                                onclick="btnRegester_Click" />
                        </td>
                    </tr>
                    </table>
                </form>
            </div>
            <!--内容区-->
            <div id="content">
                <asp:Repeater ID="rpInfoList" runat="server">
                    <HeaderTemplate>
                        <table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="width:460px;">
                                <a href='Front/ips/InfoDetailView.aspx?InfoID=<%# Eval("infoId") %>'  target="_blank">
                                    <%# Eval("infoTitle") %>
                                </a>
                            </td>
                            <td style="width:100px;"><%# Eval("typeName") %></td>
                            <td style="width:40px;"><%# Eval("infoBrowserCount") %></td>                                           
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
        <!--copyright-->
        <div id="copyright">
        
        </div>
   </div>
</body>
</html>

