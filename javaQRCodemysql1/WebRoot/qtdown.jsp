
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<!--友情链接的开始-->
<div class="jdbj">
  <div class="syqlj">
    <div class="scp1" style="width:1000px;"><strong class="bt1">友情链接</strong><span class="bt2">LINKS</span></div>
    <div class="yqljs"> 
	 <%
    for(HashMap map:new CommDAO().select("select * from youqinglianjie order by id desc",1,8)){
     %>
		<a target="_blank" href="<%=map.get("wangzhi") %>"><%=map.get("wangzhanmingcheng") %></a>
		 <%
								  }
								  %>

	  	
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<!--友情链接的结束--> 

<!--底部的开始-->
<div class="footWrap">
  <div class="footer_nav">
    <div class="fnavc"> <a href="#">网站首页</a> <a href="#" target="_blank">公司介绍</a> <a href="#" target="_blank">产品中心</a> <a href="#" target="_blank">新闻中心</a> <a href="#" target="_blank">公司资质</a> <a  href="#" target="_blank">联系我们</a> </div>
  </div>
  <div class="hbfooter">
    <div class="hbbottom">
      <div class="hbtmleft">
        <p>版权所有  中国超市管理系统有限公司   豫ICP备xxxxxx号-1<br />
          销售热线：0371-xxxx / xxxxx   24小时售后服务热线：400-xxxx-xxxx   传真：xxx-xx <br />
          公司地址：中国xxxxxx    技术支持：<a href="http://www.xxxxxxx.com" target="_blank">超市管理系统</a> </p>
      </div>
      <div class="hbtmright"> <img src="qtimages/jianguan.png" width="88" height="88" /> <br />
        工商网监 </div>
      <div class="clear"></div>
    </div>
  </div>
  <div class="clear"></div>
</div>
