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
    <title>支出</title>
  </head>

  <body >
  <p>已有    <title>支出</title>列表：</p><table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="339999">序号</td>

    <td bgcolor='#339999'>单号</td>

    <td bgcolor='#339999'>名称</td>

    <td bgcolor='#339999'>类型</td>

    <td bgcolor='#339999'>费用</td>
    <td bgcolor='#339999'>日期</td>

    <td bgcolor='#339999'>登记人</td>

    <td width="138" align="center" bgcolor="339999">添加时间</td>
    <td width="60" align="center" bgcolor="339999">操作</td>
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
    <td width="60" align="center"><a href="zhichu_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a href="zhichu_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>  <a href="zhichu_detail.jsp?id=<%=map.get("id")%>" >详细</a> </td>
  </tr>  	<%
  }
   %>
</table>

<br>
以上数据共<%=i %>条
  </body>
</html>

