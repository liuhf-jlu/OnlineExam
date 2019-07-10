<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoTypeManage.aspx.cs" Inherits="Web.Admin.ips.InfoTypeManage" %>

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
                    <td class="pagePosition">&nbsp;&nbsp;当前位置：信息类别管理</td>
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
                <form id="infoTypeManageForm" runat="server">
                    <table>
                    <!--第一行-->
                        <tr>
                            <td colspan="5">信息类别管理</td>
                        </tr>
                    <!--第二行-->
                        <tr>
                            <td>类别编码</td>
                            <td>
                            
                                <asp:TextBox ID="txtTypeNo" runat="server" Width="160px"></asp:TextBox>
                            
                            </td>
                            <td>类别名称</td>
                            <td>
                            
                                <asp:TextBox ID="txtTypeName" runat="server" Width="160px"></asp:TextBox>
                            
                            </td>
                            <td>
                            
                                <asp:Button ID="btnSubmit" runat="server" CssClass="button" 
                                    onclick="btnSubmit_Click" Text="增加信息类别" />
                            
                            </td>
                        </tr>
                      <!--第三行-->
                        <tr>
                            <td colspan="5">
                                <asp:Repeater ID="rpInfoTypeList" runat="server">
                                   <HeaderTemplate>
                                        <table>
                                            <tr style="background-color:#009AFF; height:30px;">
                                                <td style="width:100px;">序号</td>
                                                <td style="width:100px;">类别编号</td>
                                                <td style="width:100px;">类别名称</td>
                                                <td style="width:100px;">类别状态</td>
                                                <td style="width:100px;">修改|删除</td>
                                                <td style="width:100px;">停用|启用</td>
                                            </tr>
                                   </HeaderTemplate>
                                   <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("id") %></td>
                                            <td><%#Eval("typeNo") %></td>
                                            <td><%#Eval("name") %></td>
                                            <td><%#Eval("stat") %></td>
                                            <td>
                                                <a href='InfoTypeModify.aspx?infoTypeID=<%#Eval("id")%>' target="_blank">修改</a>
                                                |
                                                <asp:LinkButton ID="lbnDelete" CommandName='<%#Eval("name") %>' CommandArgument='<%#Eval("id") %>'
                                                OnCommand='lbnDelete_Click'
                                                OnClientClick="return confirm('你确定要删除这条类型？');" runat="server">删除</asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lbnDiable" CommandName='<%#Eval("name") %>' CommandArgument='<%#Eval("id")%>'
                                                   OnCommand="lbnDisable_Click"
                                                   OnClientClick="return confirm('你确定要停用该类别？')" runat="server">停用</asp:LinkButton>
                                                   |
                                                <asp:LinkButton ID="lbnEnable" CommandName='<%#Eval("name") %>' CommandArgument='<%#Eval("id")%>'
                                                   OnCommand="lbnEnable_Click"
                                                   OnClientClick="return confirm('你确定要启用该类别？')" runat="server">启用</asp:LinkButton>
                                            </td>
                                        </tr>
                                   </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                             </td>
                        </tr>
                      <!--第四行-->
                        <tr>
                            <td colspan="5"></td>
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
