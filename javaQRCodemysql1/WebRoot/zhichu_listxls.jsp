<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=zhichu.xls");
%>
<html>
  <head>
    <title>֧��</title>
  </head>

  <body >
  <p>����    <title>֧��</title>�б�</p><table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="339999">���</td>

    <td bgcolor='#339999'>����</td>

    <td bgcolor='#339999'>����</td>

    <td bgcolor='#339999'>����</td>

    <td bgcolor='#339999'>����</td>
    <td bgcolor='#339999'>����</td>

    <td bgcolor='#339999'>�Ǽ���</td>

    <td width="138" align="center" bgcolor="339999">���ʱ��</td>
    <td width="60" align="center" bgcolor="339999">����</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"zhichu"); 
    String url = "zhichu_list.jsp?1=1"; 
    String sql =  "select * from zhichu where 1=1";
if(request.getParameter("mingchen")=="" ||request.getParameter("mingchen")==null ){}else{sql=sql+" and mingchen like '%"+request.getParameter("mingchen")+"%'";}
if(request.getParameter("leixing")=="" ||request.getParameter("leixing")==null ){}else{sql=sql+" and leixing like '%"+request.getParameter("leixing")+"%'";}
if (request.getParameter("riqi1")==""  ||request.getParameter("riqi1")==null ) {}else{sql=sql+" and riqi >= '"+request.getParameter("riqi1")+"'";}
if (request.getParameter("riqi2")==""  ||request.getParameter("riqi2")==null ) {}else {sql=sql+" and riqi <= '"+request.getParameter("riqi2")+"'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>

    <td><%=map.get("danhao") %></td>
    <td><%=map.get("mingchen") %></td>
    <td><%=map.get("leixing") %></td>
    <td><%=map.get("feiyong") %></td>
    <td><%=map.get("riqi") %></td>
    <td><%=map.get("dengjiren") %></td>    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="zhichu_updt.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="zhichu_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')">ɾ��</a>  <a href="zhichu_detail.jsp?id=<%=map.get("id")%>" >��ϸ</a> </td>
  </tr>  	<%
  }
   %>
</table>

<br>
�������ݹ�<%=i %>��
  </body>
</html>

