<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>�ʲ���ϸ</title>
	<LINK href="css.css" type=text/css rel=stylesheet>

  </head>
  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"zichan");
     %>
  �ʲ���ϸ:
  <br><br>

   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
   <tr>
<td width='11%' height=44>��ţ�</td><td width='39%'><%=m.get("bianhao")%></td>
</tr><tr>
<td width='11%' height=44>���ƣ�</td><td width='39%'><%=m.get("mingchen")%></td>
</tr><tr>
<td width='11%' height=44>������</td><td width='39%'><%=m.get("shuliang")%></td>
</tr><tr>
<td width='11%' height=44>�ܼ�ֵ��</td><td width='39%'><%=m.get("zongjiazhi")%></td>
</tr><tr>
<td width='11%' height=44>����ʱ�䣺</td><td width='39%'><%=m.get("gourushijian")%></td>
</tr><tr>
<td width='11%' height=44>�Ǽ��ˣ�</td><td width='39%'><%=m.get("dengjiren")%></td>
</tr><tr>
<td width='11%' height=44>˵����</td><td width='39%'><%=m.get("shuoming")%></td>
</tr><tr>
<td colspan=3 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=��ӡ onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


