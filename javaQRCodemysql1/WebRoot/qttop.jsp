<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<div class="itop">
  <div class="itopc">
    <div class="itopcl"><span>��ӭ���볬�й���ϵͳ����!</span></div>
    <div class="itopcr">
	  <div align="right">
	  <%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
     %>
	    	      <a href="userlog.jsp">�û���½</a><span>|</span><a href="userreg.jsp">�û�ע��</a>
				   <%}else{ %>
				��ǰ�û�:<%=request.getSession().getAttribute("username")%>,Ȩ��:<%=request.getSession().getAttribute("cx")%>; <a href="logout.jsp">�˳�</a>|<a href="main.jsp">���˺�̨</a>
				 <%} %>
                </div>
    </div>
  </div>
</div>
<div class="ilogo">
  <div class="ilogoc">
    <div class="ilogol"><img src="qtimages/timg.jpg" width="70" height="65" />
      <p><strong>���й���ϵͳ</strong><br>
        <span>ȫ������,���ĺǻ�</span></p>
    </div>
   <!-- <div class="ilogor">
      <p>ȫ����ѯ���ߣ�<br>
        <strong>400-xxxx-xxxx</strong></p>
    </div>-->
    <div class="clear"></div>
  </div>
</div>

<div id="hsgbanner">
		<div  class="navgrp">
		
			<ul class="nav" id="nav">
				
			  <li class="cur" ><a href="index.jsp">��վ��ҳ</a></li>
			  <li ><a href="dx_detail.jsp?lb=��������">��������</a> </li>
			   <li><a style="cursor:pointer">վ����Ѷ</a>
				<div id="navChild"> <a href="news.jsp?lb=���¶�̬">���¶�̬</a> <a href="news.jsp?lb=���Ϣ">���Ϣ</a>  <a href="news.jsp?lb=�������">�������</a> </div>
			  </li>
			  
			 
			  <li><a href="shangpinxinxilisttp.jsp">��Ʒ��Ϣ</a> </li>
			 <!-- <li><a href="">��������</a> </li>-->
			  <li><a style="cursor:pointer">��������</a>
				<div id="navChild"> <a href="lyb.jsp">��Ҫ����</a> <a href="lyblist.jsp">�鿴����</a> </div>
			  </li>
			  <!--<li><a href="">�˲���Ƹ</a> </li>-->

			   <li><a href="login.jsp">��̨����</a> </li>
			</ul>
        </div>
 </div>




