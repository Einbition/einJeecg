<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>资产</title>
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

new CommDAO().update(request,response,"zichan",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"zichan"); 

%>
  <form  action="zichan_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改资产:
  <br><br>

   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">

     <tr><td>编号：</td><td><input name='bianhao' type='text' id='bianhao' value='<%= mmm.get("bianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>名称：</td><td><input name='mingchen' type='text' id='mingchen' value='<%= mmm.get("mingchen")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>数量：</td><td><input name='shuliang' type='text' id='shuliang' value='<%= mmm.get("shuliang")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>总价值：</td><td><input name='zongjiazhi' type='text' id='zongjiazhi' value='<%= mmm.get("zongjiazhi")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>购入时间：</td><td><input name='gourushijian' type='text' id='gourushijian' value='<%= mmm.get("gourushijian")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>登记人：</td><td><input name='dengjiren' type='text' id='dengjiren' value='<%= mmm.get("dengjiren")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
<tr><td>说明：</td><td><textarea name='shuoming' cols='50' rows='5' id='shuoming' style='border:solid 1px #000000; color:#666666'><%=mmm.get("shuoming")%></textarea></td></tr>
<tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>