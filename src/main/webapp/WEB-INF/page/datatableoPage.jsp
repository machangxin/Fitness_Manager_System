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
<div id = "div3" ></div>
<script src="static/layui/layui.all.js"></script>
<script type="text/javascript" src= "static/echarts/echarts.min.js"></script>
<script type="text/javascript">
var $ = layui.$;
$.ajaxSettings.async = false;
// 基于准备好的dom，初始化echarts实例
var myChart3 = echarts.init(document.getElementById('div3'));


var tabledata2;
$.post("pre_sales",function(d){
	tabledata2=d;
});

var option3 = {
		color:['#4169E1','#1E90FF','#6495ED','#93c9ff', '#9eceff','#a8d3ff', 
			  '#b2d8ff', '#bcddff','#c6e2ff', '#d1e8ff', '#dbedff'],
	    title: {
	        text: '会员消费总额',
	        subtext: '仅显示前十名',
	        left: '10%'
	    },
	    tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b}: {c}元",
	        position:function(p){ //其中p为当前鼠标的位置
	        	return [p[0] + 10, p[1] - 10];
	        	},
	        	extraCssText:'width:160px;height:40px;background:#708090;'
	    },
	    toolbox: {
	        feature: {
	            dataView: {readOnly: false},
	            restore: {},
	            saveAsImage: {}
	        }
	    }, legend: {
	    	 orient: 'vertical',//表头垂直
	    	 top:25,
		        right: 5,
		        data:tabledata2.name
	    },
	    series: [
	        {
	            name:'该会员消费总额',
	            type:'funnel',
	            left: '5%',//靠左显示
	            top: 60,//离顶部多少
	            //x2: 80,
	            bottom: 60,
	            width: '80%',
	            // height: {totalHeight} - y - y2,
	            min: 0,
	            max: 10000,
	            minSize: '0%',
	            maxSize: '100%',
	            sort: 'descending',
	            gap: 2,
	            label: {
	                show: true,
	                position: 'inside'
	            },
	            labelLine: {
	                length: 10,
	                lineStyle: {
	                    width: 1,
	                    type: 'solid'
	                }
	            },
	            itemStyle: {
	                borderColor: '#fff',
	                borderWidth: 1
	            },
	            emphasis: {
	                label: {
	                    fontSize: 20
	                }
	            },
	            data: tabledata2.zong
	        }
	    ]
	};
myChart3.setOption(option3);
</script>
</body>
</html>