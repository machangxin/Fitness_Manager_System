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
	<button class="layui-btn layui-btn-radius layui-icon layui-icon-search " lay-event="select" style="background-color:#B0C4DE">查询<button>
	<button class="layui-btn layui-btn-radius layui-icon layui-icon-add-1" lay-event="insert" style="background-color:#6495ED">新增<button>
	<button class="layui-btn layui-btn-radius layui-icon layui-icon-close" lay-event="del" style="background-color:#1E90FF">删除<button>
	<button class="layui-btn layui-btn-radius layui-icon layui-icon-refresh" lay-event="select" style="background-color:#4169E1">刷新<button>
</script>
	<script type="text/html" id="rowtool">
	<a class="layui-btn layui-btn-xs layui-btn-radius layui-icon layui-icon-edit" lay-event="update" style="background-color:#6495ED">编辑</a>
	<a class="layui-btn layui-btn-xs layui-btn-radius layui-icon layui-icon-close" lay-event="del" style="background-color:#1E90FF">删除</a>
</script>
	<table class="layui-table"
		lay-data="{ height: 'full-1',url:'cost_list', page:true, id:'costtable_id',toolbar:'#toolbar'}"
		lay-filter="costtable">
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{type:'numbers'}">序列</th>
				<th lay-data="{field:'cost_id', sort: true hide:true}">ID</th>
				<th lay-data="{field:'cust_loginname',sort: true}">会员名</th>
				<th lay-data="{field:'cost_money',sort: true}">消费金额</th>
				<th lay-data="{field:'time',sort: true}">消费时间</th>
				<th lay-data="{field:'cost_info'}">备注</th>
				<th lay-data="{toolbar:'#rowtool',width:200}">操作</th>
			</tr>
		</thead>
	</table>
	
	
	<form hidden id="update_h_div" class="layui-form "
		lay-filter="costlog_update">
		<input type="hidden" name="cost_id" />
		<!-- 隐藏id -->
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-inline">
					<input readonly="readonly" id="cust_loginname" name="cust_loginname" type="text"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">消费时间</label>
				<div class="layui-input-inline">
					<input id="cost_time" readonly="readonly" name="cost_time" type="text"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">消费金额</label>
				<div class="layui-input-inline">
					<input id="cost_money" name="cost_money" type="text" oninput="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')"
						autocomplete="off" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">备注</label>
				<div class="layui-input-inline">
					<input id="cost_info" name="cost_info" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
	</form>
		<form hidden id="h_div" class="layui-form "
		lay-filter="costlog_save">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">会员名</label>
				<div class="layui-input-inline">
					<input name="Customer_loginname" type="text"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">消费金额</label>
				<div class="layui-input-inline">
					<input name="cost_money" type="text" oninput="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')"
						autocomplete="off" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">备注</label>
				<div class="layui-input-inline">
					<input name="cost_info" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required|phone">
						
				</div>
			</div>
		</div>
	</form>

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
			case 'del':
				//如果只有一条信息
				var msg = "";
				if (data.length == 0) {
					//没有选中数据
					layer.alert("请先选中数据,然后操作");
					return false;
				} else if (data.length == 1) {
					msg = "确定要删除" + data[0].cust_loginname + "的此条消费信息吗?";
				} else {
					msg = "确定要删除" + data[0].cust_loginname + "等" + data.length
							+ "条消费信息吗?";
				}
				layer.confirm(msg, {
					btn : [ '确定', '取消' ]
				}, function() {
					var costids = "";
					for (var i = 0; i < data.length; i++) {
						costids += data[i].cost_id + ",";
					}
					$.post("costlog_del_more", {
						"costids" : costids
					}, function(d) {
						layer.closeAll();
						layer.msg("删除成功", {
							icon : 1,
							time : 2000
						});
						table.reload('costtable_id');
					});

				}, function() {
					layer.closeAll();
				});
				break;
			case 'refrash':
				table.reload('costtable_id', {
					url : 'cost_list',
					where : {
						"check" : ''
					}
				});
				break;
			case 'insert':
				//弹出对话框,供客户填写数据
				//保存与取消按钮
				//清空数据
				form.val("costlog_save", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
					"Customer_loginname" : "", // "name": "value"
					"cost_money" : "",
					"cost_info": ""
				});
				layer.open({
					type : 1,
					title : '新增消费信息',
					content : $("#h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						var rd="";
						var nu="";
						$.post("sys/confirmcustname",form.val("costlog_save"),function(d){
							rd=d;
						});
						$.post("confirmnull",form.val("costlog_save"),function(d){
							nu=d;
						});
						if(rd==false&&nu==true){
						$.post("costlog_save", form.val("costlog_save"), function(d) {
							layer.closeAll();
							layer.msg("添加成功", {
								icon : 1,
								time : 2000
							});
							table.reload('costtable_id');
						});}
						else if(rd==true&&nu==false){
							layer.msg("查找不到此人且消费金额为空不可添加", {icon:2,time:2000});
						}else if(rd==true){
							layer.msg("查找不到此人,不可添加", {icon:2,time:2000});
						}else{
							layer.msg("消费金额为空,不可添加", {icon:2,time:2000});
						}
					},
					btn2 : function() {
						layer.closeAll();
					}
				});
				break;
			case 'select':
				//查询管理员信息
				table.reload('costtable_id', {
					url : 'cost_list',
					where : {
						"check" : $("#check").val()
					}
				});
				break;
			}
		});

		/*	表格内部的编辑与删除  */
		table.on('tool(costtable)', function(obj) {
			var data = obj.data;
			//console.log(data);
			switch (obj.event) {
			case 'del':
				layer.confirm("确定要删除" + data.cust_realname + "的此条消费信息吗?", {
					btn : [ '确定', '取消' ]
				}, function() {
					console.log("123421");
					$.post("cost_del", data, function(d) {
						layer.closeAll();
						layer.msg("删除成功", {
							icon : 1,
							time : 2000
						});
						table.reload('costtable_id');
					});
				}, function() {
					layer.closeAll();
				});
				break;
			case 'update':
				form.val("costlog_update", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
						"cust_loginname":data.cust_loginname,
						"cost_money":data.cost_money,
						"cost_info":data.cost_info,
						"cost_time":data.time,
						"cost_id":data.cost_id
				});
				//弹出对话框
				layer.open({
					type : 1,
					title : '编辑消费信息',
					content : $("#update_h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("costlog_update", form.val("costlog_update"),
								function() {
									layer.closeAll();
									layer.msg( "消费信息修改成功",
											{
												icon : 6,
												time : 2000
											});
									table.reload('costtable_id');
								});
					},
					btn2 : function() {
						//点击取消，关闭弹出框
						layer.closeAll();
					}
				});
				break;
			}
		});
		
	</script>
</body>
</html>