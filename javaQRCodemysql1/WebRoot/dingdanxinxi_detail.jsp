<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>������Ϣ��ϸ</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"dingdanxinxi");
     %>
  ������Ϣ��ϸ:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>�����ţ�</td><td width='39%'><%=m.get("dingdanhao")%></td><td width='11%'>������</td><td width='39%'><%=m.get("dingdanjine")%></td></tr><tr><td width='11%'>�������ݣ�</td><td width='39%'><%=m.get("dingdanneirong")%></td><td width='11%'>�û�����</td><td width='39%'><%=m.get("yonghuming")%></td></tr><tr><td width='11%'>������</td><td width='39%'><%=m.get("xingming")%></td><td width='11%'>�绰��</td><td width='39%'><%=m.get("dianhua")%></td></tr><tr><td width='11%'>��ַ��</td><td width='39%'><%=m.get("dizhi")%></td><td width='11%'>��ע��</td><td width='39%'><%=m.get("beizhu")%></td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=��ӡ onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


