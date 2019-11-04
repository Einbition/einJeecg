<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=goumaijilu.xls");
%>
<html>
  <head>
    <title>购买记录</title>
  </head>

  <body >
  <p>已有购买记录列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="339999">序号</td>
    <td bgcolor='#339999'>单号</td>
    <td bgcolor='#339999'>商品编号</td>
    <td bgcolor='#339999'>商品名称</td>
    <td bgcolor='#339999'>类别</td>
    <td bgcolor='#339999'>价格</td>
    <td bgcolor='#339999'>数量</td>
    <td bgcolor='#339999'>购买数</td>
    <td bgcolor='#339999'>金额</td>
    <td bgcolor='#339999'>购买人</td>
    
    <td bgcolor='#339999' width='80' align='center'>是否审核</td>
    <td width="138" align="center" bgcolor="339999">添加时间</td>
    

  </tr>
  <% 

    String url = "goumaijilu_list.jsp?1=1"; 
    String sql =  "select * from goumaijilu where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("danhao") %></td>
    <td><%=map.get("shangpinbianhao") %></td>
    <td><%=map.get("shangpinmingcheng") %></td>
    <td><%=map.get("leibie") %></td>
    <td><%=map.get("jiage") %></td>
    <td><%=map.get("shuliang") %></td>
    <td><%=map.get("goumaishu") %></td>
    <td><%=map.get("jine") %></td>
    <td><%=map.get("goumairen") %></td>
    
    <td align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=goumaijilu" onclick="return confirm('您确定要执行此操作？')"><%=map.get("issh")%></a></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
以上数据共<%=i %>条
  </body>
</html>

