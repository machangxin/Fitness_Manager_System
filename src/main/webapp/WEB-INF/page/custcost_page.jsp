<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/layui/css/layui.css">
</head>
<body>
	<script type="textml" id="toolbar">
	<input type="text" style="height:38px;" id="check"/>
	<button class="layui-btn layui-btn-radius layui-icon layui-icon-search " lay-event="select" style="background-color:#1E90FF">查询<button>
</script>

	<table class="layui-table"
		lay-data="{ height: 'full-1',url:'precost_list',where:{cust_id:'${cust_id}'},page:true, id:'costtable_id',toolbar:'#toolbar'}"
		lay-filter="costtable">
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{type:'numbers'}">序列</th>
				<th lay-data="{field:'cost_id', sort: true,hide:true}">ID</th>
				<th lay-data="{field:'cust_loginname',sort: true}">会员名</th>
				<th lay-data="{field:'cost_money',sort: true}">消费金额</th>
				<th lay-data="{field:'time',sort: true}">消费时间</th>
				<th lay-data="{field:'cost_info'}">备注</th>
			</tr>
		</thead>
	</table>
<script src="static/layui/layui.all.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script type="text/javascript">
	var table = layui.table;
	var $ = layui.$;
	var form = layui.form;
	$.ajaxSettings.async = false;
		table.on('toolbar(costtable)', function(obj) {
			//获取选中数据
			var checkStatus = table.checkStatus('costtable_id');
			var data = checkStatus.data;
			//浏览器控制台打印
			//console.log(data);
			switch (obj.event) {
			case 'select':
				table.reload('costtable_id', {
					url : 'precost_list',
					where : {
						"check" : $("#check").val()
					}
				});
				break;
			}
		});
		
	</script>
</body>
</html>