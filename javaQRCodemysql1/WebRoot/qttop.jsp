<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<div class="itop">
  <div class="itopc">
    <div class="itopcl"><span>欢迎进入超市管理系统官网!</span></div>
    <div class="itopcr">
	  <div align="right">
	  <%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
     %>
	    	      <a href="userlog.jsp">用户登陆</a><span>|</span><a href="userreg.jsp">用户注册</a>
				   <%}else{ %>
				当前用户:<%=request.getSession().getAttribute("username")%>,权限:<%=request.getSession().getAttribute("cx")%>; <a href="logout.jsp">退出</a>|<a href="main.jsp">个人后台</a>
				 <%} %>
                </div>
    </div>
  </div>
</div>
<div class="ilogo">
  <div class="ilogoc">
    <div class="ilogol"><img src="qtimages/timg.jpg" width="70" height="65" />
      <p><strong>超市管理系统</strong><br>
        <span>全力打造,精心呵护</span></p>
    </div>
   <!-- <div class="ilogor">
      <p>全国咨询热线：<br>
        <strong>400-xxxx-xxxx</strong></p>
    </div>-->
    <div class="clear"></div>
  </div>
</div>

<div id="hsgbanner">
		<div  class="navgrp">
		
			<ul class="nav" id="nav">
				
			  <li class="cur" ><a href="index.jsp">网站首页</a></li>
			  <li ><a href="dx_detail.jsp?lb=关于我们">关于我们</a> </li>
			   <li><a style="cursor:pointer">站内资讯</a>
				<div id="navChild"> <a href="news.jsp?lb=最新动态">最新动态</a> <a href="news.jsp?lb=活动信息">活动信息</a>  <a href="news.jsp?lb=服务帮助">服务帮助</a> </div>
			  </li>
			  
			 
			  <li><a href="shangpinxinxilisttp.jsp">商品信息</a> </li>
			 <!-- <li><a href="">荣誉资质</a> </li>-->
			  <li><a style="cursor:pointer">在线留言</a>
				<div id="navChild"> <a href="lyb.jsp">我要留言</a> <a href="lyblist.jsp">查看留言</a> </div>
			  </li>
			  <!--<li><a href="">人才招聘</a> </li>-->

			   <li><a href="login.jsp">后台管理</a> </li>
			</ul>
        </div>
 </div>




