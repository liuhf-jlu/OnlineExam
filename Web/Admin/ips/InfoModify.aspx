<%@ Page Language="C#"   AutoEventWireup="true"  CodeBehind="InfoModify.aspx.cs" Inherits="Web.Admin.ips.InfoModify" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="ftb" Namespace="FreeTextBoxControls" Assembly="FreeTextBox"  %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>信息修改</title>
    <link rel="stylesheet" href="~/css/public.css" type="text/css" />   
</head>
<body>
    <div id="container">
        <!-- logo -->
        <div id="logo_ips"></div>
        <!-- 导航区 -->
        <div id="navigation">
    		<table>
    			<tr>
    				<td class="pagePostion">&nbsp;&nbsp;当前位置：信息修改</td>
    			</tr>
    		</table>
        </div>
        <!-- 中间区 -->
        <div id="middle">
	        <!-- 功能区 -->
	        <div id="function">
                <table style="margin-left:10px; margin-top:10px;">                                 
                    <tr>
                        <td>
                            <asp:HyperLink ID="hlHomePage" runat="server" NavigateUrl="~/Default.aspx" 
                                BorderColor="Silver" BorderStyle="Ridge" Font-Bold="True" 
                                ForeColor="#0181C8" BorderWidth="0px" 
                                Font-Underline="False">返回主页</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <asp:HyperLink ID="hlInfoTypeManage" runat="server" 
                                NavigateUrl="~/Admin/ips/InfoTypeManage.aspx" 
                                BorderStyle="Ridge" BorderWidth="0px" Font-Bold="True" 
                                Font-Underline="False" ForeColor="#0181C8">信息分类管理</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="hlInfoManage" runat="server" 
                                NavigateUrl="~/Admin/ips/InfoManage.aspx" BorderColor="Silver" 
                                BorderStyle="Ridge" BorderWidth="0px" Font-Bold="True" 
                                Font-Strikeout="False" ForeColor="#0181C8">信息管理</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="hlInfoAdd" runat="server" 
                                NavigateUrl="~/Admin/ips/InfoAdd.aspx" BorderColor="Silver" 
                                BorderStyle="Ridge" BorderWidth="0px" Font-Bold="True"
                                Font-Underline="False" ForeColor="#0181C8">信息增加</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- 内容区 -->
	        <div id="content">
                <form id="infoModifyForm" name="infoModifyForm" runat="server" >
                    <table>
                        <tr>
                            <th colspan="7">信息修改</th>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <asp:ValidationSummary ID="validationSummary" runat="server" 
                                    ForeColor="Red" ShowSummary="True"
                                    DisplayMode="SingleParagraph" ValidationGroup="vgInfo" />
                            </td>
                        </tr>
                        <tr>
                            <td>信息标题</td>
                            <td colspan="6">
                                <asp:TextBox ID="txtTitle" runat="server" Width="520px" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle"
                                    Display="Dynamic" ErrorMessage="标题不能空" ForeColor="Red"
                                    ValidationGroup="vgInfo">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>下架日期</td>
                            <td>
                                <asp:TextBox ID="txtEndDate" runat="server" Width="133px" ReadOnly="true"></asp:TextBox>
                                <asp:ImageButton ID="ibnCalendar" runat="server" 
                                    ImageUrl="~/images/calendar.jpg" onclick="ibnCalendar_Click"/>
                                <asp:Calendar ID="cdEndDate" runat="server" BackColor="White" BorderColor="#3366CC"
                                    BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana"
                                    Font-Size="8pt" ForeColor="#003399" OnSelectionChanged="cdEndDate_SelectionChanged"
                                    Visible="false" BorderStyle="Solid" 
                                    NextPrevFormat="ShortMonth" 
                                    CssClass="left: 300px; position:absolute; top: 200px;">
                                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                    <WeekendDayStyle BackColor="#CCCCFF" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
                                        Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                </asp:Calendar> 
                                <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="txtEndDate"
                                    Display="Dynamic" ErrorMessage="结束不能空" ForeColor="Red" 
                                    ValidationGroup="vgInfo">*</asp:RequiredFieldValidator>
                            </td>
                            <td>信息类别</td>
                            <td>
                                <asp:DropDownList ID="ddlInfoType" runat="server" Width="120px">
                                </asp:DropDownList>
                                <asp:CompareValidator ID="cvInfoType"  runat="server" ControlToValidate="ddlInfoType"
                                    Display="Dynamic" ErrorMessage="类别必选" ForeColor="Red" ValueToCompare="0" Operator="NotEqual"
                                    ValidationGroup="vgInfo">*</asp:CompareValidator>
                            </td>
                            <td>置顶</td>
                            <td>
                                <asp:DropDownList ID="ddlIsTop" runat="server">
                                    <asp:ListItem Text="置顶" Selected="True" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="不置顶" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="6">    
                                <ftb:FreeTextBox ID="FreeTextBox1" runat="Server" 
                                    ButtonImagesLocation="ExternalFile" DesignModeCss="designmode.css" Focus="true" 
                                    GutterBackColor="red" JavaScriptLocation="ExternalFile" Language="zh-CN" 
                                    SupportFolder="~/aspnet_client/FreeTextBox/" ToolbarImagesLocation="ExternalFile"
                                    ImageGalleryPath = "uploadpic"                                      
                                    ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,&#13;&#10;FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,&#13;&#10;JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo,Save|&#13;&#10;SymbolsMenu|InsertRule,InsertDate,InsertTime|InsertTable,EditTable;InsertTableRowAfter,&#13;&#10;InsertTableRowBefore,DeleteTableRow;InsertTableColumnAfter,InsertTableColumnBefore,DeleteTableColumn|InsertForm,InsertTextBox,&#13;&#10;InsertTextArea,InsertRadioButton,InsertCheckBox,InsertDropDownList,InsertButton|InsertDiv,EditStyle,InsertImageFromGallery,&#13;&#10;Preview,SelectAll,WordClean"
                                    ToolbarStyleConfiguration="officeXP" Width="580px" Height="260px">
                                </ftb:FreeTextBox>  
                             </td>
                             <td>                              
                                <asp:RequiredFieldValidator ID="rfvFreeTextBox1" runat="server" ControlToValidate="FreeTextBox1"
                                    Display="Dynamic" ErrorMessage="内容不能空" ForeColor="Red" ValidationGroup="vgInfo">*</asp:RequiredFieldValidator>
                           
                            </td>                            
                        </tr>
                        <tr>
                            <td colspan="7" style="text-align:center;">                                
                                <asp:Button ID="btnSubmitPublish" runat="server" 
                                    CausesValidation="True" ValidationGroup="vgInfo" 
                                    CssClass="button" OnClick="btnSubmitPublish_Click" Text="提交" />&nbsp;                                
                            </td>
                        </tr>
                      
                    </table>
                </form>
            </div>
        </div>
        <!-- copyright -->
        <div id="copyright"></div>
    </div>
</body>
</html>
