<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>�ʲ�</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>�����ʲ��б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ����ʱ�䣺<input name="gourushijian1" type="text" id="gourushijian1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="gourushijian2" type="text" id="gourushijian2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />   ��ţ�<input name="bianhao" type="text" id="bianhao" style='border:solid 1px #000000; color:#666666' size="12" />  ���ƣ�<input name="mingchen" type="text" id="mingchen" style='border:solid 1px #000000; color:#666666' size="12" />   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='zichan_listxls.jsp';" />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="339999">���</td>

    <td bgcolor='#339999'>���</td>

    <td bgcolor='#339999'>����</td>

    <td bgcolor='#339999'>����</td>

    <td bgcolor='#339999'>�ܼ�ֵ</td>
    <td bgcolor='#339999'>����ʱ��</td>

    <td bgcolor='#339999'>�Ǽ���</td>

    <td width="138" align="center" bgcolor="339999">���ʱ��</td>
    <td width="60" align="center" bgcolor="339999">����</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"zichan"); 
    String url = "zichan_list2.jsp?1=1"; 
    String sql =  "select * from zichan where dengjiren='"+request.getSession().getAttribute("username")+"' ";
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
    <td width="60" align="center"><a href="zichan_updt.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="zichan_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')">ɾ��</a>  <a href="zichan_detail.jsp?id=<%=map.get("id")%>" >��ϸ</a> </td>
  </tr>  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>