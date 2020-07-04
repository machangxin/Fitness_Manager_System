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
<base href="<%=basePath%>"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html,body{
	width:99%;
	height:98%;
}
div{
float:left;
	width:100%;
	height:100%;
}
</style>
</head>
<body>
<div id = "div2" ></div>
<script src="static/layui/layui.all.js"></script>
<script type="text/javascript" src= "static/echarts/echarts.min.js"></script>
<script type="text/javascript">
var $ = layui.$;
$.ajaxSettings.async = false;
// 基于准备好的dom，初始化echarts实例
var myChart2 = echarts.init(document.getElementById('div2'));

var tabledata4;
$.post("month_sales",function(d){
	tabledata4=d;
});

var option2 = {
		title : {
			text : '当年每月业绩',
			subtext: '未显示的月份业绩为0'
		},
		tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b}: {c}元",
	        position:function(p){ //其中p为当前鼠标的位置
	        	return [p[0] + 10, p[1] - 10];
	        	},
	        	extraCssText:'width:160px;height:40px;background:#708090;'
	    },
		/* 用于右上角的三个按钮 */
		toolbox: {
	        feature: {
	            dataView: {readOnly: false},
	            restore: {},
	            saveAsImage: {}
	        }
	    },
	    xAxis: {
	        type: 'category',
	        data: tabledata4.month
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [{
	    	name:'本月业绩总金额',
            type:'funnel',
            left: '-5%',//靠左显示
            top: 60,//离顶部多少
            //x2: 80,
            bottom: 60,
            
            width: '100%',
            gap: 2,
            labelLine: {
                length: 10,
                lineStyle: {
                    width: 1,
                    type: 'normal'
                }
            },
            itemStyle: {
                borderColor: '#191970',
                borderWidth: 1,
					normal : {
						lineStyle:{
							color:'#4169E1'
						}
					}
            },
            emphasis: {
                label: {
                    fontSize: 20
                }
            },
	        data: tabledata4.month_sales,
	        type: 'line',
	        smooth: true
	    }]
	};

myChart2.setOption(option2);

</script>
</body>
</html>