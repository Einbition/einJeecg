<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���й���ϵͳ��ҳ</title>
<link rel="stylesheet" type="text/css" href="qtimages/css/fxke.css"/>
<link rel="stylesheet" href="qtimages/hsgbanner.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>
</head>

<body>

<!--��ͷ���Ŀ�ʼ-->
<%@ include file="qttop.jsp"%>
<!--��ͷ���Ľ���--> 

<!--banͼƬ�л���ʼ-->
<%@ include file="bht.jsp"%>
<!--banͼƬ�л�����--> 

<!--��Ƶ�͹������ǵĿ�ʼ-->
<div class="spgy"> 
  <!--��Ƶ�Ŀ�ʼ-->
 
  <!--�������ǵĽ���-->
  <div style="clear: both;"> </div>
</div>
<!--��Ƶ�͹������ǵĽ���--> 

<!--��Ʒ���ĵĿ�ʼ-->
<div class="jfcp">
  <div class="jfcpleft fl">
    <div class="jfcp_title">
      <p><strong>��Ʒ����</strong><br />
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
    <!--��ϵ��ʽ�Ŀ�ʼ-->
   <!-- <div class="ttlx"> <a href="#">��Ʒ���� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   > </a> <a href="#">ѡ��ָ�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   > </a> <a href="#">����֧�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   > </a> </div>-->
    <!--��ϵ��ʽ�Ľ���--> 
	
  </div>
  <div class="jfcpright fr">
    <div class="tjcp_title">
      <div class="tjcpleft">
        <p> Hot Products<br />
          <span>��Ʒչʾ</span> </p>
      </div>
      <a href="shangpinxinxilisttp.jsp" target="_blank"><img src="qtimages/tongtai_15-05.gif" width="59" height="20" /></a> </div>
    <div class="tjcp_nr"> 
      <ul>
	  <%
										int tti=0;
										 for(HashMap map:new CommDAO().select("select * from shangpinxinxi where 1=1 order by id desc ",1,6)){
	
	 	tti=tti+1;
										%>
	  
	  
	  
      <div class="cpalt"> <a href="shangpinxinxidetail.jsp?id=<%=map.get("id") %>" target="_blank"><img src="<%=map.get("tupian") %>" width="226" height="151" /></a> <a  href="shangpinxinxidetail.jsp?id=<%=map.get("id") %>" target="_blank"></a>��ʳ���ƣ�<%=map.get("shangpinmingcheng") %> </div>
      
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

<!--��Ʒ���ĵĽ���--> 

<!--���Ŀ�ʼ-->
<div class="fxgg"></div>
<!--���Ľ���--> 



<!--�칫�����Ŀ�ʼ-->
<div class="bghj">
  <div class="bghjc">
   
    
  </div>
</div>

<!--�칫�����Ľ���--> 

<!--�������ĵĿ�ʼ-->
<div class="jxwzx"> 
  <!--������ŵĿ�ʼ-->
  <div class="jnews fl"> 
    <!--����Ŀ�ʼ-->
    <div class="jnews_title">
      <ul>
        <li style="border-right:1px solid #d6d6d6;" id="lm1" onmousemove="setTabb(1)" class="selectTab4"><a href="news.jsp?lb=���¶�̬"><strong>���¶�̬</strong><span>COMPANY NEWS</span></a></li>
        <li id="lm2" onmousemove="setTabb(2)"><a href="news.jsp?lb=���Ϣ"><strong>���Ϣ</strong><span>TECHNIQUE SUPPORT</span></a></li>
      </ul>
    </div>
    <!--����Ŀ�ʼ--> 
    <!--���ݵĿ�ʼ-->
    <div class="jnews_nr">
      <div class="newsxian" id="Setln1"> 
        <!--�����Ŀ�ʼ-->
        <div class="newsc">

          <div class="newss_list">
            <ul>
				 <%
										
    for(HashMap map:new CommDAO().select("select * from xinwentongzhi where leibie='���¶�̬' order by id desc ",1,9)){
	
     %>
			     <li><a href="gg_detail.jsp?id=<%=map.get("id")%>"><%=Info.ensubStr(map.get("biaoti"),26)%></a><span><%=map.get("addtime").toString().substring(0,10)%></span></li>
		 <%
							}
							%>
                
            </ul>
          </div>
        </div>
        <!--�����Ľ���--> 
      </div>
      <div class="newsyin" id="Setln2"> 
        <!--�����Ŀ�ʼ-->
        <div class="newsc">
		         
          <div class="newss_list">
            <ul>
			      <%
										
    for(HashMap map:new CommDAO().select("select * from xinwentongzhi where leibie='���Ϣ' order by id desc ",1,9)){
	
     %>
			     <li><a href="gg_detail.jsp?id=<%=map.get("id")%>"><%=Info.ensubStr(map.get("biaoti"),26)%></a><span><%=map.get("addtime").toString().substring(0,10)%></span></li>
		 <%
							}
							%>   
                      
            </ul>
          </div>
        </div>
        <!--�����Ľ���--> 
      </div>
    </div>
    <!--���ݵĽ���--> 
  </div>
  <script src="js/sy.js" type="text/javascript"></script>
  <!--������ŵĽ���--> 
  <!--�Ҳ���ϵ���ǵĿ�ʼ-->
  <div class="jlxwm fr">
    <div class="jlxwm1" ><strong class="bt1">��ϵ����</strong><span class="bt2">Contact Us</span><a class="gd" href="dx_detail.jsp?lb=��ϵ����" >&gt;&gt;</a></div>
    <div class="slxwmc">
      <div class="dianhua">����绰��<br>
        <span style="font-size:20px;">400-008-0378</span></div>
      <p><strong>���й���ϵͳ��վ���޹�˾</strong><br />
        �������ߣ�0371-xxxxxxx <br />
        ���棺0371-xxxxxx <br />
        �������䣺xxxxxx@126.com<br />
        ��ַ��xxxxxxxx<br />
        ���´��绰��0991-xxxxxx<br />
      
        ��ַ��xxxxxxxxxxxxxxxx��</p>
    </div>
  </div>
  <!--�Ҳ���ϵ���ǽ���-->
  <div class="clear"></div>
</div>

<!--�������ĵĽ���--> 

<%@ include file="qtdown.jsp"%>


</body>




</html>



