<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>������Ϣ</title>
	<!--bixanjxiqxi-->
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
//xuxyaxodenxglxu
  String id="";
 //islbd1q id=request.getParameter("id");
 //islbd1q HashMap mlbdq = new CommDAO().getmap(id,"melieibaoduqubiaoiguo");
 //islbd2q HashMap mlbdq = new CommDAO().getmaps("hsgzhujian",(String)request.getSession().getAttribute("username"),"melieibaoduqubiaoiguo");
 //islbdq gogogogogo
 //islbdq lelelelelele

   %>
<script language="javascript">

function gow()
{
	document.location.href="dingdanxinxi_add.jsp?id=<%=id%>";
}
</script>
<!--hxsglxiangdxongjxs-->
 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){
//wxfladd
//qiuji
ext.put("issh","��");
ext.put("iszf","��");
 
 

}
new CommDAO().insert(request,response,"dingdanxinxi",ext,true,false,""); 
%>

  <body >
 <form  action="dingdanxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  ��Ӷ�����Ϣ:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">�����ţ�</td><td><input name='dingdanhao' type='text' id='dingdanhao' value='<%=Info.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">������</td><td><input name='dingdanjine' type='text' id='dingdanjine' value='<%
   String sql="";
	 String shangpinbianhao="";String shangpinmingcheng="";String jine="";String goumairen="";String goumaishu="";String issh="";

	sql="select * from goumaijilu where goumairen='"+request.getSession().getAttribute("username")+"' and  issh='��'  ";
	// RS_result=connDbBean.executeQuery(sql);
	  double ze=0;
	 String ddnr="";
	  for(HashMap map:new CommDAO().select(sql))
	  {
	
	 
	  shangpinbianhao=(String)map.get("shangpinbianhao");
	  shangpinmingcheng=(String)map.get("shangpinmingcheng");
	  jine=(String)map.get("jine");
	 // faburen=RS_result.getString("faburen");
	  goumaishu=(String)map.get("goumaishu");
	  goumairen=(String)map.get("goumairen");
	  issh=(String)map.get("issh");

	  ze=ze+Float.valueOf(jine).floatValue();
	  ddnr=ddnr+"���ƣ�"+shangpinmingcheng+" ������"+goumaishu;
	  
	  
	  }
	  out.print(ze);
	  
	  String tt="update goumaijilu set issh='��' where shangpinbianhao='"+shangpinbianhao+"' ";
	   new CommDAO().commOper(tt);
	  
	 
   %>
		' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabeldingdanjine' /></td></tr>
		<tr><td  width="200">�������ݣ�</td><td><textarea name='dingdanneirong' cols='50' rows='5' id='dingdanneirong' onblur='' style='border:solid 1px #000000; color:#666666' ><%=ddnr%></textarea></td></tr>
		<tr><td  width="200">�û�����</td><td><input name='yonghuming' type='text' id='yonghuming' onblur='checkform()' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" />&nbsp;*<label id='clabelyonghuming' /></td></tr>
		<tr><td  width="200">������</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">�绰��</td><td><input name='dianhua' type='text' id='dianhua' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">��ַ��</td><td><input name='dizhi' type='text' id='dizhi' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>

<!--suxilxatxihuxan-->


<script language=javascript src='js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var dingdanjineobj = document.getElementById("dingdanjine"); if(dingdanjineobj.value==""){document.getElementById("clabeldingdanjine").innerHTML="&nbsp;&nbsp;<font color=red>�����붩�����</font>";return false;}else{document.getElementById("clabeldingdanjine").innerHTML="  "; } 
	var yonghumingobj = document.getElementById("yonghuming"); if(yonghumingobj.value==""){document.getElementById("clabelyonghuming").innerHTML="&nbsp;&nbsp;<font color=red>�������û���</font>";return false;}else{document.getElementById("clabelyonghuming").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  


