<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>������ϸ</title>
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
  String id=request.getParameter("id");
   new CommDAO().commOper("update xinwentongzhi set dianjilv=dianjilv+1 where id="+id);
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
         <li><a class="diyi" >�û���½</a></li>
         <!--<li><a href="#">��ҵ��̬</a></li>
         <li><a href="#">������ʶ</a></li>
         <li><a href="#">����֧��</a></li>-->
       </ul>
     </div>
     <div class="dqwz fr">
     ��ǰλ�ã�<a href="index.jsp">��վ��ҳ</a> &gt; �û���½     </div> 
  </div>
  <!--����������-->
  <!--��ϸ���ݵĿ�ʼ-->
  <div class="fxmain_nr">
    <table width="100%" height="500" border="0" cellpadding="0" cellspacing="0" background="qtimages/qtlogin.jpg">
      <tr>
        <td><%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
     %>
          <form action="javacsglxt?ac=login&amp;a=a" method="post" name="f11" id="f11" style="display: inline">
            <table width="100%" height="52%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="93" height="50">&nbsp;</td>
                <td width="99" height="28">�û���:</td>
                <td height="28" colspan="2"><input name="username" type="text" id="username"  placeholder="�������û���" style="width:160px; height:40px; border:solid 1px #000000; color:#666666;" /></td>
              </tr>
              <tr>
                <td height="50">&nbsp;</td>
                <td height="28">����:</td>
                <td height="28" colspan="2"><input name="pwd1" type="password" id="pwd1"  placeholder="����������" style="width:160px; height:40px; border:solid 1px #000000; color:#666666" /></td>
              </tr>
              <tr>
                <td height="50">&nbsp;</td>
                <td height="28">Ȩ��:</td>
                <td height="28" colspan="2"><select name="cx" id="cx" style="width:160px; height:40px; border:solid 1px #000000; color:#666666"  >
                    <option value="ע���û�">ע���û�</option>
                </select></td>
              </tr>
              <tr >
                <td height="50">&nbsp;</td>
                <td height="28">��֤��</td>
                <td width="80" height="28"><input name="pagerandom" type="text" id="pagerandom" style=" height:20px; border:solid 1px #000000; color:#666666; width:50px" /></td>
                <td width="868"><a href="javascript:loadimage();"><img alt="����������ң�" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle" /></a></td>
              </tr>
              <script type="text/javascript">
          
           function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 
function checklog()
{
	if(document.f11.username.value=="" || document.f11.pwd1.value=="" || document.f11.pagerandom.value=="")
	{
		alert("����������");
		return false;
	}
}
           
                                  </script>
              <tr>
                <td height="50" align="center">&nbsp;</td>
                <td height="38" colspan="3" align="left"><input type="submit" name="Submit" value="��½" class="hsgbutton" onclick="return checklog();" />
                    <input type="reset" name="Submit2" value="����" class="hsgbutton" /></td>
              </tr>
            </table>
          </form>
          <%}else{ %>
          <table width="90%" height="82%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="31%" height="30">�û���</td>
              <td width="69%" height="30"><%=request.getSession().getAttribute("username")%> </td>
            </tr>
            <tr>
              <td height="30">Ȩ��</td>
              <td height="30"><%=request.getSession().getAttribute("cx")%> </td>
            </tr>
            <tr>
              <td height="30" colspan="2" align="center"><input type="button" name="Submit3" value="�˳�" onclick="javascript:location.href='logout.jsp';" />
                  <input type="button" name="Submit32" value="���˺�̨" onclick="javascript:location.href='main.jsp';" />
              </td>
            </tr>
          </table>
        <%} %></td>
      </tr>
    </table>
  </div>
  
  <!--��ϸ���ݵĽ���-->
  
</div>

<!--�������ݵĽ���-->





<!--�ײ��Ŀ�ʼ-->
<%@ include file="qtdown.jsp"%>
<!--�ײ��Ľ���-->

</body>
</html>
