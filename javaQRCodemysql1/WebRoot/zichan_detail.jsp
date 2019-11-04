<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>资产详细</title>
	<LINK href="css.css" type=text/css rel=stylesheet>

  </head>
  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"zichan");
     %>
  资产详细:
  <br><br>

   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
   <tr>
<td width='11%' height=44>编号：</td><td width='39%'><%=m.get("bianhao")%></td>
</tr><tr>
<td width='11%' height=44>名称：</td><td width='39%'><%=m.get("mingchen")%></td>
</tr><tr>
<td width='11%' height=44>数量：</td><td width='39%'><%=m.get("shuliang")%></td>
</tr><tr>
<td width='11%' height=44>总价值：</td><td width='39%'><%=m.get("zongjiazhi")%></td>
</tr><tr>
<td width='11%' height=44>购入时间：</td><td width='39%'><%=m.get("gourushijian")%></td>
</tr><tr>
<td width='11%' height=44>登记人：</td><td width='39%'><%=m.get("dengjiren")%></td>
</tr><tr>
<td width='11%' height=44>说明：</td><td width='39%'><%=m.get("shuoming")%></td>
</tr><tr>
<td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


