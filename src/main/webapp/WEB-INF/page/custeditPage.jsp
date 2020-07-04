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
<style type="text/css">
.divForm{
position: absolute;/*绝对定位*/
width: 500px;
height: 400px;

/* border: 1px solid red; */
text-align: center;/*(让div中的内容居中)*/
top: 50%;
left: 50%;
margin-top: -150px;
margin-left: -240px;
}
</style>
<link rel="stylesheet" href="static/layui/css/layui.css">
</head>
<body>
		<div class="divForm">
			<form action="sys/custeditpass" method="post" class="layui-form "
				lay-filter="user_save">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">原密码</label>
						<div class="layui-input-inline">
							<input name="user_oldpass" type="password" autocomplete="off"
								class="layui-input kong" lay-verify="oldpass">
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">新密码</label>
						<div class="layui-input-inline">
							<input name="user_newpass" type="password" autocomplete="off"
								class="layui-input kong" lay-verify="required">
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">确认密码</label>
						<div class="layui-input-inline">
							<input name="user_confirmpass" type="password" autocomplete="off"
								class="layui-input kong" lay-verify="required">
						</div>
					</div>
				</div>
				<button class="layui-btn">修改密码</button>
			</form>
		</div>


	<script src="static/layui/layui.all.js"></script>
	<script type="text/javascript">
		var $ = layui.$;
		var form = layui.form;
		//变成同步请求
		$.ajaxSettings.async = false;
		$("form").submit(function(){
			var oldpass = $("[name=user_oldpass]").val();
			var newpass = $("[name=user_newpass]").val();
			var confirmpass = $("[name=user_confirmpass]").val();
			//原密码输入正确
			if (newpass== ""||confirmpass=="") {
				layer.msg("密码不可为空", {icon:6,time:2000});
				return false;
			}
			if(newpass != confirmpass ){
				layer.msg("新密码和确认密码不一致", {icon:6,time:2000});
				return false;
			}
			var rd = "";
			$.post("sys/custconfirmpass", {
				'oldpass' : oldpass
			}, function(d) {
				console.log(d);
				rd = d;
			});
			if (rd != true) {
				layer.msg("原密码不匹配", {icon:6,time:2000});
				return false;
			}
		});
	</script>
</body>
</html>