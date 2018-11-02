<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />


</head>
<body>
	<%@ include file="/manage/common/head.jsp"%>
	<div id="main" class="wrap">
		<%@ include file="/manage/common/left.jsp"%>
		<div class="main">
			<h2>
				新闻管理 <font color="red"> ${aa } <c:remove
						var="flag" scope="session" /> </font>
			</h2>
			<div class="manage">
			       <c:forEach items="list" var="news">
					<tr>
						<td class="first w4 c"><input type="checkbox" />${newsid.count+(requestScope.page.pageNo-1)*requestScope.page.pageSize}</td>
						<td>${news.title }</td>
						<td class="w1 c"><a
							href="${ctx}/news/edit/2">编辑</a> <a
							href="${ctx}/news/delete/2/3" id="delete" >删除 rest</a></td>
					</tr>
					</c:forEach>
				
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<%@ include file="/manage/common/foot.jsp"%>
</body>
</html>

