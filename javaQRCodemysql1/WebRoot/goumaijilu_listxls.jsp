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
    <title>�����¼</title>
  </head>

  <body >
  <p>���й����¼�б�</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="339999">���</td>
    <td bgcolor='#339999'>����</td>
    <td bgcolor='#339999'>��Ʒ���</td>
    <td bgcolor='#339999'>��Ʒ����</td>
    <td bgcolor='#339999'>���</td>
    <td bgcolor='#339999'>�۸�</td>
    <td bgcolor='#339999'>����</td>
    <td bgcolor='#339999'>������</td>
    <td bgcolor='#339999'>���</td>
    <td bgcolor='#339999'>������</td>
    
    <td bgcolor='#339999' width='80' align='center'>�Ƿ����</td>
    <td width="138" align="center" bgcolor="339999">���ʱ��</td>
    

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
    
    <td align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=goumaijilu" onclick="return confirm('��ȷ��Ҫִ�д˲�����')"><%=map.get("issh")%></a></td>
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

