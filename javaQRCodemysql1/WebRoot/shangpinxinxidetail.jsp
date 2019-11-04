<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>商品信息</title>

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
<script language=javascript src='js/popup.js'></script>
<script language=javascript> 
function hsgpinglun(nbiao,nid){ 
popheight=450;
pop('hsgpinglun.jsp?biao='+nbiao+'&id='+nid,'在线评论',550,250) ;
}
</script> 
<%

	String id=request.getParameter("id");
	HashMap mqt = new CommDAO().getmap(id,"shangpinxinxi");
	
     %>
<body>

<!--新头部的开始-->
<%@ include file="qttop.jsp"%>

<!--新头部的结束--> <!--产品中心ban开始-->
<div class="newsban"></div>

<!--产品中心ban结束-->

<!--主体内容的开始-->
<div class="fxmain">
  <!--顶部类别开始-->
  <div class="fx_fenlei">
     <div class="leibei fl">
       <ul>
         <li><a class="diyi" >商品信息</a></li>
         <!--<li><a href="#">行业动态</a></li>
         <li><a href="#">保养常识</a></li>
         <li><a href="#">技术支持</a></li>-->
       </ul>
     </div>
     <div class="dqwz fr">
     当前位置：<a href="index.jsp">网站首页</a> &gt; 公司新闻     </div> 
  </div>
  <!--顶部类别结束-->
  <!--详细内容的开始-->
  <div class="fxmain_nr">
    
	
   <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
      <tr>
		 <td width='11%' height=44>商品编号：</td><td width='39%'><%=mqt.get("shangpinbianhao")%></td><td  rowspan=8 align=center><a href=<%=mqt.get("tupian")%> target=_blank><img src=<%=mqt.get("tupian")%> width=228 height=215 border=0></a></td></tr><tr>
         <td width='11%' height=44>商品名称：</td><td width='39%'><%=mqt.get("shangpinmingcheng")%></td></tr><tr>
         <td width='11%' height=44>类别：</td><td width='39%'><%=mqt.get("leibie")%></td></tr><tr>
         <td width='11%' height=44>价格：</td><td width='39%'><%=mqt.get("jiage")%></td></tr><tr>
         <td width='11%' height=44>数量：</td><td width='39%'><%=mqt.get("shuliang")%></td></tr><tr>
        
        
         <td width='11%' height=44>销售量：</td><td width='39%'><%=mqt.get("xiaoshouliang")%></td></tr><tr>
         
         
         <td width='11%' height=100  >简介：</td><td width='39%' colspan=2 height=100 ><%=mqt.get("jianjie")%></td></tr><tr>							 
                                <td colspan="3"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse" class="newsline">
                                  <tr>
                                    <td width="30" align="center" bgcolor="339999">序号</td>
                                    <td width="471" bgcolor='#339999'>评价内容</td>
                                    <td style="display:none" width="88" bgcolor='#339999'>评分</td>
                                    <td width="88" bgcolor='#339999'>评论人</td>
                                    <td width="138" align="center" bgcolor="339999">评论时间</td>
                                  </tr>
                                   <% 
							String sql =  "select * from pinglun where xinwenID='"+id+"' and biao='shangpinxinxi' ";
							sql+=" order by id desc";
							int i=0;
							 for(HashMap map:new CommDAO().select(sql)){
							 i++;
							 %>
                                  <tr>
                                    <td width="30" align="center" bgcolor='#CCFF99'><%=i%></td>
                                    <td width="471" bgcolor='#CCFF99'><%=map.get("pinglunneirong")%></td>
                                    <td style="display:none" width="88" bgcolor='#CCFF99'><%=map.get("pingfen")%></td>
                                    <td width="88" bgcolor='#CCFF99'><%=map.get("pinglunren")%></td>
                                    <td width="138" align="center" bgcolor="CCFF99"><%=map.get("addtime")%></td>
                                  </tr>
                                  <%
								  }
								   %>
                                </table></td>
                                </tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />
<!--jixaaxnnxiu--><input type="button" name="shangpinxinxigoumai" value="购买" onclick="javascript:location.href='goumaijiluadd.jsp?id=<%=id%>';">
<input type=button name=Submit53 value=评论 onClick="javascript:hsgpinglun('shangpinxinxi','<%=id%>')"/>
<input type=button name=Submit52 value=收藏 onClick="javascript:location.href='jrsc.jsp?id=<%=mqt.get("id")%>&biao=shangpinxinxi&ziduan=shangpinmingcheng';" />
</td></tr>
    
  </table>
					
  </div>
  
  <!--详细内容的结束-->
  
</div>

<!--主体内容的结束-->





<!--底部的开始-->
<%@ include file="qtdown.jsp"%>
<!--底部的结束-->
<a class='bshareDiv' href='http://www.bshare.cn/share'>分享按钮</a><script type='text/javascript' charset='utf-8' src='http://static.bshare.cn/b/buttonLite.js#uuid=&amp;style=3&amp;fs=4&amp;textcolor=#fff&amp;bgcolor=#9C3&amp;text=分享到'></script>
</body>
</html>


