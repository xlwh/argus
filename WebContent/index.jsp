<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery.js"></script>
	<script type="text/javascript" src="http://apps.bdimg.com/libs/Chart.js/0.2.0/Chart.min.js"></script>
	<title>Argus</title>
</head>
<body>
	<div class="head">head</div>
	<div class="content">
		<div class="left">
			<ul class="list-group">
   				<li class="list-group-item"><a href="#">gzns-map-web00.gzns</a></li>
  				<li class="list-group-item"><a href="#">gzns-map-web01.gzns</a></li>
   				<li class="list-group-item"><a href="#">gzns-map-web02.gzns</a></li>
   				<li class="list-group-item"><a href="#">gzns-map-web03.gzns</a></li>
   				<li class="list-group-item"><a href="#">gzns-map-web04.gzns</a></li>
   				<li class="list-group-item"><a href="#">gzns-map-web05.gzns</a></li>
  				<li class="list-group-item"><a href="#">gzns-map-web06.gzns</a></li>
   				<li class="list-group-item"><a href="#">gzns-map-web07.gzns</a></li>
   				<li class="list-group-item"><a href="#">gzns-map-web08.gzns</a></li>
   				<li class="list-group-item"><a href="#">gzns-map-web09.gzns</a></li>
			</ul>
		</div>
		<div class="right">
			<div class="panel panel-default">
   				<div class="panel-heading">
     			 	<h3 class="panel-title">CPU情况</h3>
   				</div>
   				<div class="panel-body">
      				 <div style="width:30%" style="float:left">
							<div><canvas id="canvas" height="200" width="600"></canvas></div>
					 </div>
					 <div style="width:30%" style="float:left">
							<div><canvas id="canvas_pip" height="200" width="600"></canvas></div>
					 </div>
   				</div>
			</div>
			
			<div class="panel panel-default">
   				<div class="panel-heading">
     			 	<h3 class="panel-title">网络情况</h3>
   				</div>
   				<div class="panel-body">
      				 <div style="width:30%">
							<div><canvas id="canva2" height="200" width="400"></canvas></div>
					 </div>
   				</div>
			</div>
			
			<div class="panel panel-default">
   				<div class="panel-heading">
     			 	<h3 class="panel-title">文件系统监控</h3>
   				</div>
   				<div class="panel-body">
      				 <div style="width:30%">
							<div><canvas id="canva3" height="200" width="400"></canvas></div>
					 </div>
   				</div>
			</div>
			
			<div class="panel panel-default">
   				<div class="panel-heading">
     			 	<h3 class="panel-title">内存监控</h3>
   				</div>
   				<div class="panel-body">
      				 <div style="width:30%">
							<div><canvas id="canva4" height="200" width="400"></canvas></div>
					 </div>
   				</div>
			</div>
			
			<div class="panel panel-default">
   				<div class="panel-heading">
     			 	<h3 class="panel-title">进程监控</h3>
   				</div>
   				<div class="panel-body">
      				 <table class="table table-bordered">
					   <caption>进程情况</caption>
					   <thead>
					      <tr>
					         <th>服务器</th>
					         <th>进程状态</th>
					         <th>状态</th>
					      </tr>
					   </thead>
					   <tbody>
					      <tr>
					         <td>gzns-map-web00.gzns</td>
					         <td>UP</td>
					         <td>正常</td>
					      </tr>
					       <tr>
					         <td>gzns-map-web01.gzns</td>
					         <td>UP</td>
					         <td>正常</td>
					      </tr>
					       <tr>
					         <td>gzns-map-web02.gzns</td>
					         <td>DOWN</td>
					         <td>异常</td>
					      </tr>
					   </tbody>
					</table>
   				</div>
			</div>
		
		
		</div>
	</div>
	<div class="foot">foot</div>
	
	<script>
		var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
		var lineChartData = {
			labels : ["14:00","15:00","16:00","17:00","18:00","19:00","20:00"],
			datasets : [
				{
					label: "CPU IDLE",
					fillColor : "rgba(220,220,220,0.2)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
				}
			]

		}
		
		var pip_data = {
				labels : ["12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00"],
				datasets : [
					{
						fillColor : "rgba(220,220,220,0.5)",
						strokeColor : "rgba(220,220,220,1)",
						data : [55,35,65,59,90,81,56,55,40]
					}
				]
			}


	window.onload = function(){
		var ctx = document.getElementById("canvas").getContext("2d");
		window.myLine = new Chart(ctx).Line(lineChartData, {
			responsive: true
		});
		
		var ctx_pip = document.getElementById("canvas_pip").getContext("2d");
		window.myLine = new Chart(ctx_pip).Bar(pip_data, {
			responsive: true
		});
		
		var ctx2 = document.getElementById("canva2").getContext("2d");
		window.myLine = new Chart(ctx2).Line(lineChartData, {
			responsive: true
		});
		
		var ctx3 = document.getElementById("canva3").getContext("2d");
		window.myLine = new Chart(ctx3).Line(lineChartData, {
			responsive: true
		});
		
		var ctx4 = document.getElementById("canva4").getContext("2d");
		window.myLine = new Chart(ctx4).Line(lineChartData, {
			responsive: true
		});
		
		
	}


	</script>
</body>
</html>