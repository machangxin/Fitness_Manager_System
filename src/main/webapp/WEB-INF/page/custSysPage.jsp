<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
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
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>FIT健身房</title>
<link rel="stylesheet" href="static/assets/css/layui.css">
    <link rel="stylesheet" href="static/assets/css/admin.css">
    <link rel="icon" href="static/img/logo.ico">
</head>
<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header custom-header">
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item slide-sidebar" lay-unselect>
                    <a href="javascript:;" class="icon-font"><i class="ai ai-menufold"></i></a>
                </li>
            </ul>

            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;">${loginuser.cust_realname}
                    </a>
                    <dl class="layui-nav-child">
                    	<dd>
							<a url="sys/custeditPage">修改密码</a>
						</dd>
                        <dd><a href="sys/login_out">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>

        <div class="layui-side custom-admin">
            <div class="layui-side-scroll">

                <div class="custom-logo">
                    <img src="static/assets/images/logo.png" alt=""/>
                    <h1>FIT健身房欢迎您</h1>
                </div>
                <ul id="Nav" class="layui-nav layui-nav-tree">
                    <li class="layui-nav-item"><a  href="custdatatablePage?cust_id=${loginuser.cust_id}"
						target="frame"><span class="layui-icon layui-icon-group"></span>数据报表</a></li>
					 <li class="layui-nav-item"><a
						href="custcost_Page?cust_id=${loginuser.cust_id}" target="frame"><span class="layui-icon layui-icon-group"></span>消费记录管理</a></li>
                </ul>

            </div>
        </div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<iframe id="main_iframe" name="frame"
				style="width: 100%; height: 98%; border-style: none;" src="custdatatablePage?cust_id=${loginuser.cust_id}"></iframe>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			<a href="https://github.com/machangxin">
    	<svg t="1592361538922" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7993" width="20" height="20"><path d="M511.6 76.3C264.3 76.2 64 276.4 64 523.5 64 718.9 189.3 885 363.8 946c23.5 5.9 19.9-10.8 19.9-22.2v-77.5c-135.7 15.9-141.2-73.9-150.3-88.9C215 726 171.5 718 184.5 703c30.9-15.9 62.4 4 98.9 57.9 26.4 39.1 77.9 32.5 104 26 5.7-23.5 17.9-44.5 34.7-60.8-140.6-25.2-199.2-111-199.2-213 0-49.5 16.3-95 48.3-131.7-20.4-60.5 1.9-112.3 4.9-120 58.1-5.2 118.5 41.6 123.2 45.3 33-8.9 70.7-13.6 112.9-13.6 42.4 0 80.2 4.9 113.5 13.9 11.3-8.6 67.3-48.8 121.3-43.9 2.9 7.7 24.7 58.3 5.5 118 32.4 36.8 48.9 82.7 48.9 132.3 0 102.2-59 188.1-200 212.9 23.5 23.2 38.1 55.4 38.1 91v112.5c0.8 9 0 17.9 15 17.9 177.1-59.7 304.6-227 304.6-424.1 0-247.2-200.4-447.3-447.5-447.3z" p-id="7994"></path></svg>
    	</a>
		</div>
	</div>
	<script src="static/layui/layui.all.js"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;
		});
		/* 選擇有url屬性的組件--屬性選擇器 */
		var $ = layui.$;
		$("[url]").click(function() {
			//當擁有url的組件被點擊時會執行以下代碼
			//當自身的url屬性傳給main_iframe
			//$(this)代表发生事件的元素
			//attr(""),获取指定属性的属性值
			var url = $(this).attr("url");
			/* 将url显示到主题窗口*/
			$("#main_iframe").attr("src", url);
		})
	</script>
	<script src="index.js" data-main="home"></script>
</body>
</html>