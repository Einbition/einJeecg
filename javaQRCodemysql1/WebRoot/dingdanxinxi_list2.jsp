<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>������Ϣ</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>

<!--hxsglxiangdxongjxs-->
  <body >
  <p>���ж�����Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  �����ţ�<input name="dingdanhao" type="text" id="dingdanhao" style='border:solid 1px #000000; color:#666666' size="12" />  ������<input name="dingdanjine" type="text" id="dingdanjine" style='border:solid 1px #000000; color:#666666' size="12" />  �û�����<input name="yonghuming" type="text" id="yonghuming" style='border:solid 1px #000000; color:#666666' size="12" />
     <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="339999">���</td>
    <td bgcolor='#339999'>������</td>
    <td bgcolor='#339999'>�������</td>
    <td bgcolor='#339999'>�û���</td>
    <td bgcolor='#339999'>����</td>
    <td bgcolor='#339999'>�绰</td>
    <td bgcolor='#339999'>��ַ</td>
    <td bgcolor='#339999' width='80' align='center'>�Ƿ�֧��</td>
    <td bgcolor='#339999' width='80' align='center'>�Ƿ����</td>
    <td width="138" align="center" bgcolor="339999">���ʱ��</td>
    <td width="60" align="center" bgcolor="339999">����</td>
  </tr>
 <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
  	 new CommDAO().delete(request,"dingdanxinxi"); 
    String url = "dingdanxinxi_list2.jsp?1=1"; 
    String sql =  "select * from dingdanxinxi where yonghuming='"+request.getSession().getAttribute("username")+"' ";
	
if(request.getParameter("dingdanhao")=="" ||request.getParameter("dingdanhao")==null ){}else{sql=sql+" and dingdanhao like '%"+request.getParameter("dingdanhao")+"%'";}
if(request.getParameter("dingdanjine")=="" ||request.getParameter("dingdanjine")==null ){}else{sql=sql+" and dingdanjine like '%"+request.getParameter("dingdanjine")+"%'";}
if(request.getParameter("yonghuming")=="" ||request.getParameter("yonghuming")==null ){}else{sql=sql+" and yonghuming like '%"+request.getParameter("yonghuming")+"%'";}
    sql+=" order by id desc";
	
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	//wxflzhistri
	//zoxngxetxoxngjxvi
//txixgihxngjs
//youzuiping2
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("dingdanhao") %></td>
 <td><%=map.get("dingdanjine") %></td>
 
 <td><%=map.get("yonghuming") %></td>
 <td><%=map.get("xingming") %></td>
 <td><%=map.get("dianhua") %></td>
 <td><%=map.get("dizhi") %></td>
 
 <td align='center'><%=map.get("iszf")%>  <% if(map.get("iszf").equals("��")){%><a href="zhifu/index.jsp?id=<%=map.get("id")%>&biao=dingdanxinxi"><font color='red'>֧��</font></a> <%}%> </td>
    <td width='80' align='center'><%=map.get("issh")%></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="dingdanxinxi_updt.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="dingdanxinxi_list2.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="dingdanxinxi_detail.jsp?id=<%=map.get("id")%>">��ϸ</a> </td>
  </tr>
  	<%
  }
   %>
</table><br>
<!--yoxugonxgzitoxnxgjxi--> <!--youzuiping3--> 
${page.info }

  <%
//yoxutixinxg if(kucddduntx>0)
//yoxutixinxg{
//yoxutixinxg tsgehxdhdm
//yoxutixinxg}
%>
  </body>
</html>

