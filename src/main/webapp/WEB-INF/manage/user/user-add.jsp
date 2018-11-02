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
<script type="text/javascript" src="scripts/My97DatePicker/WdatePicker.js"></script>
<script>
	function checkLoginName(obj){
		if(obj==""){
			var $info = $("#txtUserName").next();
			$info.html("请输入用户名！");
			$info.css("color","red");
		}else{
			$.ajax({
				type:"post",
				url:"UserServlet",
				data:"action=checkLoginName&userName="+obj,
				datatype:"text",
				success:function(msg){
					var $info = $("#txtUserName").next();
					if(msg=="false"){
						$info.html("用户名已存在！");
						$info.css("color","red");
					}else{
						$info.html("用户名可以使用");
						$info.css("color","green");
					}
				}
			})
		}
	}
	function checkUserForm(){
		var $userName = $("#txtUserName");
		checkLoginName($userName.val());
		if($userName.next().html()=="用户名已存在！"||$userName.next().html()=="请输入用户名！"){
			return false;
		}
		return true;
	}
	function addUser(){
		if(checkUserForm()){
			var data = $("#userForm").serialize();
			$.ajax({
				type:"post",
				url:"UserServlet",
				data:"action=insertUser&"+data,
				dataType:"text",
				success:function(msg){
					alert(msg);
					location.href="manage/user/user.jsp?csstype=5";
				}
			})
		}
	}
</script>
</head>
<body>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>新增用户</h2>
		<div class="manage">
			<s:form action="userAction_save" method="post" theme="simple" namespace="/user">
				<table class="form">
					<tr>
						<td class="field">用户名：</td>
						<td><s:textfield name="loginName" onblur="checkLoginName(this.value)" id="txtUserName"></s:textfield>&emsp;<span></span></td>
					</tr>
					<tr>
						<td class="field">姓名：</td>
						<td><s:textfield name="userName"></s:textfield></td>
					</tr>
					<tr>
						<td class="field">密码：</td>
						<td><s:textfield name="password"></s:textfield></td>
					</tr>
					<tr>
						<td class="field">性别：</td>
						<td><s:radio name='sex' list="#{'0':'男','1':'女'}" value="'0'"></s:radio></td>
					</tr>
					<tr>
						<td class="field">
							用户类型：
						</td>
						<td>
							<s:select name="status" list="#{'0':'管理员','1':'审核员','2':'配货员','3':'送货员'}"></s:select>
						</td>
					</tr>
					<tr>
						<td class="field">身份证：</td>
						<td><s:textfield name="identityCode"></s:textfield></td>
					</tr>
					<tr>
						<td class="field">出生日期：</td>
						<td>
							<s:textfield name="birthday" onclick="WdatePicker()" readonly="true"></s:textfield>
						</td>
					</tr>
					<tr>
						<td class="field">手机号码：</td>
						<td><s:textfield name="mobile"></s:textfield></td>
					</tr>
					<tr>
						<td class="field">送货地址：</td>
						<td><s:textfield name="address"></s:textfield></td>
					</tr>
					<tr>
						<td class="field">邮箱：</td>
						<td><s:textfield name="email"></s:textfield></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><s:submit value="添加"></s:submit></label></td>
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

