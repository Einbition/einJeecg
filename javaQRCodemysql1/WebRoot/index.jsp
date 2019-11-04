<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>超市管理系统首页</title>
<link rel="stylesheet" type="text/css" href="qtimages/css/fxke.css"/>
<link rel="stylesheet" href="qtimages/hsgbanner.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>
</head>

<body>

<!--新头部的开始-->
<%@ include file="qttop.jsp"%>
<!--新头部的结束--> 

<!--ban图片切换开始-->
<%@ include file="bht.jsp"%>
<!--ban图片切换结束--> 

<!--视频和关于我们的开始-->
<div class="spgy"> 
  <!--视频的开始-->
 
  <!--关于我们的结束-->
  <div style="clear: both;"> </div>
</div>
<!--视频和关于我们的结束--> 

<!--产品中心的开始-->
<div class="jfcp">
  <div class="jfcpleft fl">
    <div class="jfcp_title">
      <p><strong>商品分类</strong><br />
        <span>PRODUCTS</span></p>
    </div>
    <div class="fxxian">
      <div class="jfcp_nr">
        <ul>
		
		 <%
										int ti=0;
										 for(HashMap mmx:new CommDAO().select("select * from leibiexinxi where 1=1 order by id desc ",1,9)){
	
	 	ti=ti+1;
										%>
										
          <li><a href="shangpinxinxilist.jsp?lx=<%=mmx.get("leibie") %>" target="_blank"><%=mmx.get("leibie") %></a></li>
		  
		   <%
										
  	}
  %>
         
        </ul>
      </div>
    </div>
    <!--联系方式的开始-->
   <!-- <div class="ttlx"> <a href="#">产品优势 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   > </a> <a href="#">选型指南 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   > </a> <a href="#">技术支持 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   > </a> </div>-->
    <!--联系方式的结束--> 
	
  </div>
  <div class="jfcpright fr">
    <div class="tjcp_title">
      <div class="tjcpleft">
        <p> Hot Products<br />
          <span>商品展示</span> </p>
      </div>
      <a href="shangpinxinxilisttp.jsp" target="_blank"><img src="qtimages/tongtai_15-05.gif" width="59" height="20" /></a> </div>
    <div class="tjcp_nr"> 
      <ul>
	  <%
										int tti=0;
										 for(HashMap map:new CommDAO().select("select * from shangpinxinxi where 1=1 order by id desc ",1,6)){
	
	 	tti=tti+1;
										%>
	  
	  
	  
      <div class="cpalt"> <a href="shangpinxinxidetail.jsp?id=<%=map.get("id") %>" target="_blank"><img src="<%=map.get("tupian") %>" width="226" height="151" /></a> <a  href="shangpinxinxidetail.jsp?id=<%=map.get("id") %>" target="_blank"></a>美食名称：<%=map.get("shangpinmingcheng") %> </div>
      
	   <%
										 if(tti==3)
										 {
										 	
										 }
  	}
  %>
	  
	   </ul>
      
    </div>
  </div>
  <div class="clear"></div>
</div>

<!--产品中心的结束--> 

<!--广告的开始-->
<div class="fxgg"></div>
<!--广告的结束--> 



<!--办公环境的开始-->
<div class="bghj">
  <div class="bghjc">
   
    
  </div>
</div>

<!--办公环境的结束--> 

<!--新闻中心的开始-->
<div class="jxwzx"> 
  <!--左侧新闻的开始-->
  <div class="jnews fl"> 
    <!--标题的开始-->
    <div class="jnews_title">
      <ul>
        <li style="border-right:1px solid #d6d6d6;" id="lm1" onmousemove="setTabb(1)" class="selectTab4"><a href="news.jsp?lb=最新动态"><strong>最新动态</strong><span>COMPANY NEWS</span></a></li>
        <li id="lm2" onmousemove="setTabb(2)"><a href="news.jsp?lb=活动信息"><strong>活动信息</strong><span>TECHNIQUE SUPPORT</span></a></li>
      </ul>
    </div>
    <!--标题的开始--> 
    <!--内容的开始-->
    <div class="jnews_nr">
      <div class="newsxian" id="Setln1"> 
        <!--单个的开始-->
        <div class="newsc">

          <div class="newss_list">
            <ul>
				 <%
										
    for(HashMap map:new CommDAO().select("select * from xinwentongzhi where leibie='最新动态' order by id desc ",1,9)){
	
     %>
			     <li><a href="gg_detail.jsp?id=<%=map.get("id")%>"><%=Info.ensubStr(map.get("biaoti"),26)%></a><span><%=map.get("addtime").toString().substring(0,10)%></span></li>
		 <%
							}
							%>
                
            </ul>
          </div>
        </div>
        <!--单个的结束--> 
      </div>
      <div class="newsyin" id="Setln2"> 
        <!--单个的开始-->
        <div class="newsc">
		         
          <div class="newss_list">
            <ul>
			      <%
										
    for(HashMap map:new CommDAO().select("select * from xinwentongzhi where leibie='活动信息' order by id desc ",1,9)){
	
     %>
			     <li><a href="gg_detail.jsp?id=<%=map.get("id")%>"><%=Info.ensubStr(map.get("biaoti"),26)%></a><span><%=map.get("addtime").toString().substring(0,10)%></span></li>
		 <%
							}
							%>   
                      
            </ul>
          </div>
        </div>
        <!--单个的结束--> 
      </div>
    </div>
    <!--内容的结束--> 
  </div>
  <script src="js/sy.js" type="text/javascript"></script>
  <!--左侧新闻的结束--> 
  <!--右侧联系我们的开始-->
  <div class="jlxwm fr">
    <div class="jlxwm1" ><strong class="bt1">联系我们</strong><span class="bt2">Contact Us</span><a class="gd" href="dx_detail.jsp?lb=联系我们" >&gt;&gt;</a></div>
    <div class="slxwmc">
      <div class="dianhua">服务电话：<br>
        <span style="font-size:20px;">400-008-0378</span></div>
      <p><strong>超市管理系统网站有限公司</strong><br />
        销售热线：0371-xxxxxxx <br />
        传真：0371-xxxxxx <br />
        电子邮箱：xxxxxx@126.com<br />
        地址：xxxxxxxx<br />
        办事处电话：0991-xxxxxx<br />
      
        地址：xxxxxxxxxxxxxxxx号</p>
    </div>
  </div>
  <!--右侧联系我们结束-->
  <div class="clear"></div>
</div>

<!--新闻中心的结束--> 

<%@ include file="qtdown.jsp"%>


</body>




</html>



