<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>��Ʒ��Ϣ</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">

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

  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

new CommDAO().update(request,response,"shangpinxinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"shangpinxinxi"); 

%>
  <form  action="shangpinxinxi_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  �޸���Ʒ��Ϣ:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>��Ʒ��ţ�</td><td><input name='shangpinbianhao' type='text' id='shangpinbianhao' value='<%= mmm.get("shangpinbianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>��Ʒ���ƣ�</td><td><input name='shangpinmingcheng' type='text' id='shangpinmingcheng' value='<%= mmm.get("shangpinmingcheng")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>���</td><td><%=Info.getselect("leibie","leibiexinxi","leibie")%></td></tr><script language="javascript">document.form1.leibie.value='<%=mmm.get("leibie")%>';</script>
	   <tr><td>�ɱ��ۣ�</td><td><input name='chengbenjia' type='text' id='chengbenjia' value='<%= mmm.get("chengbenjia")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�۸�</td><td><input name='jiage' type='text' id='jiage' value='<%= mmm.get("jiage")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>������</td><td><input name='shuliang' type='text' id='shuliang' value='<%= mmm.get("shuliang")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    
    
     <tr><td>��������</td><td><input name='xiaoshouliang' type='text' id='xiaoshouliang' value='<%= mmm.get("xiaoshouliang")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
	   <tr><td>����</td><td><input name='lirun' type='text' id='lirun' value='<%= mmm.get("lirun")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>ͼƬ��</td><td><input name='tupian' type='text' id='tupian' size='50' value='<%= mmm.get("tupian")%>' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='�ϴ�' onClick="up('tupian')" style='border:solid 1px #000000; color:#666666'/></td></tr>
     <tr><td>��飺</td><td><textarea name='jianjie' cols='50' rows='5' id='jianjie' style='border:solid 1px #000000; color:#666666'><%=mmm.get("jianjie")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


