<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
	function back(){
		location.href="manage/order/order.jsp?csstype=3";
	}
</script>
</head>
<body>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>订单详情</h2>
		<div class="manage">
			<s:form action="orderAction_toList" method="post" namespace="/order" theme="simple">
				<table class="form">
					<tr>
						<td class="field">订单号：</td>
						<td><s:textfield class="text"  readonly="true" name="serialNumber"></s:textfield></td>
					</tr>
					<tr>
						<td class="field">订购人姓名：</td>
						<td><s:textfield class="text"  readonly="true" name="user.userName"></s:textfield></td>
					</tr>
					<tr>
						<td class="field">送货地址：</td>
						<td><s:textfield class="text"  readonly="true" name="user.userAddress"></s:textfield></td>
					</tr>
					<tr>
						<td class="field">状态：</td>
						<td>
							<s:if test="status==0">已下单</s:if>
							<s:elseif test="status==1">已审核</s:elseif>
							<s:elseif test="status==2">已配货</s:elseif>
							<s:elseif test="status==3">已发货</s:elseif>
							<s:else>已收货</s:else>
						</td>
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

