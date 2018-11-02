<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />

</head>
  <body>
    <div id="menu-mng" class="lefter">
		<div class="box">
			<dl>
				<dt>用户管理</dt>
				<dd><em><a href="/user/userAction_toAdd.action">新增</a></em><a href="/user/userAction_toList.action">用户管理</a></dd>
				<dt>商品信息</dt>
				<dd><em><a href="/productCategory/productCategoryAction_toAdd.action?parentId=0&type=0">新增</a></em><a href="/productCategory/productCategoryAction_toList.action">分类管理</a></dd>
				<dd><em><a href="/product/productAction_toAdd.action">新增</a></em><a href="/product/productAction_toList.action">商品管理</a></dd>
				<dt>订单管理</dt>
				<dd><a href="/order/orderAction_toList.action">订单管理</a></dd>
				<dt>留言管理</dt>
				<dd><a href="/comment/commentAction_toList.action">留言管理</a></dd>
				<dt>新闻管理</dt>
				<dd><em><a href="/news/newsAction_toAdd.action">新增</a></em><a href="/news/newsAction_toList.action">新闻管理</a></dd>
			</dl>
		</div>
	</div>
  </body>
</html>
