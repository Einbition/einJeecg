<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>购买记录</title>
	
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  id=request.getParameter("id");
 HashMap mlbdq = new CommDAO().getmap(id,"shangpinxinxi");
 String shangpinbianhao="";  	String shangpinmingcheng="";  	String leibie="";  	String jiage="";  	String shuliang="";  	
 shangpinbianhao=(String)mlbdq.get("shangpinbianhao");  	shangpinmingcheng=(String)mlbdq.get("shangpinmingcheng");  	leibie=(String)mlbdq.get("leibie");  	jiage=(String)mlbdq.get("jiage");  	shuliang=(String)mlbdq.get("shuliang");  	 
 
   %>
<script language="javascript">

function gow()
{
	document.location.href="goumaijilu_add.jsp?id=<%=id%>";
}
function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){

double jinej=0;jinej=Float.valueOf(request.getParameter("jiage")).floatValue()*Float.valueOf(request.getParameter("goumaishu")).floatValue();

ext.put("issh","否");

ext.put("jine",jinej);

new CommDAO().insert(request,response,"goumaijilu",ext,true,false,""); 

}

%>

  <body >
 <form  action="goumaijilu_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加购买记录:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">单号：</td><td><input name='danhao' type='text' id='danhao' value='<%=Info.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr><td  width="200">商品编号：</td><td><input name='shangpinbianhao' type='text' id='shangpinbianhao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.shangpinbianhao.value='<%=shangpinbianhao%>';document.form1.shangpinbianhao.setAttribute("readOnly",'true');</script>		<tr><td  width="200">商品名称：</td><td><input name='shangpinmingcheng' type='text' id='shangpinmingcheng' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.shangpinmingcheng.value='<%=shangpinmingcheng%>';document.form1.shangpinmingcheng.setAttribute("readOnly",'true');</script>		<tr><td  width="200">类别：</td><td><input name='leibie' type='text' id='leibie' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.leibie.value='<%=leibie%>';document.form1.leibie.setAttribute("readOnly",'true');</script>		<tr><td  width="200">价格：</td><td><input name='jiage' type='text' id='jiage' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.jiage.value='<%=jiage%>';document.form1.jiage.setAttribute("readOnly",'true');</script>		<tr><td  width="200">数量：</td><td><input name='shuliang' type='text' id='shuliang' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.shuliang.value='<%=shuliang%>';document.form1.shuliang.setAttribute("readOnly",'true');</script>		<tr><td  width="200">购买数：</td><td><input name='goumaishu' type='text' id='goumaishu' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelgoumaishu' /></td></tr>		<tr><td  width="200">金额：</td><td> 此项不必填写，系统自动计算</td></tr>		<tr><td  width="200">购买人：</td><td><input name='goumairen' type='text' id='goumairen' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>		<tr><td  width="200">备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>




<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var goumaishuobj = document.getElementById("goumaishu"); if(goumaishuobj.value==""){document.getElementById("clabelgoumaishu").innerHTML="&nbsp;&nbsp;<font color=red>请输入购买数</font>";return false;}else{document.getElementById("clabelgoumaishu").innerHTML="  "; } 	var goumaishuobj = document.getElementById("goumaishu"); if(goumaishuobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(goumaishuobj.value)){document.getElementById("clabelgoumaishu").innerHTML=""; }else{document.getElementById("clabelgoumaishu").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}      if(parseInt(document.form1.shuliang.value)<parseInt(document.form1.goumaishu.value)){alert("对不起，数量必需大于购买数");return false;}	


return true;   
}   
popheight=450;
</script>  


