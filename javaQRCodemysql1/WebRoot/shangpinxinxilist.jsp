<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��Ʒ��Ϣ</title>

<link rel="stylesheet" type="text/css" href="qtimages/css/fxke.css"/>
<link rel="stylesheet" href="qtimages/hsgbanner.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 20px;
	font-weight: bold;
	color: #078548;
}
-->
</style>
</head>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<%

%>

<body>

<!--��ͷ���Ŀ�ʼ-->
<%@ include file="qttop.jsp"%>

<!--��ͷ���Ľ���--> <!--��Ʒ����ban��ʼ-->
<div class="newsban"></div>

<!--��Ʒ����ban����-->

<!--�������ݵĿ�ʼ-->
<div class="fxmain">
  <!--�������ʼ-->
  <div class="fx_fenlei">
     <div class="leibei fl">
       <ul>
         <li><a class="diyi" >��Ʒ��Ϣ</a></li>
         <!--<li><a href="#">��ҵ��̬</a></li>
         <li><a href="#">������ʶ</a></li>
         <li><a href="#">����֧��</a></li>-->
       </ul>
     </div>
     <div class="dqwz fr">
     ��ǰλ�ã�<a href="index.jsp">��վ��ҳ</a> &gt;     </div> 
  </div>
  <!--����������-->
  <!--��ϸ���ݵĿ�ʼ-->
  <div class="fxmain_nr">
    
	 <form name="form1" id="form1" method="post" action="">
   ����:  ��Ʒ���ƣ�<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  ���<%=Info.getselect("leibie","leibiexinxi","leibie"," 1=1 ")%>  �۸�<input name="jiage1" type="text" id="jiage1"  value='' style='border:solid 1px #000000; color:#666666;width:30px' />-<input name="jiage2" type="text" id="jiage2"  value='' style='border:solid 1px #000000; color:#666666;width:30px' />  ��������<input name="xiaoshouliang" type="text" id="xiaoshouliang" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit5" value="�л���ͼ"  style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='shangpinxinxilisttp.jsp';" />
</form>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse" class="newsline">  
  <tr>
    <td width="30" align="center" bgcolor="339999">���</td>
    <td bgcolor='#339999'>��Ʒ���</td>
    <td bgcolor='#339999'>��Ʒ����</td>
    <td bgcolor='#339999'>���</td>
    <td bgcolor='#339999'>�۸�</td>
    <td bgcolor='#339999'>����</td>
    
   
    <td bgcolor='#339999'>������</td>
    <td bgcolor='#339999' width='90' align='center'>ͼƬ</td>
    
    
    
    <td width="30" align="center" bgcolor="339999">��ϸ</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"shangpinxinxi"); 
    String url = "shangpinxinxilist.jsp?2=2"; 
    String sql =  "select * from shangpinxinxi where leibie='"+request.getParameter("lx")+"'";
	
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
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("shangpinbianhao") %></td><td><%=map.get("shangpinmingcheng") %></td><td><%=map.get("leibie") %></td><td><%=map.get("jiage") %></td><td><%=map.get("shuliang") %></td>
	
	<td><%=map.get("xiaoshouliang") %></td><td width='90'>
	<a href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>
    
    <td width="30" align="center"> <a href="shangpinxinxidetail.jsp?id=<%=map.get("id")%>" >��ϸ</a></td>
  </tr>
  	<%
  }
   %>
</table><br>

  
${page.info }						
					
  </div>
  
  <!--��ϸ���ݵĽ���-->
  
</div>

<!--�������ݵĽ���-->





<!--�ײ��Ŀ�ʼ-->
<%@ include file="qtdown.jsp"%>
<!--�ײ��Ľ���-->

</body>
</html>


