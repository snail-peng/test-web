<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

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


</head>
<body>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>添加新闻</h2>
		<div class="manage">
		<form action="/news/save" method="post"  enctype="multipart/form-data">
				<table class="form">
					<tr>
						
						<td class="field">新闻标题：</td>
						<td><input name="title"/></td>
					</tr>
					<tr>
						<td class="field">新闻内容：</td>
						<td><textarea name="content"></textarea></td>
					</tr>
					
					<tr>
						<td class="field">新闻日期：</td>
						<td><input name="createTime"/></td>
					</tr>
					
					<tr>
						<td class="field">图片：</td>
						<td><input type="file" name="image"/></td>
					</tr>
					
					<tr>
						
						<td class="field">姓名：</td>
						<td><input name="list[0].name"/></td>
					</tr>
					<tr>
						<td class="field">年龄：</td>
						<td><input name="list[0].age"/></textarea></td>
					</tr>
					
					
					<tr>
						
						<td class="field">姓名：</td>
						<td><input name="list[1].name"/></td>
					</tr>
					<tr>
						<td class="field">年龄：</td>
						<td><input name="list[1].age"/></textarea></td>
					</tr>
					
					<tr>
						<td></td>
						<td><label class="ui-blue">
						<input type="submit"  value="保存"/>
						</label></td>
					</tr>
				</table>
		</s:form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/manage/common/foot.jsp" %>
</body>
</html>

