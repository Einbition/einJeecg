<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����¼</title>

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
         <li><a class="diyi" >�����¼</a></li>
         <!--<li><a href="#">��ҵ��̬</a></li>
         <li><a href="#">������ʶ</a></li>
         <li><a href="#">����֧��</a></li>-->
       </ul>
     </div>
     <div class="dqwz fr">
     ��ǰλ�ã�<a href="index.jsp">��վ��ҳ</a> &gt; ��˾����     </div> 
  </div>
  <!--����������-->
  <!--��ϸ���ݵĿ�ʼ-->
  <div class="fxmain_nr">
    
	 <form name="form1" id="form1" method="post" action="">
   ����:  ���ţ�<input name="danhao" type="text" id="danhao" style='border:solid 1px #000000; color:#666666' size="12" />  ��Ʒ���ƣ�<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  ���<input name="leibie" type="text" id="leibie" style='border:solid 1px #000000; color:#666666' size="12" />  �۸�<input name="jiage" type="text" id="jiage" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit5" value="�л���ͼ"  style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='goumaijilulisttp.jsp';" />
</form>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse" class="newsline">  
  <tr>
    <td width="30" align="center" bgcolor="339999">���</td>
    <td bgcolor='#339999'>����</td>
    <td bgcolor='#339999'>��Ʒ���</td>
    <td bgcolor='#339999'>��Ʒ����</td>
    <td bgcolor='#339999'>���</td>
    <td bgcolor='#339999'>�۸�</td>
    <td bgcolor='#339999'>����</td>
    <td bgcolor='#339999'>������</td>
    <td bgcolor='#339999'>���</td>
    <td bgcolor='#339999'>������</td>
    
    
    
    <td width="30" align="center" bgcolor="339999">��ϸ</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"goumaijilu"); 
    String url = "goumaijilulist.jsp?issh=��"; 
    String sql =  "select * from goumaijilu where issh='��'";
	
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
    <td><%=map.get("danhao") %></td><td><%=map.get("shangpinbianhao") %></td><td><%=map.get("shangpinmingcheng") %></td><td><%=map.get("leibie") %></td><td><%=map.get("jiage") %></td><td><%=map.get("shuliang") %></td><td><%=map.get("goumaishu") %></td><td><%=map.get("jine") %></td><td><%=map.get("goumairen") %></td>
    
    <td width="30" align="center"> <a href="goumaijiludetail.jsp?id=<%=map.get("id")%>" >��ϸ</a></td>
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


