<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>支出详细</title>
	<LINK href="css.css" type=text/css rel=stylesheet>

  </head>
  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"zhichu");
     %>
  支出详细:
  <br><br>

   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
   <tr>
<td width='11%' height=44>单号：</td><td width='39%'><%=m.get("danhao")%></td>
</tr><tr>
<td width='11%' height=44>名称：</td><td width='39%'><%=m.get("mingchen")%></td>
</tr><tr>
<td width='11%' height=44>类型：</td><td width='39%'><%=m.get("leixing")%></td>
</tr><tr>
<td width='11%' height=44>费用：</td><td width='39%'><%=m.get("feiyong")%></td>
</tr><tr>
<td width='11%' height=44>日期：</td><td width='39%'><%=m.get("riqi")%></td>
</tr><tr>
<td width='11%' height=44>登记人：</td><td width='39%'><%=m.get("dengjiren")%></td>
</tr><tr>
<td width='11%' height=44>备注：</td><td width='39%'><%=m.get("beizhu")%></td>
</tr><tr>
<td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


