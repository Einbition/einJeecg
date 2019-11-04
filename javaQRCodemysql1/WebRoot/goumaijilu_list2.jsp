<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>购买记录</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有购买记录列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  单号：<input name="danhao" type="text" id="danhao" style='border:solid 1px #000000; color:#666666' size="12" />  商品名称：<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  类别：<input name="leibie" type="text" id="leibie" style='border:solid 1px #000000; color:#666666' size="12" />  价格：<input name="jiage" type="text" id="jiage" style='border:solid 1px #000000; color:#666666' size="12" />
     <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>

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
    <td width="60" align="center" bgcolor="339999">操作</td>
  </tr>
 <% 
  	


  	 new CommDAO().delete(request,"goumaijilu"); 
    String url = "goumaijilu_list2.jsp?1=1"; 
    String sql =  "select * from goumaijilu where goumairen='"+request.getSession().getAttribute("username")+"' ";
	
if(request.getParameter("danhao")=="" ||request.getParameter("danhao")==null ){}else{sql=sql+" and danhao like '%"+request.getParameter("danhao")+"%'";}
if(request.getParameter("shangpinmingcheng")=="" ||request.getParameter("shangpinmingcheng")==null ){}else{sql=sql+" and shangpinmingcheng like '%"+request.getParameter("shangpinmingcheng")+"%'";}
if(request.getParameter("leibie")=="" ||request.getParameter("leibie")==null ){}else{sql=sql+" and leibie like '%"+request.getParameter("leibie")+"%'";}
if(request.getParameter("jiage")=="" ||request.getParameter("jiage")==null ){}else{sql=sql+" and jiage like '%"+request.getParameter("jiage")+"%'";}
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
 
 <td width='80' align='center'><%=map.get("issh")%></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center">  <a href="goumaijilu_list2.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a href="goumaijilu_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table><br>
  
${page.info }
<input type="submit" name="Submit2" value="生成订单" onClick="location.href='dingdanxinxi_add.jsp'" style='border:solid 1px #000000; color:#666666' />

  </body>
</html>

