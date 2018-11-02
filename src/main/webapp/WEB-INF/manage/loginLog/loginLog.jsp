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

<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>登录日志</h2>
		<div class="manage">
			<table class="list" id="listTable">
				<tr><th>序号</th><th>登录名</th><th>登录时间</th><th>IP地址</th><th>是否成功</th></tr>
				<s:iterator value="page.list" status="i">
					<tr>
						<td class='first w1 c'><s:property value="#i.index+1+6*(page.currPageNo-1)"/> </td>
						<td class='w4 c'><s:property value="loginName"/></td>
						<td class='w4 c'><s:date name="loginTime" /> </td>
						<td class='w4 c'><s:property value="loginIP"/></td>
						<td class='w1 c'>
							<s:if test="success==0">失败</s:if>
							<s:else>成功</s:else>
						</td>
					</tr>
				</s:iterator>
			</table>
		</div>
		<div class="pager">
			<ul class="clearfix" id="pager">
			<s:if test="page.currPageNo>1">
					<li><s:a href="/loginLog/loginLogAction_toList.action?pageNo=%{page.currPageNo-1}">上一页</s:a></li>
				</s:if>
				<s:iterator begin="1" end="page.totalPageCount" status="i">
					<li><s:a href="/loginLog/loginLogAction_toList.action?pageNo=%{#i.index+1}"><s:property value="#i.index+1"/></s:a></li>
				</s:iterator>
				<s:if test="page.currPageNo<page.totalPageCount">
					<li><s:a href="/loginLog/loginLogAction_toList.action?pageNo=%{page.currPageNo+1}">下一页</s:a></li>
				</s:if>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/manage/common/foot.jsp" %>
</body>
</html>

