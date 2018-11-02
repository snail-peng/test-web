<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
</head>
<body>
<script>
	function reply(){
	/* 	$.ajax({
			type:"post",
			url:"CommentServlet",
			data:"action=reply&"+$("#tableForm").serialize()+"&commentId="+${replyComment.id},
			dataType:"text",
			success:function(msg){
				alert(msg);
				location.href="manage/guestbook/guestbook.jsp?csstype=2";
			}
		}) */
	}
	/* function back(){
		location.href="manage/guestbook/guestbook.jsp?csstype=2";
	} */
</script>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>回复留言</h2>
		<div class="manage">
			<s:form action="/comment/commentAction_update.action" method="post" theme="simple">
				<table class="form">
					<tr>
						<td class="field">留言ID：</td>
						<td><s:textfield name="id"></s:textfield></td>
					</tr>
					<tr>
						<td class="field">留言姓名：</td>
						<td><s:textfield name="userName"></s:textfield></td>
					</tr>
					<tr>
						<td class="field">留言内容：</td>
						<td><s:textfield name="content"></s:textfield></td>
					</tr>
					<tr>
						<td class="field">回复内容：</td>
						<td><s:textarea name="reply"></s:textarea></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><s:submit value="确定"></s:submit></label></td>
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

