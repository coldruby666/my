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
		<link rel="stylesheet" type="text/css" href="css/w3.css">
	</head>
	<body>
		<div id="page-wrapper">
			<div id="header-wrapper">
				<div class="container">
					<div class="row">
						<div class="12u">

							<header id="header">
								<h1><a href="/my" id="logo">코드관리</a></h1>
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
			<div id="main">
				<div class="container">
				
					<div class="row main-row" id="result_div">
						<div class='6u 12u(mobile)'>
							<section>
								<!-- <button id="btn_e" class="w3-btn w3-white w3-border w3-border-blue w3-round">수정</button>
								<button id="btn_s" class="w3-btn w3-white w3-border w3-border-blue w3-round">저장</button>
								<button id="btn_c" class="w3-btn w3-white w3-border w3-border-blue w3-round">수정취소</button> -->
								<div id="jqGrid" style="width:100%;">
									<table id="grid"></table>
									<div id="pager"></div>
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
			
			var $grid1;
		
			window.onload = function() {
				console.log("window.onload");
				
				makeGrid();
				
			};
			
			function makeGrid() {
				console.log("makeGrid()");
				
				var data = new Object();
				
				$grid1 = jQuery("#grid").jqGrid({
					url: "<c:url value='selectCodeList.do'/>",
					editurl: "<c:url value='crudData.do'/>",
					datatype: 'json',
					mtype: 'POST',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
					ajaxRowOptions: { contentType: "application/json; charset=utf-8" },
					postData: JSON.stringify(data),
					colModel: [
	                    {label: '관리명'			,name: 'cd_nm'		,width: 75			,editable: true		,edittype: 'text' 	,align: 'center'},
	                    {label: '관리명순번'		,name: 'cd_seq'		,width: 75			,editable: true		,edittype: 'text'},
	                    {label: '코드'			,name: 'cd'			,width: 75			,editable: true		,edittype: 'text'	,align: 'center'},
	                    {label: '코드명'			,name: 'nm'			,width: 75			,editable: true		,edittype: 'text'}
	                ],
	                width: $("#jqGrid").width(),
	                height: (15*25),
	                rowNum: 1000,
	                rowList: [1000],
	                rownumbers: true,
	                rownumWidth: 15,
	                shrinkToFit: false,
	                sortorder: 'desc',
	                caption: '코드목록',
	                loadonce: false,
	                viewrecords: true,
	                pager: '#pager'
	            });
				
				$("#grid").jqGrid('navGrid', '#pager',
						{search:false},
						// edit options
						{
							height:280,
							reloadAfterSubmit:true,
							recreateForm: true,
							mtype: "POST",
							ajaxEditOptions: { contentType: 'application/json; charset=utf-8' },
							serializeEditData: function(postdata) {
								var data = new Object();
								data.crud = "U";
								data.sqlId = "updateCode";
								data.cd_nm = postdata.cd_nm;
								data.cd_seq = parseInt(postdata.cd_seq);
								data.cd = postdata.cd;
								data.nm = postdata.nm;
								console.log("<<update>>");
								console.log("data.sqlId => " + data.sqlId);
								console.log("data.cd_nm => " + data.cd_nm);
								console.log("data.cd_seq => " + data.cd_seq);
								console.log("data.cd => " + data.cd);
								console.log("data.nm => " + data.nm);
					            return JSON.stringify(data);
					        },
					        beforeShowForm: function(form) {
					            $('#cd_nm', form).attr("readonly", 'readonly');
					            $('#cd_seq', form).attr("readonly", 'readonly');
					        }
						},
						// add options
						{
							height:280,
							reloadAfterSubmit:true,
							mtype: "POST",
							ajaxEditOptions: { contentType: 'application/json; charset=utf-8' },
							serializeEditData: function(postdata) {
								var data = new Object();
								data.crud = "C";
								data.sqlId = "insertCode";
								data.cd_nm = postdata.cd_nm;
								data.cd_seq = parseInt(postdata.cd_seq);
								data.cd = postdata.cd;
								data.nm = postdata.nm;
								console.log("<<insert>>");
								console.log("data.sqlId => " + data.sqlId);
								console.log("data.cd_nm => " + data.cd_nm);
								console.log("data.cd_seq => " + data.cd_seq);
								console.log("data.cd => " + data.cd);
								console.log("data.nm => " + data.nm);
					            return JSON.stringify(data);
					        }
						},
						// del options
						{
							reloadAfterSubmit:true,
							mtype: "POST",
							ajaxDelOptions: { contentType: 'application/json; charset=utf-8' },
							serializeDelData: function(postdata) {
								var rowdata = $('#grid').getRowData(postdata.id);
								var data = new Object();
								data.crud = "D";
								data.sqlId = "deleteCode";
								data.cd_nm = rowdata.cd_nm;
								data.cd_seq = parseInt(rowdata.cd_seq);
								console.log("<<delete>>");
								console.log("data.sqlId => " + data.sqlId);
								console.log("data.cd_nm => " + data.cd_nm);
								console.log("data.cd_seq => " + data.cd_seq);
								console.log("data.cd => " + data.cd);
								console.log("data.nm => " + data.nm);
					            return JSON.stringify(data);
					        }
						},
						// search options
						{}
				);
				
				reload();

			}
			
			function reload() {
				jQuery("#grid").trigger('reloadGrid');
			}
			
		</script>
	</body>
</html>