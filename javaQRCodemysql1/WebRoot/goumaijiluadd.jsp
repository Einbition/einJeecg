<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>购买记录</title>

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
<%
if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
{
	out.print("<script>alert('对不起,请您先登陆!');location.href='index.jsp';</script>");
	return;
}
  String id="";

 
  id=request.getParameter("id");
 HashMap mlbdq = new CommDAO().getmap(id,"shangpinxinxi");
 String shangpinbianhao="";
  	String shangpinmingcheng="";
  	String leibie="";
		String chengbenjia="";
  	String jiage="";
  	String shuliang="";
  	
 shangpinbianhao=(String)mlbdq.get("shangpinbianhao");
  	shangpinmingcheng=(String)mlbdq.get("shangpinmingcheng");
  	leibie=(String)mlbdq.get("leibie");
	 	chengbenjia=(String)mlbdq.get("chengbenjia");
  	jiage=(String)mlbdq.get("jiage");
  	shuliang=(String)mlbdq.get("shuliang");
  	 
 

   %>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	<script language=javascript src='js/ajax.js'></script>
	<script language="javascript">
function checkform()
{
	var goumaishuobj = document.getElementById("goumaishu"); if(goumaishuobj.value==""){document.getElementById("clabelgoumaishu").innerHTML="&nbsp;&nbsp;<font color=red>请输入购买数</font>";return false;}else{document.getElementById("clabelgoumaishu").innerHTML="  "; } 
	var goumaishuobj = document.getElementById("goumaishu"); if(goumaishuobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(goumaishuobj.value)){document.getElementById("clabelgoumaishu").innerHTML=""; }else{document.getElementById("clabelgoumaishu").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    if(parseInt(document.form1.shuliang.value)<parseInt(document.form1.goumaishu.value)){alert("对不起，数量必需大于购买数");return false;}
	
}
function gow()
{
	document.location.href="goumaijiluadd.jsp?id=<%=id%>";
}
</script>


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
         <li><a class="diyi" >购买记录</a></li>
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
    
	
  <% 
  
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){
double xx=0;xx=(Float.valueOf(request.getParameter("jiage")).floatValue()-Float.valueOf(request.getParameter("chengbenjia")).floatValue())*Float.valueOf(request.getParameter("goumaishu")).floatValue();

double jinej=0;jinej=Float.valueOf(request.getParameter("jiage")).floatValue()*Float.valueOf(request.getParameter("goumaishu")).floatValue();

ext.put("issh","否");

ext.put("jine",jinej);

String tt="update shangpinxinxi set shuliang=shuliang-"+request.getParameter("goumaishu")+" where shangpinbianhao='"+shangpinbianhao+"' ";

 new CommDAO().commOper(tt);
 
 String t="update shangpinxinxi set xiaoshouliang=xiaoshouliang+"+request.getParameter("goumaishu")+" where shangpinbianhao='"+shangpinbianhao+"' ";

 new CommDAO().commOper(t);
 
  String xt="update shangpinxinxi set lirun=lirun+"+xx+" where shangpinbianhao='"+shangpinbianhao+"' ";

 new CommDAO().commOper(xt);
 

new CommDAO().insert(request,response,"goumaijilu",ext,true,false,"index.jsp"); 

 }
%>
   <form  action="goumaijiluadd.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
       <tr><td  width="200">单号：</td><td><input name='danhao' type='text' id='danhao' value='<%=Info.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">商品编号：</td><td><input name='shangpinbianhao' type='text' id='shangpinbianhao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.shangpinbianhao.value='<%=shangpinbianhao%>';document.form1.shangpinbianhao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">商品名称：</td><td><input name='shangpinmingcheng' type='text' id='shangpinmingcheng' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.shangpinmingcheng.value='<%=shangpinmingcheng%>';document.form1.shangpinmingcheng.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">类别：</td><td><input name='leibie' type='text' id='leibie' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.leibie.value='<%=leibie%>';document.form1.leibie.setAttribute("readOnly",'true');</script>
		<tr style="display:none"><td  width="200">成本价：</td><td><input name='chengbenjia' type='text' id='chengbenjia' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.chengbenjia.value='<%=chengbenjia%>';document.form1.chengbenjia.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">价格：</td><td><input name='jiage' type='text' id='jiage' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.jiage.value='<%=jiage%>';document.form1.jiage.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">数量：</td><td><input name='shuliang' type='text' id='shuliang' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.shuliang.value='<%=shuliang%>';document.form1.shuliang.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">购买数：</td><td><input name='goumaishu' type='text' id='goumaishu' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelgoumaishu' /></td></tr>
		<tr><td  width="200">金额：</td><td> 此项不必填写，系统自动计算</td></tr>
		<tr><td  width="200">购买人：</td><td><input name='goumairen' type='text' id='goumairen' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr><td  width="200">备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		
   
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onclick="return checkform();" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
	</table>
  </form>
					
  </div>
  
  <!--详细内容的结束-->
  
</div>

<!--主体内容的结束-->





<!--底部的开始-->
<%@ include file="qtdown.jsp"%>
<!--底部的结束-->

</body>
</html>


