<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>��Ʒ��Ϣ��ϸ</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"shangpinxinxi");
     %>
  ��Ʒ��Ϣ��ϸ:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%' height=44>��Ʒ��ţ�</td><td width='39%'><%=m.get("shangpinbianhao")%></td>
<td  rowspan=8 align=center><a href=<%=m.get("tupian")%> target=_blank><img src=<%=m.get("tupian")%> width=228 height=215 border=0></a></td></tr><tr>
<td width='11%' height=44>��Ʒ���ƣ�</td><td width='39%'><%=m.get("shangpinmingcheng")%></td>
</tr><tr>
<td width='11%' height=44>���</td><td width='39%'><%=m.get("leibie")%></td>
</tr><tr>
<td width='11%' height=44>�۸�</td><td width='39%'><%=m.get("jiage")%></td>
</tr><tr>
<td width='11%' height=44>������</td><td width='39%'><%=m.get("shuliang")%></td>
</tr><tr>


<td width='11%' height=44>��������</td><td width='39%'><%=m.get("xiaoshouliang")%></td>
</tr><tr>


<td width='11%' height=100  >��飺</td><td width='39%' colspan=2 height=100 ><%=m.get("jianjie")%></td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=��ӡ onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


