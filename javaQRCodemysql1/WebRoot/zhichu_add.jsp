<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>

    <title>支出</title>

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
 document.location.href="zhichu_add.jsp?id=<%=id%>";
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
new CommDAO().insert(request,response,"zhichu",ext,true,false,""); 
%>
  <body >
<form  action="zhichu_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加支出:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">单号：</td><td><input name='danhao' type='text' id='danhao' value='<%=Info.getID()%>' readonly="readonly" onblur='checkform()' style='border:solid 1px #000000; color:#666666' /></td></tr>

		<tr><td  width="200">名称：</td><td><input name='mingchen' type='text' id='mingchen' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelmingchen' /></td></tr>

		<tr><td  width="200">类型：</td><td><input name='leixing' type='text' id='leixing' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelleixing' /></td></tr>

		<tr><td  width="200">费用：</td><td><input name='feiyong' type='text' id='feiyong' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelfeiyong' /></td></tr>

		<tr><td width="200">日期：</td><td><input name='riqi' type='text' id='riqi' value='' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr>

		<tr><td  width="200">登记人：</td><td><input name='dengjiren' type='text' id='dengjiren' value='<%=request.getSession().getAttribute("username")%>'readonly="readonly" onblur='checkform()' style='border:solid 1px #000000; color:#666666' /></td></tr>

		<tr><td  width="200">备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>

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
 
	


var mingchenobj = document.getElementById("mingchen"); if(mingchenobj.value==""){document.getElementById("clabelmingchen").innerHTML="&nbsp;&nbsp;<font color=red>请输入名称</font>";return false;}else{document.getElementById("clabelmingchen").innerHTML="  "; } var leixingobj = document.getElementById("leixing"); if(leixingobj.value==""){document.getElementById("clabelleixing").innerHTML="&nbsp;&nbsp;<font color=red>请输入类型</font>";return false;}else{document.getElementById("clabelleixing").innerHTML="  "; } var feiyongobj = document.getElementById("feiyong"); if(feiyongobj.value==""){document.getElementById("clabelfeiyong").innerHTML="&nbsp;&nbsp;<font color=red>请输入费用</font>";return false;}else{document.getElementById("clabelfeiyong").innerHTML="  "; } 	var feiyongobj = document.getElementById("feiyong"); if(feiyongobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(feiyongobj.value)){document.getElementById("clabelfeiyong").innerHTML=""; }else{document.getElementById("clabelfeiyong").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  return true;   
}   
popheight=450;
</script>  