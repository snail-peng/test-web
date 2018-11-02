<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function-manage.js"></script>
<script type="text/javascript" src="scripts/jquery-1.12.4.js"></script>
</head>

<body>
<script>
	function showUsers(){	
		$.ajax({
			type:"post",
			url:"AdminServlet",
			data:"action=getLoginUsers",
			dataType:"json",
			success:function(msg){
				var $listTable = $("#listTable");
				$listTable.empty();
				$listTable.append("<tr><th>ID</th><th>姓名</th><th>操作</th></tr>");
				for(var i=0;i<msg.length-2;i++){
					if(msg[i].name == "${user.userName}"){
						$listTable.append("<tr><td class='w1 c'>"+msg[i].id+"</td>"
							+"<td class='w1 c'>"+msg[i].name+"</td>"
							+"<td class='w1 c'>当前管理员</td></tr>");
					}else{
						$listTable.append("<tr><td class='w1 c'>"+msg[i].id+"</td>"
							+"<td class='w1 c'>"+msg[i].name+"</td>"
							+"<td class='w1 c'><a style='cursor:pointer' onclick='logout(&quot;"+msg[i].sessionId+"&quot;);'>踢出</a></td></tr>");
					}
				}
				$("#userStatus").html("会员："+msg[msg.length-2].loginCount+"人；游客："+msg[msg.length-1].visitor+"人");
			},error:function(){
				alert("1");
			}
		})
	}
	function logout(id){
		if(confirm("踢出该用户？")){
			$.ajax({
				type:"post",
				url:"AdminServlet",
				data:"action=logout&id="+id,
				dataType:"text",
				success:function(msg){
					alert(msg);
					if(msg=="操作成功"){
						showUsers();
					}
				},error:function(){
					alert("1");
				}
			})
		}
	}
	$(function(){
		showUsers();
	})
	setInterval(showUsers,5000);
</script>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>管理用户&emsp;<span id="userStatus"></span></h2>
		<div class="manage">
			<table class="list" id="listTable">
				
			</table>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/manage/common/foot.jsp" %>
</body>
</html>