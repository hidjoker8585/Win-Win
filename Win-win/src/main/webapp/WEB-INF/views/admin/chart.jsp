<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/CSSLoader.jsp"%>
    
<style>
.t{
	margin-right: auto;
	margin-left: auto;
}
.header{
	background-color: lightgray;
	font-weight: bold;
	text-align: center;
}
tr,td{
	text-align: center;
	font-size: 14px;
}
</style>

<%@ include file="../include/adminHeader.jsp"%>

<div class = "container">
<div class="container">
<div class="col-12 mt-5">
	<p class="font-weight-bold h3">통계관리</p>
	<hr style="border: solid #376092;">
</div>
<table class="table table-md-12 text-center">
	<tr>   <!--Div that will hold the pie chart-->
    	<td><div id="chart_div"></div></td>
    	<td><div id="another_chart_div"></div></td>
   		<td><div id="theother_chart_div"></div></td>
	</tr>
	<tr>
		<td>
			<table class="t table table-sm col-md-10 table-bordered">
				<tr class="header">
					<td>
					연령대
					</td>
					<td>
					입사지원자 수
					</td>
				</tr>
				<tr>
					<td>
					20대 초반(20~25세)
					</td>
					<td>
					${map.age20e }
					</td>
				</tr>
				<tr>
					<td>
					20대 후반(26~29세)
					</td>
					<td>
					${map.age20l }
					</td>
				</tr>
				<tr>
					<td>
					30대
					</td>
					<td>
					${map.age30s }
					</td>
				</tr>
				<tr>
					<td>
					40대
					</td>
					<td>
					${map.age40s }
					</td>
				</tr>
			</table>
		</td>
		<td>
			<table class="t table table-sm col-md-10 table-bordered">
				<tr class="header">
					<td>
					학력별
					</td>
					<td>
					입사지원자 수
					</td>
				</tr>
				<tr>
					<td>
					학력무관
					</td>
				 	<td>
				 	${map.eduno }
					</td>
				</tr>
				<tr>
					<td>
					고등학교 졸업
					</td>
					<td>
					${map.eduhigh }
					</td>
				</tr>
				<tr>
					<td>
					대학교 2년제
					</td>
					<td>
					${map.educoll }
					</td>
				</tr>
				<tr>
					<td>
					대학교 4년제
					</td>
					<td>
					${map.eduuniv }
					</td>
				</tr>
				<tr>
					<td>
					석/박사
					</td>
					<td>
					${map.edumd }
					</td>
				</tr>
			</table>
		</td>
		<td>
			<table class="t table table-sm col-md-10 table-bordered">
				<tr class="header">
					<td>
					분기별
					</td>
					<td>
					입사지원자 수
					</td>
				</tr>
				<tr>
					<td>
					2016년 상반기
					</td>
					<td>
					82
					</td>
				</tr>
				<tr>
					<td>
					2016년 하반기
					</td>
					<td>
					78
					</td>
				</tr>
				<tr>
					<td>
					2017년 상반기
					</td>
					<td>
					144
					</td>
				</tr>
				<tr>
					<td>
					2017년 하반기
					</td>
					<td>
					121
					</td>
				</tr>
				<tr>
					<td>
					2018년 상반기
					</td>
					<td>
					158
					</td>
				</tr>
				<tr>
					<td>
					2018년 하반기
					</td>
					<td>
					${map.sec18 }
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>    
</div>
</div>    
<br><br>


<%@ include file="../include/scriptLoader.jsp"%>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

// Load the Visualization API and the corechart package.
google.charts.load('current', {'packages':['bar']});
google.charts.load('current', {'packages':['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart1);
google.charts.setOnLoadCallback(drawChart2);
google.charts.setOnLoadCallback(drawChart3);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart1() {
		
		var age20e = ${map.age20e};
		var age20l = ${map.age20l};
		var age30s = ${map.age30s};
		var age40s = ${map.age40s};
		
        // Create the data table.
        var data = new google.visualization.arrayToDataTable([
            ["연령대", "지원자수", { role: "style" } ],
            ["20대 초,중반",age20e, "#184b9b"],
            ["20대 후반",age20l, "#184b9b"],
            ["30대",age30s, "#184b9b"],
            ["40대",age40s, "#184b9b"]
          ]);

        var view = new google.visualization.DataView(data);
        view.setColumns([0, 1,
                         { calc: "stringify",
                           sourceColumn: 1,
                           type: "string",
                           role: "annotation" },
                         2]);

        var options = {
                title: "WIN-WIN 연령별 지원자 현황",
                width: 330,
                height: 270,
    			vAxis : {maxValue : 80 },
                bar: {groupWidth: "50%"},
                legend: { position: "none" },
                titleTextStyle:{color: 'black', fontSize: 20,bold: true},
                chartArea:{left:40,top:50,width:'80%',height:'70%'}
              };
        
        var chart = new google.visualization.ColumnChart(document.getElementById("chart_div"));
        chart.draw(view, options);
      }
      
function drawChart2() {

    // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', '학력');
    data.addColumn('number', '지원자수');
   
    var eduno = ${map.eduno};
    var eduhigh = ${map.eduhigh};
    var educoll = ${map.educoll};
    var eduuniv = ${map.eduuniv};
    var edumd = ${map.edumd};

    data.addRows([
      ['무관',eduno],
      ['고등학교 졸업',eduhigh],
      ['대학 2년제',educoll],
      ['대학 4년제',eduuniv],
      ['석/박사',edumd]
    ]);

    // Set chart options
    var options = {'title':'WIN-WIN 학력별 지원자 현황',
                   'width':330,
                   'height':270,
                   	'is3D':false,
                    'pieSliceText': 'label',
                    'pieStartAngle': 90,
                    'chartArea':{left:20,top:50,width:'100%',height:'100%'},
                    'legend':{position: 'none', textStyle: {color: 'black', fontSize: 11},alignment : 'end'},
                    'titleTextStyle':{color: 'black', fontSize: 20,bold: true},
                    'colors': ['#657ea5', '#184b9b', '#386fc4', '#76a5ed'],
    				};

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.PieChart(document.getElementById('another_chart_div'));
    chart.draw(data, options);
  }
function drawChart3() {

    // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', '분기별');
    data.addColumn('number', '지원자수');
    data.addColumn({type:'number', role: 'annotation'});
    data.addRows([
      ['2016년 상반기', 82,82],
      ['2016년 하반기', 78,78],
      ['2017년 상반기', 144,144],
      ['2017년 하반기', 121,121],
      ['2018년 상반기', 158,158],
      ['2018년 하반기',${map.sec18},${map.sec18}]
    ]);

    // Set chart options
    var options = {title:'WIN-WIN 분기별 지원자 현황',
                   width:330,
                   height:270,
    				vAxis:{minValue:0, maxValue:200},
                    titleTextStyle:{color: 'black', fontSize: 20,bold: true},
                    legend: {position: 'none'},
                    chartArea:{left:40,top:50,width:'80%',height:'70%'},
                    areaOpacity:0.0,
                    annotations: {
                    	stem: {
                    		color : 'white',
                    		length : 4
                    	},
                        textStyle: {
                          fontSize: 12,
                          bold: true,
                          // The color of the text.
                          color: 'black',
                          // The color of the text outline.                
                          opacity: 0.7
                        }
                      }
                          
    				};

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.AreaChart(document.getElementById('theother_chart_div'));
    chart.draw(data, options);
  }
</script>

<%@ include file="../include/footer.jsp"%>