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
<script>
	function updateNews(){
		$.ajax({
			type:"post",
			url:"NewsServlet",
			data:"action=updateNews&"+$("#tableForm").serialize(),
			dataType:"text",
			success:function(msg){
				alert(msg);
				location.href="manage/news/news.jsp?csstype=1";
			}
		})
	}
</script>
</head>
<body>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>修改新闻</h2>
		<div class="manage">
			<s:form action="newsAction_update" method="post" theme="simple" namespace="/news">
				<table class="form">
					<tr>
						<s:hidden name="id"></s:hidden>
						<td class="field">新闻标题：</td>
						<td><s:textfield name="title"></s:textfield></td>
					</tr>
					<tr>
						<td class="field">新闻内容：</td>
						<td><s:textarea name="content"></s:textarea></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><s:submit value="修改"></s:submit></label></td>
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
