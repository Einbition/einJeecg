<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>支出</title>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	<LINK href="css.css" type=text/css rel=stylesheet>
  </head>

<script language="javascript">

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
  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

new CommDAO().update(request,response,"zhichu",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"zhichu"); 

%>
  <form  action="zhichu_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改支出:
  <br><br>

   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">

     <tr><td>单号：</td><td><input name='danhao' type='text' id='danhao' value='<%= mmm.get("danhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>名称：</td><td><input name='mingchen' type='text' id='mingchen' value='<%= mmm.get("mingchen")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>类型：</td><td><input name='leixing' type='text' id='leixing' value='<%= mmm.get("leixing")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>费用：</td><td><input name='feiyong' type='text' id='feiyong' value='<%= mmm.get("feiyong")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>日期：</td><td><input name='riqi' type='text' id='riqi' value='<%= mmm.get("riqi")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>登记人：</td><td><input name='dengjiren' type='text' id='dengjiren' value='<%= mmm.get("dengjiren")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
<tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'><%=mmm.get("beizhu")%></textarea></td></tr>
<tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>