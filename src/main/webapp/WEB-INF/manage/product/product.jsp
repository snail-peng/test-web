<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://wwww.syaccp.com" prefix="shiro" %>
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
	function queryAllProduct(pageNo){
		$.ajax({
			type:"post",
			url:"ProductServlet",
			data:"action=queryAllProduct&pageNo="+pageNo,
			dataType:"json",
			success:function(msg){
				var $table = $("#listTable");
				$table.html("");
				$table.append("<tr><th>ID</th><th>商品名称</th><th>操作</th></tr>");
				for(var i=0;i<msg.length-1;i++){
					$table.append("<tr><td class='first w4 c'>"+(i+1+(pageNo-1)*6)+"</td><td class='thumb'><img src='images/product/"+msg[i].fileName+"' style='width:50px;height:50px;'/>"+msg[i].name+"</td><td class='w1 c'><a href='ProductServlet?action=getProductInfo&csstype=4&productId="+ msg[i].id +"'>修改</a> <a style='cursor:pointer;' onclick='deleteProduct("+msg[i].id+","+pageNo+")'>删除</a></td></tr>");
				}
				var $pager = $("#pager");
				$pager.html("");
				if(pageNo>1){
					$pager.append("<li><a style='cursor:pointer;' onclick='queryAllProduct("+(pageNo-1)+")'>上一页</a></li>");
				}
				for(var i=0;i<msg[msg.length-1].totalPageCount;i++){
					$pager.append("<li><a style='cursor:pointer;' onclick='queryAllProduct("+(i+1)+")'>"+(i+1)+"</a></li>");
				}
				if(pageNo<parseInt(msg[msg.length-1].totalPageCount)){
					$pager.append("<li><a style='cursor:pointer;' onclick='queryAllProduct("+(pageNo+1)+")'>下一页</a></li>");
				}
				$pager.find("li").each(function(){
					if($(this).find("a").html() == pageNo){
						$(this).find("a").css("color","blue");
					}
				})
			}
		})
	}
	
	function deleteProduct(id,pageNo){
		if(confirm("确认要删除吗？")){
			$.ajax({
				type:"post",
				url:"ProductServlet",
				data:"action=deleteProduct&productId="+id,
				datatype:"text",
				success:function(msg){
					alert(msg);
					if(msg=="删除成功！"){
						queryAllProduct(pageNo);
					}
				}
			})
		}
	}
	/*$(function(){
		queryAllProduct(1);
	})*/
</script>
</head>
<body>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>商品管理</h2>
		<div class="manage">
			<table class="list" id="listTable">
				<tr><th>序号</th><th>商品名称</th><th>操作</th></tr>
				<s:iterator value="page.list" status="i">
					<tr>
						<td class='first w4 c'><s:property value="#i.index+1+6*(page.currPageNo-1)"/> </td>
						<td class='thumb'><img src="images/product/<s:property value='fileName'/>" style='width:50px;height:50px;'/><s:property value="name"/></td>
						<td class='w1 c'>
							<shiro:hasPermission name="product/ProductAction!edit.action">
								<s:a href="/product/productAction_modify.action?id=%{id}">修改</s:a> 
							</shiro:hasPermission>
							<shiro:hasPermission name="product/ProductAction!delete.action">
								<s:a href="/product/productAction_delete.action?id=%{id}">删除</s:a>
							</shiro:hasPermission>
						</td>
					</tr>
				</s:iterator>
				
			</table>
		</div>
		<div class="pager">
			<ul class="clearfix" id="pager">
				<s:if test="page.currPageNo>1">
					<li><s:a href="/product/productAction_toList.action?pageNo=%{page.currPageNo-1}">上一页</s:a></li>
				</s:if>
				<s:iterator begin="1" end="page.totalPageCount" status="i">
					<li><s:a href="/product/productAction_toList.action?pageNo=%{#i.index+1}"><s:property value="#i.index+1"/></s:a></li>
				</s:iterator>
				<s:if test="page.currPageNo<page.totalPageCount">
					<li><s:a href="/product/productAction_toList.action?pageNo=%{page.currPageNo+1}">下一页</s:a></li>
				</s:if>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/manage/common/foot.jsp" %>
</body>
</html>

