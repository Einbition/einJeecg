<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=zichan.xls");
%>
<html>
  <head>
    <title>资产</title>
  </head>

  <body >
  <p>已有    <title>资产</title>列表：</p><table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="339999">序号</td>

    <td bgcolor='#339999'>编号</td>

    <td bgcolor='#339999'>名称</td>

    <td bgcolor='#339999'>数量</td>

    <td bgcolor='#339999'>总价值</td>
    <td bgcolor='#339999'>购入时间</td>

    <td bgcolor='#339999'>登记人</td>

    <td width="138" align="center" bgcolor="339999">添加时间</td>
    <td width="60" align="center" bgcolor="339999">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"zichan"); 
    String url = "zichan_list.jsp?1=1"; 
    String sql =  "select * from zichan where 1=1";
if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null ){}else{sql=sql+" and bianhao like '%"+request.getParameter("bianhao")+"%'";}
if(request.getParameter("mingchen")=="" ||request.getParameter("mingchen")==null ){}else{sql=sql+" and mingchen like '%"+request.getParameter("mingchen")+"%'";}
if (request.getParameter("gourushijian1")==""  ||request.getParameter("gourushijian1")==null ) {}else{sql=sql+" and gourushijian >= '"+request.getParameter("gourushijian1")+"'";}
if (request.getParameter("gourushijian2")==""  ||request.getParameter("gourushijian2")==null ) {}else {sql=sql+" and gourushijian <= '"+request.getParameter("gourushijian2")+"'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>

    <td><%=map.get("bianhao") %></td>
    <td><%=map.get("mingchen") %></td>
    <td><%=map.get("shuliang") %></td>
    <td><%=map.get("zongjiazhi") %></td>
    <td><%=map.get("gourushijian") %></td>
    <td><%=map.get("dengjiren") %></td>    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="zichan_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a href="zichan_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>  <a href="zichan_detail.jsp?id=<%=map.get("id")%>" >详细</a> </td>
  </tr>  	<%
  }
   %>
</table>

<br>
以上数据共<%=i %>条
  </body>
</html>

