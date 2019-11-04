<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<div class="iban">
  <div class="gg" id="gg">
    <div class="ggLoading">
      <div class="ggLoading2"><em>精彩内容载入中</em></div>
    </div>
    <div class="ggs">
      <div class="ggBox" id="ggBox"> 
	  <%
				int bhti=0;		
					
    for(HashMap map:new CommDAO().select("select * from xinwentongzhi where leibie='变幻图'  order by id desc ")){
	bhti++;
     %>
	        <a 
			<%
			if(bhti==1)
			{
			%>
			style="z-index:3;opacity:4;"
			<%
			}
			%>
			><img src="<%=map.get("shouyetupian")%>" alt="" /></a> 
			<%
	  }
	  %>
	       
	             </div>
    </div>
    <div class="ggb">
      <div class="ggBtns" id="ggBtns"> <a href='javascript:void(0)' class="current"><em>1</em></a> <a href='javascript:void(0)'><em>2</em></a> <a href='javascript:void(0)'><em>3</em></a><a href='javascript:void(0)'><em>4</em></a><a href='javascript:void(0)'><em>5</em></a> </div>
    </div>
  </div>
</div>

<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
			
    var $con = $('#gg'), $box = $con.find('#ggBox'), $btns = $con.find('#ggBtns'), i = 0, autoChange = function () {
        i += 1;
        if (i === 5) { i = 0; }
        $btns.find('a:eq(' + i + ')').addClass('current').siblings().removeClass('current');
        var curr = $box.find('a:eq(' + i + ')'), prev = curr.siblings();
        prev.css('z-index', 2);
        curr.css('z-index', 3).animate({
            'opacity': 1
        }, 150, function () {
            prev.css({
                'z-index': 1, 'opacity': 0.1
            });
        });
    }, loop = setInterval(autoChange, 5000);
	
    $con.hover(function () {
        clearInterval(loop);
    }, function () {
        loop = setInterval(autoChange, 5000);
    });
	
    $btns.find('a').click(function () {
        i = $(this).index() - 1;
        autoChange();
    });
	
});
</script>