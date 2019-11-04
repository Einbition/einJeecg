<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>支出</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有支出列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  日期：<input name="riqi1" type="text" id="riqi1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="riqi2" type="text" id="riqi2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />   名称：<input name="mingchen" type="text" id="mingchen" style='border:solid 1px #000000; color:#666666' size="12" />  类型：<input name="leixing" type="text" id="leixing" style='border:solid 1px #000000; color:#666666' size="12" />   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='zhichu_listxls.jsp';" />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
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
  
${page.info }


  </body>
</html>