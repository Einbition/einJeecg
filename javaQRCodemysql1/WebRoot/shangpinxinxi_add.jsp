<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>��Ʒ��Ϣ</title>
	
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
	document.location.href="shangpinxinxi_add.jsp?id=<%=id%>";
}
function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"��", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"��";
	}
}
</script>

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){







new CommDAO().insert(request,response,"shangpinxinxi",ext,true,false,""); 

}

%>

  <body >
 <form  action="shangpinxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  �����Ʒ��Ϣ:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">��Ʒ��ţ�</td><td><input name='shangpinbianhao' type='text' id='shangpinbianhao' value='<%=Info.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">��Ʒ���ƣ�</td><td><input name='shangpinmingcheng' type='text' id='shangpinmingcheng' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelshangpinmingcheng' /></td></tr>
		<tr><td>���</td><td><%=Info.getselect("leibie","leibiexinxi","leibie")%></td></tr>
		<tr><td  width="200">�ɱ��ۣ�</td><td><input name='chengbenjia' type='text' id='chengbenjia' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelchengbenjia' /></td></tr>
		<tr><td  width="200">�۸�</td><td><input name='jiage' type='text' id='jiage' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabeljiage' /></td></tr>
		<tr><td  width="200">������</td><td><input name='shuliang' type='text' id='shuliang' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		
		
		<tr><td  width="200">��������</td><td><input name='xiaoshouliang' type='text' id='xiaoshouliang' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr style="display:none"><td  width="200">����</td><td><input name='lirun' type='text' id='lirun' value='0' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">ͼƬ��</td><td><input name='tupian' type='text' id='tupian' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='�ϴ�' onClick="up('tupian')" style='border:solid 1px #000000; color:#666666'/></td></tr>
		<tr><td  width="200">��飺</td><td><textarea name='jianjie' cols='50' rows='5' id='jianjie' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
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
 
	var shangpinmingchengobj = document.getElementById("shangpinmingcheng"); if(shangpinmingchengobj.value==""){document.getElementById("clabelshangpinmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>��������Ʒ����</font>";return false;}else{document.getElementById("clabelshangpinmingcheng").innerHTML="  "; } 
	var jiageobj = document.getElementById("jiage"); if(jiageobj.value==""){document.getElementById("clabeljiage").innerHTML="&nbsp;&nbsp;<font color=red>������۸�</font>";return false;}else{document.getElementById("clabeljiage").innerHTML="  "; } 
	var jiageobj = document.getElementById("jiage"); if(jiageobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(jiageobj.value)){document.getElementById("clabeljiage").innerHTML=""; }else{document.getElementById("clabeljiage").innerHTML="&nbsp;&nbsp;<font color=red>����������</font>"; return false;}}  
	
	var jiageobj = document.getElementById("jiage"); if(jiageobj.value==""){document.getElementById("clabeljiage").innerHTML="&nbsp;&nbsp;<font color=red>������۸�</font>";return false;}else{document.getElementById("clabeljiage").innerHTML="  "; } 
	var jiageobj = document.getElementById("jiage"); if(jiageobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(jiageobj.value)){document.getElementById("clabeljiage").innerHTML=""; }else{document.getElementById("clabeljiage").innerHTML="&nbsp;&nbsp;<font color=red>����������</font>"; return false;}}  
	
    
 if(parseInt(document.form1.jiage.value)<parseInt(document.form1.chengbenjia.value)){alert("�Բ��𣬼۸������ڳɱ���");return false;}

return true;   
}   
popheight=450;
</script>  


