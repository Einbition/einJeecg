<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>订单信息</title>
	
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  
 

 HashMap mssdq = new CommDAO().getmaps("yonghuming",(String)request.getSession().getAttribute("username"),"yonghuzhuce");
 String xingming="";
  	String dianhua="";
  	String dizhi="";
  	
 xingming=(String)mssdq.get("xingming");
  	dianhua=(String)mssdq.get("dianhua");
  	dizhi=(String)mssdq.get("dizhi");
  	
   %>
<script language="javascript">

function gow()
{
	document.location.href="dingdanxinxi_add.jsp?id=<%=id%>";
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




ext.put("iszf","否");


new CommDAO().insert(request,response,"dingdanxinxi",ext,true,false,""); 

}

%>

  <body >
 <form  action="dingdanxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加订单信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">订单号：</td><td><input name='dingdanhao' type='text' id='dingdanhao' value='<%=Info.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">订单金额：</td><td><input name='dingdanjine' type='text' id='dingdanjine' value='<%
   String sql="";
	 String shangpinbianhao="";String shangpinmingcheng="";String jine="";String goumairen="";String goumaishu="";String issh="";

	sql="select * from goumaijilu where goumairen='"+request.getSession().getAttribute("username")+"' and  issh='否'  ";
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
	  ddnr=ddnr+"名称："+shangpinmingcheng+" 数量："+goumaishu;
	  
	  
	  }
	  out.print(ze);
	  
	  String tt="update goumaijilu set issh='是' where shangpinbianhao='"+shangpinbianhao+"' ";
	   new CommDAO().commOper(tt);
	  
	 
   %>' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabeldingdanjine' /></td></tr>
		<tr><td  width="200">订单明细：</td><td><textarea name='dingdanmingxi' cols='50' rows='5' id='dingdanmingxi' onblur='' style='border:solid 1px #000000; color:#666666' ><%=ddnr%></textarea></td></tr>
		<tr><td  width="200">用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr><script language="javascript">document.form1.xingming.value='<%=xingming%>';document.form1.xingming.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">电话：</td><td><input name='dianhua' type='text' id='dianhua' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr><script language="javascript">document.form1.dianhua.value='<%=dianhua%>';document.form1.dianhua.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">地址：</td><td><input name='dizhi' type='text' id='dizhi' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr><script language="javascript">document.form1.dizhi.value='<%=dizhi%>';document.form1.dizhi.setAttribute("readOnly",'true');</script>
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
 
	var dingdanjineobj = document.getElementById("dingdanjine"); if(dingdanjineobj.value==""){document.getElementById("clabeldingdanjine").innerHTML="&nbsp;&nbsp;<font color=red>请输入订单金额</font>";return false;}else{document.getElementById("clabeldingdanjine").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  


