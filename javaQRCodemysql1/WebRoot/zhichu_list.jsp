<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>֧��</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>����֧���б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ���ڣ�<input name="riqi1" type="text" id="riqi1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="riqi2" type="text" id="riqi2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />   ���ƣ�<input name="mingchen" type="text" id="mingchen" style='border:solid 1px #000000; color:#666666' size="12" />  ���ͣ�<input name="leixing" type="text" id="leixing" style='border:solid 1px #000000; color:#666666' size="12" />   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='zhichu_listxls.jsp';" />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
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
  
${page.info }


  </body>
</html>