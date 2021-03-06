<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
<meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>淘淘商城后台</title>
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/layui/css/layui.css">
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath }/js/index.js"></script>
<script src="${pageContext.request.contextPath }/js/echarts-en.common.min.js"></script>

</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">淘淘商城后台</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->

			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> admin
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">个人中心</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">注销</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a class="" href="javascript:;">商品管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a id="addItemCat" href="javascript:;">商品分类添加</a>
							</dd>
							<dd>
								<a href="javascript:;">商品分类查询</a>
							</dd>
							<dd>
								<a id="addItem" href="javascript:;">商品添加</a>
							</dd>
							<dd>
								<a id="showItem" href="javascript:;">商品查询</a>
							</dd>
							<dd>
								<a href="javascript:;">商品规格参数模板添加</a>
							</dd>
							<dd>
								<a href="javascript:;">商品规格参数模板查询</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">cms内容管理系统</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">cms内容模板添加</a>
							</dd>
							<dd>
								<a href="javascript:;">cms内容模板查询</a>
							</dd>
							<dd>
								<a href="javascript:;">cms内容添加</a>
							</dd>
							<dd>
								<a href="javascript:;">cms内容查询</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">订单管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">查询订单</a>
							</dd>
							<dd>
								<a href="javascript:;">订单统计</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">用户管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">查询用户</a>
							</dd>
							<dd>
								<a href="javascript:;">用户统计</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">权限管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">查看权限</a>
							</dd>
							<dd>
								<a href="javascript:;">分配权限</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">活动管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">新增活动</a>
							</dd>
							<dd>
								<a href="javascript:;">查看活动</a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<div id="content" style="background-color: #F2F2F2; height: 100%">
				<div style="padding: 20px; background-color: #F2F2F2;">
					<div class="layui-row layui-col-space15">
						<div class="layui-col-md3">
							<div class="layui-card">
								<div class="layui-card-header">
									<div>
										<span>访问量</span> <span class="layui-badge layui-bg-blue">周</span>
									</div>
								</div>
								<div class="layui-card-body">
									<span style="font-size: 36px; color: #676767">99999</span></br> </br> <span
										style="color: #676767">总访问量</span>
								</div>
							</div>
						</div>
						<div class="layui-col-md3">
							<div class="layui-card">
								<div class="layui-card-header">
									<div>
										<span>每天收入</span> <span class="layui-badge">天</span>
									</div>

								</div>
								<div class="layui-card-body">
									<span style="font-size: 36px; color: #676767">5000</span></br> </br> <span
										style="color: #676767">总收入</span>
								</div>
							</div>
						</div>
						<div class="layui-col-md3">
							<div class="layui-card">
								<div class="layui-card-header">
									<div>
										<span>用户总数</span> <span class="layui-badge layui-bg-green">月</span>
									</div>

								</div>
								<div class="layui-card-body">
									<span style="font-size: 36px; color: #676767">8000</span></br> </br> <span
										style="color: #676767">总用户数</span>
								</div>
							</div>
						</div>
						<div class="layui-col-md3">
							<div class="layui-card">
								<div class="layui-card-header">
									<div>
										<span>新增用户</span> <span class="layui-badge">天</span>
									</div>

								</div>
								<div class="layui-card-body">
									<span style="font-size: 36px; color: #676767">16</span></br> </br> <span
										style="color: #676767">新增人数</span>
								</div>
							</div>
						</div>
						<div class="layui-col-md12">
							<div class="layui-col-md6">
								<div class="layui-card">
									<div class="layui-card-header">商品分类统计</div>
									<div class="layui-card-body">
										<div id="echartsMain1" style="width: 400px; height: 400px;"></div>
									</div>
								</div>
							</div>
							<div class="layui-col-md6">
								<div class="layui-card">
									<div class="layui-card-header">定位服务</div>
									<div class="layui-card-body">
										
											<div style="width:500px;height:400px;border:#ccc solid 1px;" id="dituContent"></div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-footer" style="background-color: #F2F2F2">
			<!-- 底部固定区域 -->
			© 欢迎来到淘淘商城后台管理系统
		</div>
	</div>

<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart1 = echarts.init(document.getElementById('echartsMain1'));
        
        var weatherIcons = {

        };
        
        $.get('/itemCat/statisticsItem').done(function (resule) {
            myChart1.setOption({
            	title: {
    		        text: '商品分类统计',
    		        left: 'center'
    		    },
    		    tooltip: {
    		        trigger: 'item',
    		        formatter: '{a} <br/>{b} : {c} ({d}%)'
    		    },
    		    
    		    series: [
    		        {
    		            type: 'pie',
    		            radius: '65%',
    		            center: ['50%', '50%'],
    		            selectedMode: 'single',
    		            data:resule   
    		        }
    		    ]
            });
        })
       
    </script>
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(205.097376,-57.92745);//定义一个中心点坐标
        map.centerAndZoom(point,1);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    
    initMap();//创建和初始化地图
</script>

</body>
</html>