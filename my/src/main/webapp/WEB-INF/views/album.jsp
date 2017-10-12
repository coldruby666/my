<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--http://java.sun.com/jstl/core 톰켓 5이하-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
	<head>
		<title>앨범</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		
		<link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="css/jquery-ui.css" />
		
		<style type="text/css">
			/* jqgrid css */
			.ui-jqgrid tr.jqgrow td {
				word-wrap: break-word; /* IE 5.5+ and CSS3 */
				white-space: pre-wrap; /* CSS3 */
				white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
				white-space: -pre-wrap; /* Opera 4-6 */
				white-space: -o-pre-wrap; /* Opera 7 */
				overflow: hidden;
				height: auto;
				vertical-align: middle;
				padding-top: 3px;
				padding-bottom: 3px;
			}
    		/*.ui-jqgrid tr.jqgrow td { white-space: normal !important; height: auto; vertical-align: text-top; padding-top: 2px; }*/
    		th.ui-th-column div {
    			word-wrap: break-word; /* IE 5.5+ and CSS3 */
    			white-space: pre-wrap; /* CSS3 */
    			white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
    			white-space: -pre-wrap; /* Opera 4-6 */
    			white-space: -o-pre-wrap; /* Opera 7 */
    			overflow: hidden;
    			height: auto;
    			vertical-align: middle;
    			padding-top: 3px;
    			padding-bottom: 3px;
    		}

			.select-style {
			    border: 1px solid #ccc;
			    width: 100%;
			    border-radius: 3px;
			    overflow: hidden;
			}
			
			.select-style select {
			    padding: 4px 7px;
			    border: none;
			    width: 100%;
			    box-shadow: none;
			    background: transparent;
			    background-image: none;
			    -webkit-appearance: none;
			}
			
			.select-style select:focus {
			    outline: none;
			}
			
			.text-style input {
			    width: 100%;
			}
			
			.button-style input {
			    width: 100%;
			}
			
			
			/* Table 1 Style */
			table.table1{
				width: 100%;
			    font-family: "Trebuchet MS", sans-serif;
			    font-size: 16px;
			    font-weight: bold;
			    line-height: 1.4em;
			    font-style: normal;
			    border-collapse:separate;
			}
			.table1 thead th{
			    padding:15px;
			    color:#fff;
			    text-shadow:1px 1px 1px #568F23;
			    border:1px solid #93CE37;
			    border-bottom:3px solid #9ED929;
			    background-color:#9DD929;
			    background:-webkit-gradient(
			        linear,
			        left bottom,
			        left top,
			        color-stop(0.02, rgb(123,192,67)),
			        color-stop(0.51, rgb(139,198,66)),
			        color-stop(0.87, rgb(158,217,41))
			        );
			    background: -moz-linear-gradient(
			        center bottom,
			        rgb(123,192,67) 2%,
			        rgb(139,198,66) 51%,
			        rgb(158,217,41) 87%
			        );
			    -webkit-border-top-left-radius:5px;
			    -webkit-border-top-right-radius:5px;
			    -moz-border-radius:5px 5px 0px 0px;
			    border-top-left-radius:5px;
			    border-top-right-radius:5px;
			}
			.table1 thead th:empty{
			    background:transparent;
			    border:none;
			}
			.table1 tbody th{
			    color:#fff;
			    text-shadow:1px 1px 1px #568F23;
			    background-color:#9DD929;
			    border:1px solid #93CE37;
			    border-right:3px solid #9ED929;
			    padding:0px 10px;
			    background:-webkit-gradient(
			        linear,
			        left bottom,
			        right top,
			        color-stop(0.02, rgb(158,217,41)),
			        color-stop(0.51, rgb(139,198,66)),
			        color-stop(0.87, rgb(123,192,67))
			        );
			    background: -moz-linear-gradient(
			        left bottom,
			        rgb(158,217,41) 2%,
			        rgb(139,198,66) 51%,
			        rgb(123,192,67) 87%
			        );
			    -moz-border-radius:5px 0px 0px 5px;
			    -webkit-border-top-left-radius:5px;
			    -webkit-border-bottom-left-radius:5px;
			    border-top-left-radius:5px;
			    border-bottom-left-radius:5px;
			}
			.table1 tbody td{
			    padding:10px;
			    text-align:center;
			    background-color:#DEF3CA;
			    border: 2px solid #E7EFE0;
			    -moz-border-radius:2px;
			    -webkit-border-radius:2px;
			    border-radius:2px;
			    color:#666;
			    text-shadow:1px 1px 1px #fff;
			}
		</style>
	</head>
	<body>
		<div id="page-wrapper">
			<div id="header-wrapper">
				<div class="container">
					<div class="row">
						<div class="12u">

							<header id="header">
								<h1><a href="/my" id="logo">상세검색</a></h1>
								<nav id="nav">
									<a href="/my" class="current-page-item">처음으로</a>
									<a href="album_edit.do">앨범관리</a>
									<a href="code.do">코드관리</a>
									<a href="support.do">백업/복구</a>
								</nav>
							</header>

						</div>
					</div>
				</div>
			</div>
<!-- 			<div id="banner-wrapper">
				<div class="container">

					<div id="banner">
						<h2></h2>
						<span>And put something almost as cool here, but a bit longer ...</span>
					</div>

				</div>
			</div> -->
			<div id="main">
				<div class="container">
				
					<div class="row main-row" id="result_div">
						<div class='6u 12u(mobile)' id="albumHeaderInfo">
						</div>
						<div class='6u 12u(mobile)'>
							<section>
								<div id="jqGrid" style="width:100%;">
									<table id="grid"></table>
								</div>
							</section>
						</div>
					</div>
					
				</div>
			</div>
		</div>

		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/skel.min.js"></script>
		<script src="assets/js/skel-viewport.min.js"></script>
		<script src="assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="assets/js/main.js"></script>
		
		<script type="text/ecmascript" src="js/i18n/grid.locale-kr.js"></script>
		<script type="text/ecmascript" src="js/jquery.jqGrid.min.js"></script>
		
		<script type="text/javascript">
		
			var m_seq = (${m_seq} == null) ? "" : ${m_seq};
			console.log("jsp >> m_seq = " + m_seq);
			
			var $grid1;
		
			window.onload = function() {
				console.log("window.onload");
				
				makeAlbumInfo();
				makeGrid();
				
			};
			
			function makeGrid() {
				console.log("makeGrid()");
				
				var data = new Object();
				data.m_seq = m_seq;
				data.paging = "N";
				
				$grid1 = jQuery("#grid").jqGrid({
					url: "<c:url value='selectMusicList_Detail.do'/>",
					datatype: 'json',
					mtype: 'POST',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
					postData: JSON.stringify(data),
					editurl: 'clientArray',
	                colModel: [
	                    {label: 'g_cd'			,name: 'g_cd'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'm_seq'			,name: 'm_seq'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true		,key: true},
	                    {label: 'm_no'			,name: 'm_no'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'm_nm'			,name: 'm_nm'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'product'		,name: 'product'		,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'year'			,name: 'year'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'kind'			,name: 'kind'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'cond'			,name: 'cond'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'music'			,name: 'music'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'player'		,name: 'player'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'singer'		,name: 'singer'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'playCnt'		,name: 'playCnt'		,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'last_play_dt'	,name: 'last_play_dt'	,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'ex'			,name: 'ex'				,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'memo'			,name: 'memo'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'd_seq'			,name: 'd_seq'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true		,key: true},	                    
	                    {label: 'A/B'			,name: 'side'			,width: 30			,editable: false	,edittype: 'text'	,align: 'center'},
	                    {label: 'TR'			,name: 'd_no'			,width: 20			,editable: false	,edittype: 'text'	,align: 'center'},
	                    {label: '곡명'			,name: 'd_nm'			,width: 235			,editable: false	,edittype: 'text'},
	                    {label: '작곡'			,name: 'music'			,width: 75			,editable: false	,edittype: 'text'},
	                    {label: '연주'			,name: 'd_player'		,width: 75			,editable: false	,edittype: 'text'},
	                    {label: '가수'			,name: 'd_singer'		,width: 90			,editable: false	,edittype: 'text'},
	                    {label: '시간'			,name: 'play_time'		,width: 50			,editable: false	,edittype: 'text'	,formatter:formatter_hhmiss}
	                ],
	                width: $("#jqGrid").width(),
	                height: 'auto',
	                rowNum: 100,
	                rowList: [100],
	                rownumbers: false,
	                rownumWidth: 15,
	                shrinkToFit: false,
	                cellEdit: false,
	                cellsubmit: 'remote',
	                cellurl: 'album.jsp',
	                beforeSubmitCell: function(rowid, cellName, cellValue) {
	                	console.log( "<<beforeSubmitCell>>" );
	                	console.log( "1. rowid     >> " + rowid );
	                	console.log( "2. cellName  >> " + cellName );
	                	console.log( "3. cellValue >> " + cellValue );
	                },
	                afterSubmitCell: function(res) {
	                	var aResult = $.parseJSON(res.responseText);
	                	var userMsg = "데이터가 변경되었습니다.";
	                	if(aResult.msg != "success") {
	                		userMsg = "데이터 변경에 실패하였습니다.";
	                	}
	                	return [(aResult.msg == "success") ? true : false, userMsg];
	                },
	                sortorder: 'desc',
	                caption: '앨범 트랙 목록',
	                loadonce: false,
	                viewrecords: true/* ,
	                pager: '#gridpager' */
	            });
				
				/* $grid1 = $("#grid").jqGrid('setGroupHeaders', {
					useColSpanStyle: true,
					groupHeaders: [
						{startColumnName: 'product',	numberOfColumns: 3, titleText: '제작사'}
					]
				}); */
				
				reload();

			}
			
			function reload() {
				jQuery("#grid").trigger('reloadGrid');
			}
			
			function formatter_hhmiss(cellValue, options, rowdata, action) {
				var html = cellValue.substr(0,2) + ":" + cellValue.substr(0 +2,2) + ":" + cellValue.substr(0 +4,2);
				return html;
			}
			
			function makeAlbumInfo() {
				console.log("makeAlbumInfo()");
				
				//$("#result_div").empty();
				
				var data = new Object();
				data.m_seq = m_seq;
				data.paging = "N";
				
				$.ajax({
			        type: 'POST',
			        url: 'selectMusicList_Detail.do',
			        dataType: 'json',
			        data: JSON.stringify(data),
			        contentType: "application/json; charset=UTF-8",
			        success: function(data, status){
			        	if(data.rows.length > 0) {
			        		
			        		// img file set
		        			var src_Img_a = "images/emptyA.jpg";
		        			var src_Img_b = "images/emptyB.jpg";
		        			if(data.rows[0].img_a != "") {
		        				src_Img_a = "data:image/jpg;base64," + data.rows[0].img_a;
		        			}
		        			if(data.rows[0].img_b != "") {
		        				src_Img_b = "data:image/jpg;base64," + data.rows[0].img_b;
		        			}
			        		
			        		// album detail page url set
		        			var albumPageUrl = "";
		        			
		        			var dataDiv = "<article class='blog-post'>" +
											"<h2>" + data.rows[0].g_m_nm + " > " + data.rows[0].g_d_nm + " > " + data.rows[0].m_no + "번 앨범</h2>" +
											"<a class='comments' href='#'>" + data.records + "개 트랙</a>" +
											"<h3>" + data.rows[0].m_nm + "</h3>" +
											"<img src='" + src_Img_a + "' class='top blog-post-image' />" +
											//"<img src='" + src_Img_b + "' class='big-image-list' />" +
											"<table class='table1'>" +
											"<tbody>" +
											"<tr>" +
											"<th scope='row'>재생함</th>" +
											"<td><a id='albumCntBtn' class='button'>♬</a></td>" +
											"</tr>" +
											"<tr>" +
												"<th scope='row'>노래</th>" +
												"<td>" + data.rows[0].singer + "</td>" +
											"</tr>" +
											"<tr>" +
												"<th scope='row'>제작사</th>" +
												"<td>" + data.rows[0].product + "</td>" +
											"</tr>" +
											"<tr>" +
												"<th scope='row'>작곡</th>" +
												"<td>" + data.rows[0].music + "</td>" +
											"</tr>" +
											"<tr>" +
												"<th scope='row'>종류</th>" +
												"<td>" + data.rows[0].kind + "</td>" +
											"</tr>" +
											"<tr>" +
												"<th scope='row'>재생건</th>" +
												"<td>" + data.rows[0].playCnt + "</td>" +
											"</tr>" +
											"<tr>" +
												"<th scope='row'>재생일</th>" +
												"<td>" + data.rows[0].last_play_dt + "</td>" +
											"</tr>" +
											"<tr>" +
												"<th scope='row'>설명</th>" +
												"<td style='text-align:left;'>" + data.rows[0].ex.replace(/\r\n|\n|\r/g, '<br />') + "</td>" +
											"</tr>" +
											"</tbody>" +
											"</table>" +
											"</article>";
							var $dataDiv = $(dataDiv);
							$dataDiv.attr('id','data' + data.rows[0].m_seq);
							$("#albumHeaderInfo").append($dataDiv);
							
							$('#albumCntBtn').click(function(){
								console.log("albumCntBtn click!");
								var data = new Object();
								data.crud = "U";
								data.sqlId = "updateCountAlbum";
								data.m_seq = m_seq;
								
								$.ajax({
							        type: 'POST',
							        url: 'crudData.do',
							        dataType: 'json',
							        data: JSON.stringify(data),
							        contentType: "application/json; charset=UTF-8",
							        success: function(data, status){
							        	location.reload();
							        },
							        error: function(request, status, error) {
							        	;
							        }
								});
							});
			        	}
			        },
			        error: function(request, status, error) {
			        }
				});
			};
		</script>
	</body>
</html>