<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=shangpinxinxi.xls");
%>
<html>
  <head>
    <title>��Ʒ��Ϣ</title>
  </head>

  <body >
  <p>������Ʒ��Ϣ�б�</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="339999">���</td>
    <td bgcolor='#339999'>��Ʒ���</td>
    <td bgcolor='#339999'>��Ʒ����</td>
    <td bgcolor='#339999'>���</td>
    <td bgcolor='#339999'>�۸�</td>
    <td bgcolor='#339999'>����</td>
   
   
    <td bgcolor='#339999'>������</td>
    <td bgcolor='#339999' width='90' align='center'>ͼƬ</td>
    
    
    <td width="138" align="center" bgcolor="339999">���ʱ��</td>
    

  </tr>
  <% 

    String url = "shangpinxinxi_list.jsp?1=1"; 
    String sql =  "select * from shangpinxinxi where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("shangpinbianhao") %></td>
    <td><%=map.get("shangpinmingcheng") %></td>
    <td><%=map.get("leibie") %></td>
    <td><%=map.get("jiage") %></td>
    <td><%=map.get("shuliang") %></td>
    
   
    <td><%=map.get("xiaoshouliang") %></td>
    <td width='90' align='center'><a href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>
    
    
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
�������ݹ�<%=i %>��
  </body>
</html>

