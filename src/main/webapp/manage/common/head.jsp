<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function-manage.js"></script>
<script type="text/javascript" src="scripts/jquery-1.12.4.js"></script>

</head>
<body>
	<script>
		function exit(){
			if(confirm("确定要退出吗？")){
				$.ajax({
					type:"post",
					url:"/login/loginAction_logout.action",
					success:function(){
						location.href = "/login/loginAction.action";
					}
				})
			}	
		}
	</script>
    <div id="header" class="wrap">
	<div id="logo"><img src="images/logo.gif" /></div>
	<div class="help"><a href="index/index.jsp">返回前台页面</a></div>
	<div class="help"><a href="manage/admin/admin.jsp">登录用户管理</a></div>
	<div class="help"><a style="cursor:pointer" onclick="exit()" >退出登录</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li ${param.csstype == 0 ? "class=current" : ""}><a href="/login/loginAction_loginManage.action">首页</a></li>
			<li ${param.csstype == 5 ? "class=current" : ""}><a href="/user/userAction_toList.action">用户</a></li>
			<li ${param.csstype == 4 ? "class=current" : ""}><a href="/product/productAction_toList.action">商品</a></li>
			<li ${param.csstype == 3 ? "class=current" : ""}><a href="/order/orderAction_toList.action">订单</a></li>
			<li ${param.csstype == 2 ? "class=current" : ""}><a href="/comment/commentAction_toList.action">留言</a></li>
			<li ${param.csstype == 1 ? "class=current" : ""}><a href="/news/newsAction_toList.action">新闻</a></li>
			<c:if test="${user.status==0 }">
				<li ${param.csstype == 6 ? "class=current" : ""}><a href="/loginLog/loginLogAction_toList.action">登录日志</a></li>
			</c:if>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="welcome wrap">
		<c:choose>
			<c:when test="${user.status==0 }">管理员</c:when>
			<c:when test="${user.status==1 }">审核员</c:when>
			<c:when test="${user.status==2 }">配货员</c:when>
			<c:otherwise>送货员</c:otherwise>
		</c:choose>
		${user.userName }您好，今天是${date }，欢迎回到管理后台。
	</div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="index/index.jsp">易买网</a> &gt; 管理后台
</div>
  </body>
</html>
