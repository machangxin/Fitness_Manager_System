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
	<a class="layui-btn layui-btn-xs layui-btn-radius layui-icon layui-icon-edit" lay-event="update" style="background-color:#B0C4DE">编辑</a>
	<a class="layui-btn layui-btn-xs layui-btn-radius layui-icon layui-icon-close" lay-event="del" style="background-color:#6495ED">删除</a>
	<a class="layui-btn layui-btn-xs layui-btn-radius layui-icon layui-icon-list" lay-event="insertlog" style="background-color:#1E90FF">添加消费记录</a>	
	<a class="layui-btn layui-btn-xs layui-btn-radius layui-icon layui-icon-list" lay-event="costlog" style="background-color:#4169E1">消费记录</a>
</script>
	<table class="layui-table"
		lay-data="{ height: 'full-1',url:'sys/customer_list', page:true, id:'customertable_id',toolbar:'#toolbar'}"
		lay-filter="customertable">
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{type:'numbers'}">序列</th>
				<th lay-data="{field:'cust_id', sort: true hide:true}">ID</th>
				<th lay-data="{field:'cust_loginname',sort: true,width:150}">登录名</th>
				<th lay-data="{field:'cust_realname',sort: true,width:80}">姓名</th>
				<th lay-data="{field:'cust_sex',sort: true,width:80}">性别</th>
				<th lay-data="{field:'cust_tel',width:150}">电话</th>
				<th lay-data="{field:'cust_addr'}">住址</th>
				<th lay-data="{toolbar:'#rowtool',width:340}">操作</th>
			</tr>
		</thead>
	</table>

	<form hidden id="h_div" class="layui-form " lay-filter="customer_save">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">登录名</label>
				<div class="layui-input-inline">
					<input id="Customer_loginname" name="Customer_loginname" type="text"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">真实姓名</label>
				<div class="layui-input-inline">
					<input id="Customer_realname" name="Customer_realname" type="text"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline"">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input id="Customer_sex0" type="radio" value="男" name="Customer_sex"
						title="男" lay-filter="test"> <input id="Customer_sex1"
						type="radio" value="女" name="Customer_sex" title="女" lay-filter="test">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">电话</label>
				<div class="layui-input-inline">
					<input id="Customer_tel" name="Customer_tel" type="text" oninput = "value=value.replace(/[^\d]/g,'')"
						autocomplete="off" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">住址</label>
				<div class="layui-input-inline">
					<input id="Customer_addr" name="Customer_addr" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
	</form>

	<form hidden id="update_h_div" class="layui-form "
		lay-filter="customer_update">
		<input type="hidden" name="Customer_id" />
		<!-- 隐藏id -->
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">登录名</label>
				<div class="layui-input-inline">
					<input readonly="readonly" id="Customer_loginname" name="Customer_loginname" type="text"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">真实姓名</label>
				<div class="layui-input-inline">
					<input id="Customer_realname" name="Customer_realname" type="text"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline"">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input id="Customer_sex0" type="radio" value="男" name="Customer_sex"
						title="男" lay-filter="test"> <input id="Customer_sex1"
						type="radio" value="女" name="Customer_sex" title="女" lay-filter="test">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">电话</label>
				<div class="layui-input-inline">
					<input id="Customer_tel" name="Customer_tel" type="text"
						autocomplete="off" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">住址</label>
				<div class="layui-input-inline">
					<input id="Customer_addr" name="Customer_addr" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
	</form>
	
	<form hidden id="visit_div" class="layui-form"
		lay-filter="customer_cost">
		<input type="hidden" name="cust_id" />

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">消费金额</label>
				<div class="layui-input-inline">
					<input name="cost_money" type="text" class="layui-input kong" oninput="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')"
						lay-verify="required">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">备注信息</label>
				<div class="layui-input-inline">
					<textarea name="cost_info" placeholder="请输入内容" class="layui-textarea"
						style="width: 350px"></textarea>
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
		table.on('toolbar(customertable)', function(obj) {
			//获取选中数据
			var checkStatus = table.checkStatus('customertable_id');
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
					msg = "确定要删除" + data[0].cust_realname + "的会员信息吗?";
				} else {
					msg = "确定要删除" + data[0].cust_realname + "等" + data.length
							+ "条会员信息吗?";
				}
				layer.confirm(msg, {
					btn : [ '确定', '取消' ]
				}, function() {
					var custids = "";
					for (var i = 0; i < data.length; i++) {
						custids += data[i].cust_id + ",";
					}
					$.post("sys/cust_del_more", {
						"custids" : custids
					}, function(d) {
						layer.closeAll();
						layer.msg("删除成功", {
							icon : 1,
							time : 2000
						});
						table.reload('customertable_id');
					});

				}, function() {
					layer.closeAll();
				});
				break;
			case 'refrash':
				table.reload('customertable_id', {
					url : 'customer_list',
					where : {
						"check" : ''
					}
				});
				break;
			case 'insert':
				//弹出对话框,供客户填写数据
				//保存与取消按钮
				//清空数据
				form.val("customer_save", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
					"Customer_loginname" : "", // "name": "value"
					"Customer_tel" : "",
					"Customer_addr": "",
					"Customer_realname":""
				});
				layer.open({
					type : 1,
					title : '新增会员信息',
					content : $("#h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						var rd="";
						$.post("sys/confirmcustname",form.val("customer_save"),function(d){
							rd=d;
						});
						if(rd==true){
							//console.log(12321312);
						$.post("sys/customer_save", form.val("customer_save"), function(d) {
							layer.closeAll();
							layer.alert('默认密码:'+d, {
								title : '新增用户账号'
							});
							table.reload('customertable_id');
						});}
						else{
							//console.log("!123rd");
							layer.msg("登录名重复,不可使用", {icon:2,time:2000});
						}
					},
					btn2 : function() {
						layer.closeAll();
					}
				});
				break;
			case 'select':
				//查询管理员信息
				table.reload('customertable_id', {
					url : 'sys/customer_list',
					where : {
						"check" : $("#check").val()
					}
				});
				break;
			}
		});

		/*	表格内部的编辑与删除  */
		table.on('tool(customertable)', function(obj) {
			var data = obj.data;
			//console.log(data);
			switch (obj.event) {
			case 'insertlog':
				form.val("customer_cost", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
					//"visit_payment" : false, // "name": "value"
					"cost_money" : "0",
					"cost_info" : "",
					"cust_id":data.cust_id
				});
				layer.open({
					type : 1,
					title : '消费记录',
					area : [ '500px', '300px' ],
					content : $("#visit_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						
						var formdata=form.val("customer_cost");
						if(formdata.cost_money=="0"){
							layer.msg("消费金额不可为0", {
								icon : 2,
								time : 2000
							});
						}else{
							$.post("customer_cost", form.val("customer_cost"),
									function() {
										layer.closeAll();
										layer.msg("消费记录保存成功", {
											icon : 1,
											time : 2000
										});
									});
						}
						
					},
					btn2 : function() {
						layer.closeAll();
					}
				});
				break;
			case 'costlog':
				location.href="costlogPage?cust_id="+data.cust_id;
				break;
			case 'del':
				layer.confirm("确定要删除" + data.cust_realname + "的会员信息吗?", {
					btn : [ '确定', '取消' ]
				}, function() {
					$.post("sys/customer_del", data, function(d) {
						layer.closeAll();
						layer.msg("删除成功", {
							icon : 1,
							time : 2000
						});
						table.reload('customertable_id');
					});
				}, function() {
					layer.closeAll();
				});
				break;
			case 'update':
				form.val("customer_update", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
					"Customer_loginname" : data.cust_loginname, // "name": "value"
					"Customer_tel" : data.cust_tel,
					"Customer_addr" : data.cust_addr,
					"Customer_id" : data.cust_id,
					"Customer_realname" : data.cust_realname,
					"Customer_sex" : data.cust_sex
				});
				//弹出对话框
				layer.open({
					type : 1,
					title : '编辑用户信息',
					content : $("#update_h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("sys/customer_update", form.val("customer_update"),
								function() {
									layer.closeAll();
									layer.msg(data.cust_loginname + "账户信息修改成功",
											{
												icon : 6,
												time : 2000
											});
									table.reload('customertable_id');
								});
					},
					btn2 : function() {
						//点击取消
						//关闭弹出框
						layer.closeAll();
					}
				});
				break;
			}
		});
	</script>
</body>
</html>