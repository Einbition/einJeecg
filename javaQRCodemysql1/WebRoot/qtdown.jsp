
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<!--�������ӵĿ�ʼ-->
<div class="jdbj">
  <div class="syqlj">
    <div class="scp1" style="width:1000px;"><strong class="bt1">��������</strong><span class="bt2">LINKS</span></div>
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
<!--�������ӵĽ���--> 

<!--�ײ��Ŀ�ʼ-->
<div class="footWrap">
  <div class="footer_nav">
    <div class="fnavc"> <a href="#">��վ��ҳ</a> <a href="#" target="_blank">��˾����</a> <a href="#" target="_blank">��Ʒ����</a> <a href="#" target="_blank">��������</a> <a href="#" target="_blank">��˾����</a> <a  href="#" target="_blank">��ϵ����</a> </div>
  </div>
  <div class="hbfooter">
    <div class="hbbottom">
      <div class="hbtmleft">
        <p>��Ȩ����  �й����й���ϵͳ���޹�˾   ԥICP��xxxxxx��-1<br />
          �������ߣ�0371-xxxx / xxxxx   24Сʱ�ۺ�������ߣ�400-xxxx-xxxx   ���棺xxx-xx <br />
          ��˾��ַ���й�xxxxxx    ����֧�֣�<a href="http://www.xxxxxxx.com" target="_blank">���й���ϵͳ</a> </p>
      </div>
      <div class="hbtmright"> <img src="qtimages/jianguan.png" width="88" height="88" /> <br />
        �������� </div>
      <div class="clear"></div>
    </div>
  </div>
  <div class="clear"></div>
</div>
