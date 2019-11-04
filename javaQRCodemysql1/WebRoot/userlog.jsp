<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>内容详细</title>
<link rel="stylesheet" type="text/css" href="qtimages/css/fxke.css"/>
<link rel="stylesheet" href="qtimages/hsgbanner.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 20px;
	font-weight: bold;
	color: #078548;
}
-->
</style>
</head>
 <%
  String id=request.getParameter("id");
   new CommDAO().commOper("update xinwentongzhi set dianjilv=dianjilv+1 where id="+id);
%>
<body>

<!--新头部的开始-->
<%@ include file="qttop.jsp"%>

<!--新头部的结束--> <!--产品中心ban开始-->
<div class="newsban"></div>

<!--产品中心ban结束-->

<!--主体内容的开始-->
<div class="fxmain">
  <!--顶部类别开始-->
  <div class="fx_fenlei">
     <div class="leibei fl">
       <ul>
         <li><a class="diyi" >用户登陆</a></li>
         <!--<li><a href="#">行业动态</a></li>
         <li><a href="#">保养常识</a></li>
         <li><a href="#">技术支持</a></li>-->
       </ul>
     </div>
     <div class="dqwz fr">
     当前位置：<a href="index.jsp">网站首页</a> &gt; 用户登陆     </div> 
  </div>
  <!--顶部类别结束-->
  <!--详细内容的开始-->
  <div class="fxmain_nr">
    <table width="100%" height="500" border="0" cellpadding="0" cellspacing="0" background="qtimages/qtlogin.jpg">
      <tr>
        <td><%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
     %>
          <form action="javacsglxt?ac=login&amp;a=a" method="post" name="f11" id="f11" style="display: inline">
            <table width="100%" height="52%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="93" height="50">&nbsp;</td>
                <td width="99" height="28">用户名:</td>
                <td height="28" colspan="2"><input name="username" type="text" id="username"  placeholder="请输入用户名" style="width:160px; height:40px; border:solid 1px #000000; color:#666666;" /></td>
              </tr>
              <tr>
                <td height="50">&nbsp;</td>
                <td height="28">密码:</td>
                <td height="28" colspan="2"><input name="pwd1" type="password" id="pwd1"  placeholder="请输入密码" style="width:160px; height:40px; border:solid 1px #000000; color:#666666" /></td>
              </tr>
              <tr>
                <td height="50">&nbsp;</td>
                <td height="28">权限:</td>
                <td height="28" colspan="2"><select name="cx" id="cx" style="width:160px; height:40px; border:solid 1px #000000; color:#666666"  >
                    <option value="注册用户">注册用户</option>
                </select></td>
              </tr>
              <tr >
                <td height="50">&nbsp;</td>
                <td height="28">验证码</td>
                <td width="80" height="28"><input name="pagerandom" type="text" id="pagerandom" style=" height:20px; border:solid 1px #000000; color:#666666; width:50px" /></td>
                <td width="868"><a href="javascript:loadimage();"><img alt="看不清请点我！" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle" /></a></td>
              </tr>
              <script type="text/javascript">
          
           function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 
function checklog()
{
	if(document.f11.username.value=="" || document.f11.pwd1.value=="" || document.f11.pagerandom.value=="")
	{
		alert("请输入完整");
		return false;
	}
}
           
                                  </script>
              <tr>
                <td height="50" align="center">&nbsp;</td>
                <td height="38" colspan="3" align="left"><input type="submit" name="Submit" value="登陆" class="hsgbutton" onclick="return checklog();" />
                    <input type="reset" name="Submit2" value="重置" class="hsgbutton" /></td>
              </tr>
            </table>
          </form>
          <%}else{ %>
          <table width="90%" height="82%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="31%" height="30">用户名</td>
              <td width="69%" height="30"><%=request.getSession().getAttribute("username")%> </td>
            </tr>
            <tr>
              <td height="30">权限</td>
              <td height="30"><%=request.getSession().getAttribute("cx")%> </td>
            </tr>
            <tr>
              <td height="30" colspan="2" align="center"><input type="button" name="Submit3" value="退出" onclick="javascript:location.href='logout.jsp';" />
                  <input type="button" name="Submit32" value="个人后台" onclick="javascript:location.href='main.jsp';" />
              </td>
            </tr>
          </table>
        <%} %></td>
      </tr>
    </table>
  </div>
  
  <!--详细内容的结束-->
  
</div>

<!--主体内容的结束-->





<!--底部的开始-->
<%@ include file="qtdown.jsp"%>
<!--底部的结束-->

</body>
</html>
