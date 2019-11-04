<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>商品信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有商品信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  商品名称：<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  类别：<%=Info.getselect("leibie","leibiexinxi","leibie"," 1=1 ")%>  价格：<input name="jiage1" type="text" id="jiage1"  value='' style='border:solid 1px #000000; color:#666666;width:30px' />-<input name="jiage2" type="text" id="jiage2"  value='' style='border:solid 1px #000000; color:#666666;width:30px' />  销售量：<input name="xiaoshouliang" type="text" id="xiaoshouliang" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='shangpinxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="339999">序号</td>
    <td bgcolor='#339999'>商品编号</td>
    <td bgcolor='#339999'>商品名称</td>
    <td bgcolor='#339999'>类别</td>
	 <td bgcolor='#339999'>成本价</td>
    <td bgcolor='#339999'>价格</td>
    <td bgcolor='#339999'>数量</td>
    
  
    <td bgcolor='#339999'>销售量</td>
	 <td bgcolor='#339999'>利润</td>
    <td width="60" align="center" bgcolor="339999">操作</td>
  </tr>
  <% 
  	
	double jinez=0;

  	 new CommDAO().delete(request,"shangpinxinxi"); 
    String url = "shangpinxinxi_list1.jsp?1=1"; 
    String sql =  "select * from shangpinxinxi where 1=1";
	
if(request.getParameter("shangpinmingcheng")=="" ||request.getParameter("shangpinmingcheng")==null ){}else{sql=sql+" and shangpinmingcheng like '%"+request.getParameter("shangpinmingcheng")+"%'";}
if(request.getParameter("leibie")=="" ||request.getParameter("leibie")==null ){}else{sql=sql+" and leibie like '%"+request.getParameter("leibie")+"%'";}
if (request.getParameter("jiage1")==""  ||request.getParameter("jiage1")==null ) {}else{sql=sql+" and jiage >= '"+request.getParameter("jiage1")+"'";}
if (request.getParameter("jiage2")==""  ||request.getParameter("jiage2")==null ) {}else {sql=sql+" and jiage <= '"+request.getParameter("jiage2")+"'";}
if(request.getParameter("xiaoshouliang")=="" ||request.getParameter("xiaoshouliang")==null ){}else{sql=sql+" and xiaoshouliang like '%"+request.getParameter("xiaoshouliang")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	
jinez=jinez+Float.valueOf((String)map.get("lirun")).floatValue();

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("shangpinbianhao") %></td>
    <td><%=map.get("shangpinmingcheng") %></td>
    <td><%=map.get("leibie") %></td>
	 <td><%=map.get("chengbenjia") %></td>
    <td><%=map.get("jiage") %></td>
    <td><%=map.get("shuliang") %></td>
   
   
    <td><%=map.get("xiaoshouliang") %></td>
	 <td><%=map.get("lirun") %></td>
    <td width="60" align="center"> <a href="shangpinxinxidetail.jsp?id=<%=map.get("id")%>" target="_blank">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  共计利润:<%=jinez%>；  
${page.info }


  </body>
</html>

