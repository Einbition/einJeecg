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
<script language=javascript src='js/popup.js'></script>
<script language=javascript> 
function hsgpinglun(nbiao,nid){ 
popheight=450;
pop('hsgpinglun.jsp?biao='+nbiao+'&id='+nid,'��������',550,250) ;
}
</script> 
<%

	String id=request.getParameter("id");
	HashMap mqt = new CommDAO().getmap(id,"shangpinxinxi");
	
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
     ��ǰλ�ã�<a href="index.jsp">��վ��ҳ</a> &gt; ��˾����     </div> 
  </div>
  <!--����������-->
  <!--��ϸ���ݵĿ�ʼ-->
  <div class="fxmain_nr">
    
	
   <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
      <tr>
		 <td width='11%' height=44>��Ʒ��ţ�</td><td width='39%'><%=mqt.get("shangpinbianhao")%></td><td  rowspan=8 align=center><a href=<%=mqt.get("tupian")%> target=_blank><img src=<%=mqt.get("tupian")%> width=228 height=215 border=0></a></td></tr><tr>
         <td width='11%' height=44>��Ʒ���ƣ�</td><td width='39%'><%=mqt.get("shangpinmingcheng")%></td></tr><tr>
         <td width='11%' height=44>���</td><td width='39%'><%=mqt.get("leibie")%></td></tr><tr>
         <td width='11%' height=44>�۸�</td><td width='39%'><%=mqt.get("jiage")%></td></tr><tr>
         <td width='11%' height=44>������</td><td width='39%'><%=mqt.get("shuliang")%></td></tr><tr>
        
        
         <td width='11%' height=44>��������</td><td width='39%'><%=mqt.get("xiaoshouliang")%></td></tr><tr>
         
         
         <td width='11%' height=100  >��飺</td><td width='39%' colspan=2 height=100 ><%=mqt.get("jianjie")%></td></tr><tr>							 
                                <td colspan="3"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse" class="newsline">
                                  <tr>
                                    <td width="30" align="center" bgcolor="339999">���</td>
                                    <td width="471" bgcolor='#339999'>��������</td>
                                    <td style="display:none" width="88" bgcolor='#339999'>����</td>
                                    <td width="88" bgcolor='#339999'>������</td>
                                    <td width="138" align="center" bgcolor="339999">����ʱ��</td>
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
                                </tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />
<!--jixaaxnnxiu--><input type="button" name="shangpinxinxigoumai" value="����" onclick="javascript:location.href='goumaijiluadd.jsp?id=<%=id%>';">
<input type=button name=Submit53 value=���� onClick="javascript:hsgpinglun('shangpinxinxi','<%=id%>')"/>
<input type=button name=Submit52 value=�ղ� onClick="javascript:location.href='jrsc.jsp?id=<%=mqt.get("id")%>&biao=shangpinxinxi&ziduan=shangpinmingcheng';" />
</td></tr>
    
  </table>
					
  </div>
  
  <!--��ϸ���ݵĽ���-->
  
</div>

<!--�������ݵĽ���-->





<!--�ײ��Ŀ�ʼ-->
<%@ include file="qtdown.jsp"%>
<!--�ײ��Ľ���-->
<a class='bshareDiv' href='http://www.bshare.cn/share'>����ť</a><script type='text/javascript' charset='utf-8' src='http://static.bshare.cn/b/buttonLite.js#uuid=&amp;style=3&amp;fs=4&amp;textcolor=#fff&amp;bgcolor=#9C3&amp;text=����'></script>
</body>
</html>


