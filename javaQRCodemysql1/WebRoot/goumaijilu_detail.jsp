<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>购买记录详细</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"goumaijilu");
     %>
  购买记录详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>单号：</td><td width='39%'><%=m.get("danhao")%></td><td width='11%'>商品编号：</td><td width='39%'><%=m.get("shangpinbianhao")%></td></tr><tr><td width='11%'>商品名称：</td><td width='39%'><%=m.get("shangpinmingcheng")%></td><td width='11%'>类别：</td><td width='39%'><%=m.get("leibie")%></td></tr><tr><td width='11%'>价格：</td><td width='39%'><%=m.get("jiage")%></td><td width='11%'>数量：</td><td width='39%'><%=m.get("shuliang")%></td></tr><tr><td width='11%'>购买数：</td><td width='39%'><%=m.get("goumaishu")%></td><td width='11%'>金额：</td><td width='39%'><%=m.get("jine")%></td></tr><tr><td width='11%'>购买人：</td><td width='39%'><%=m.get("goumairen")%></td><td width='11%'>备注：</td><td width='39%'><%=m.get("beizhu")%></td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


