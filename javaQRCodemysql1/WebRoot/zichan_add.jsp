<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>

    <title>资产</title>

	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
  </head>
<%
String id="";


%>


<script language="javascript">

function gow()
{
 document.location.href="zichan_add.jsp?id=<%=id%>";
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


}
new CommDAO().insert(request,response,"zichan",ext,true,false,""); 
%>
  <body >
<form  action="zichan_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加资产:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">编号：</td><td><input name='bianhao' type='text' id='bianhao' value='<%=Info.getID()%>' readonly="readonly" onblur='checkform()' style='border:solid 1px #000000; color:#666666' /></td></tr>

		<tr><td  width="200">名称：</td><td><input name='mingchen' type='text' id='mingchen' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelmingchen' /></td></tr>

		<tr><td  width="200">数量：</td><td><input name='shuliang' type='text' id='shuliang' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelshuliang' /></td></tr>

		<tr><td  width="200">总价值：</td><td><input name='zongjiazhi' type='text' id='zongjiazhi' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelzongjiazhi' /></td></tr>

		<tr><td width="200">购入时间：</td><td><input name='gourushijian' type='text' id='gourushijian' value='' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr>

		<tr><td  width="200">登记人：</td><td><input name='dengjiren' type='text' id='dengjiren' value='<%=request.getSession().getAttribute("username")%>'readonly="readonly" onblur='checkform()' style='border:solid 1px #000000; color:#666666' /></td></tr>

		<tr><td  width="200">说明：</td><td><textarea name='shuoming' cols='50' rows='5' id='shuoming' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>

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
 
	


var mingchenobj = document.getElementById("mingchen"); if(mingchenobj.value==""){document.getElementById("clabelmingchen").innerHTML="&nbsp;&nbsp;<font color=red>请输入名称</font>";return false;}else{document.getElementById("clabelmingchen").innerHTML="  "; } var shuliangobj = document.getElementById("shuliang"); if(shuliangobj.value==""){document.getElementById("clabelshuliang").innerHTML="&nbsp;&nbsp;<font color=red>请输入数量</font>";return false;}else{document.getElementById("clabelshuliang").innerHTML="  "; } 	var shuliangobj = document.getElementById("shuliang"); if(shuliangobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(shuliangobj.value)){document.getElementById("clabelshuliang").innerHTML=""; }else{document.getElementById("clabelshuliang").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  var zongjiazhiobj = document.getElementById("zongjiazhi"); if(zongjiazhiobj.value==""){document.getElementById("clabelzongjiazhi").innerHTML="&nbsp;&nbsp;<font color=red>请输入总价值</font>";return false;}else{document.getElementById("clabelzongjiazhi").innerHTML="  "; } 	var zongjiazhiobj = document.getElementById("zongjiazhi"); if(zongjiazhiobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(zongjiazhiobj.value)){document.getElementById("clabelzongjiazhi").innerHTML=""; }else{document.getElementById("clabelzongjiazhi").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  return true;   
}   
popheight=450;
</script>  