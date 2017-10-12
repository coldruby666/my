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
		
		<style type="text/css">
			#addBtn,
			#editBtn
			{
			    position: relative;
			    width: 100%;
			    height: 35px;
			    font-size:.86em;
			    top:0;
			    left:0;
			    padding:0 5%;
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
								<h1><a href="/my" id="logo">앨범관리</a></h1>
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
								<div id="jqGrid_m" style="width:100%;">
									<table id="grid_m"></table>
									<div id="pager_m"></div>
								</div>
								<input type="button" value="앨범추가" id="addBtn" />
								<input type="button" value="앨범수정" id="editBtn" />
							</section>
						</div>
						<div class='6u 12u(mobile)'>
							<section>
								<div id="jqGrid_d" style="width:100%;">
									<table id="grid_d"></table>
									<div id="pager_d"></div>
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
			
			var $grid_m1;
			var $grid_d1;
			var _m_seq;
			var d_rowdata;
			var _editBtn = $("#editBtn");
		
			window.onload = function() {
				console.log("window.onload");
				
				_editBtn.attr('disabled', 'disabled');
				
				makeGrid_m();
				makeGrid_d();
				
			};
			
			function makeGrid_m() {
				console.log("makeGrid_m()");
				
				var data = new Object();
				data.g_cd_m = "";
				data.g_cd = "";
				data.s_div = "";
				data.searchTxt = "";
				data.paging = "Y";
				data.fastSelect = "Y";
				data.page = 1;
				data.pageSize = 15;
				
				
				$grid_m1 = jQuery("#grid_m").jqGrid({
					url: "<c:url value='selectMusicList_Grid.do'/>",
					editurl: "<c:url value='crudData.do'/>",
					datatype: 'json',
					mtype: 'POST',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
					ajaxRowOptions: { contentType: "application/json; charset=utf-8" },
					postData: JSON.stringify(data),
					colModel: [
	                    {label: '장르'			,name: 'g_cd'			,width: 35			,editable: false	,edittype: 'text'			,align: 'center'	,frozen: true	},
	                    {label: 'm_seq'			,name: 'm_seq'			,width: 75			,editable: false	,edittype: 'text' 			,hidden: true		,frozen: true	},
	                    {label: '앨범No'			,name: 'm_no'			,width: 35			,editable: false	,edittype: 'text'			,align: 'center'	,frozen: true	},
	                    {label: '앨범명'			,name: 'm_nm'			,width: 235			,editable: false	,edittype: 'text'								,frozen: true	},
	                    {label: '작곡'			,name: 'music'			,width: 75			,editable: false	,edittype: 'text'									},
	                    {label: '연주'			,name: 'player'			,width: 75			,editable: false	,edittype: 'text'									},
	                    {label: '가수'			,name: 'singer'			,width: 75			,editable: false	,edittype: 'text'									},
	                    {label: '제작사'			,name: 'product'		,width: 75			,editable: false	,edittype: 'text'			,align: 'center'		},
	                    {label: '년도'			,name: 'year'			,width: 50			,editable: false	,edittype: 'text'			,align: 'center'		},
	                    {label: '종류'			,name: 'kind'			,width: 75			,editable: false	,edittype: 'text'			,align: 'center'		},
	                    {label: '상태'			,name: 'cond'			,width: 75			,editable: false	,edittype: 'text'			,align: 'center'		},
	                    {label: '재생건수'		,name: 'playCnt'		,width: 75			,editable: false	,edittype: 'text'			,align: 'center'		},
	                    {label: '최종재생일'		,name: 'last_play_dt'	,width: 75			,editable: false	,edittype: 'text'			,align: 'center'		}
	                ],
	                width: $("#jqGrid_m").width(),
	                height: 'auto',
	                rowNum: 15,
	                rowList: [15],
	                rownumbers: true,
	                rownumWidth: 15,
	                shrinkToFit: false,
	                sortorder: 'desc',
	                caption: '앨범',
	                loadonce: false,
	                viewrecords: true,
	                pager: '#pager_m',
	                onPaging: function(action) {
	                	console.log("action>>>>>>>>>>>" + action);
	                	
	                	_editBtn.attr('disabled', 'disabled');
	                	_m_seq = "x";
	                	
	                	var page = $("#grid_m").getGridParam("page");
	                	var newPage = parseInt($(this.p.pager).find('input:text').val());
	                	console.log("page ======> " + page);
	                	console.log("newPage ======> " + newPage);
	                	
	                	var dataGrid = new Object();
	    				dataGrid.g_cd_m = "";
	    				dataGrid.g_cd = "";
	    				dataGrid.s_div = "";
	    				dataGrid.searchTxt = "";
	    				dataGrid.paging = "Y";
	    				dataGrid.fastSelect = "Y";
	    				dataGrid.pageSize = 15;
	    				//dataGrid.page = page;
	    				dataGrid.m_seq = "";
	    				
	                	if( 'next' == action ) {
	                		page++;
	                	} else if( 'last' == action ) {
	                		page = parseInt($(this).getGridParam("lastpage"));
	                	} else if( 'prev' == action ) {
	                		page--;
	                	} else if( 'first' == action ) {
	                		page = 1;
	                	} else if( 'user' == action ) {
	                		page = newPage;
	                	}
	                	dataGrid.page = page;
	                	
	                	console.log("dataGrid.page >>>>> " + dataGrid.page);
	                	console.log("page++ >>>>> " + page++);
	                	
	                	$("#grid_m").jqGrid("setGridParam", { postData: JSON.stringify(dataGrid)}).trigger("reloadGrid");
	                },
	                onSelectRow: function(rowid, status, e) {
	                	console.log("<<onSelectRow event>>");
	                	
	                	_editBtn.removeAttr('disabled');
	                	
	                	var rowdata = $('#grid_m').getRowData(rowid);
	                	_m_seq = rowdata.m_seq;
	                	
	                	var dataGrid = new Object();
	                	dataGrid.m_seq = _m_seq;
	                	dataGrid.paging = "N";
	                	
	                	d_rowdata = new Object();
	                	d_rowdata.m_seq = _m_seq;
	                	$("#grid_d").jqGrid("setGridParam", { postData: JSON.stringify(dataGrid)}).trigger("reloadGrid");
	                }
	            });
				
				$("#grid_m").jqGrid('navGrid', '#pager_m',
						// navGrid options
						{edit: false, add: false},
						// edit options
						{
						},
						// add options
						{
						},
						// del options
						{
							caption: "정말로 삭제를 하시겠습니까?\n트랙 자료는 모두 삭제 됩니다.",
							reloadAfterSubmit:true,
							mtype: "POST",
							ajaxDelOptions: { contentType: 'application/json; charset=utf-8' },
							serializeDelData: function(postdata) {
								
								var rowdata = $('#grid_m').getRowData(postdata.id);
								var data = new Object();
								data.crud = "D";
								data.sqlId = "deleteM";
								data.m_seq = parseInt(_m_seq);
								
								console.log("<<delete>>");
								console.log("data.sqlId => " + data.sqlId);
								console.log("data.m_seq => " + data.m_seq);
					            return JSON.stringify(data);
					        },
					        afterComplete: function() {
					        	$("#grid_d").jqGrid('clearGridData');
					        }
						},
						// search options
						{}
				);
				
				reload_m();

			}
			
			function reload_m() {
				jQuery("#grid_m").trigger('reloadGrid');
			}
			
			function makeGrid_d() {
				console.log("makeGrid_d()");
				
				var data = new Object();
				data.m_seq = "0";
				data.paging = "N";
				
				$grid_d1 = jQuery("#grid_d").jqGrid({
					url: "<c:url value='selectMusicList_Detail.do'/>",
					editurl: "<c:url value='crudData.do'/>",
					datatype: 'json',
					mtype: 'POST',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
					ajaxRowOptions: { contentType: "application/json; charset=utf-8" },
					postData: JSON.stringify(data),
					colModel: [
						{label: 'm_seq'			,name: 'm_seq'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'd_seq'			,name: 'd_seq'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true},
	                    {label: 'A/B'			,name: 'side'			,width: 30			,editable: true		,edittype: 'text'	,align: 'center'	,editoptions:{maxlength: 1}},
	                    {label: 'TR'			,name: 'd_no'			,width: 20			,editable: true		,edittype: 'text'	,align: 'center'	,editoptions:{maxlength: 10}},
	                    {label: '곡명'			,name: 'd_nm'			,width: 235			,editable: true		,edittype: 'text'	,editoptions:{maxlength: 1000}},
	                    {label: '작곡'			,name: 'music'			,width: 75			,editable: true		,edittype: 'text'	,editoptions:{maxlength: 50}},
	                    {label: '연주'			,name: 'd_player'		,width: 75			,editable: true		,edittype: 'text'	,editoptions:{maxlength: 50}},
	                    {label: '가수'			,name: 'd_singer'		,width: 90			,editable: true		,edittype: 'text'	,editoptions:{maxlength: 50}},
	                    {label: '시간'			,name: 'play_time'		,width: 50			,editable: true		,edittype: 'text'	,editoptions:{maxlength: 6} }
	                ],
	                width: $("#jqGrid_d").width(),
	                height: 'auto',
	                rowNum: 1000,
	                rowList: [1000],
	                rownumbers: true,
	                rownumWidth: 15,
	                shrinkToFit: false,
	                sortorder: 'desc',
	                caption: '트랙',
	                loadonce: false,
	                viewrecords: true,
	                pager: '#pager_d',
	                onSelectRow: function(rowid, status, e) {
	                	console.log("<<onSelectRow event>>");
	                	d_rowdata = $('#grid_d').getRowData(rowid);
						console.log("d_rowdata.m_seq => " + d_rowdata.m_seq);
						console.log("d_rowdata.d_seq => " + d_rowdata.d_seq);
						console.log("d_rowdata.d_no => " + d_rowdata.d_no);
						console.log("d_rowdata.side => " + d_rowdata.side);
						console.log("d_rowdata.d_nm => " + d_rowdata.d_nm);
						console.log("d_rowdata.music => " + d_rowdata.music);
						console.log("d_rowdata.player => " + d_rowdata.d_player);
						console.log("d_rowdata.singer => " + d_rowdata.d_singer);
						console.log("d_rowdata.play_time => " + d_rowdata.play_time);
	                }
	            });
				
				$("#grid_d").jqGrid('navGrid', '#pager_d',
						{},
						// edit options
						{
							height:350,
							reloadAfterSubmit:true,
							recreateForm: true,
							mtype: "POST",
							ajaxEditOptions: { contentType: 'application/json; charset=utf-8' },
							serializeEditData: function(postdata) {
								var data = new Object();
								data.crud = "U";
								data.sqlId = "updateD";
								data.m_seq = d_rowdata.m_seq;
								data.d_seq = d_rowdata.d_seq;
								data.d_no = postdata.d_no;
								data.side = postdata.side;
								data.d_nm = postdata.d_nm;
								data.music = postdata.music;
								data.player = postdata.d_player;
								data.singer = postdata.d_singer;
								data.play_time = postdata.play_time;
								
								console.log("<<update>>");
								console.log("data.sqlId => " + data.sqlId);
								console.log("data.m_seq => " + data.m_seq);
								console.log("data.d_seq => " + data.d_seq);
								console.log("data.d_no => " + data.d_no);
								console.log("data.side => " + data.side);
								console.log("data.d_nm => " + data.d_nm);
								console.log("data.music => " + data.music);
								console.log("data.player => " + data.d_player);
								console.log("data.singer => " + data.d_singer);
								console.log("data.play_time => " + data.play_time);
					            return JSON.stringify(data);
					        }
						},
						// add options
						{
							height:350,
							reloadAfterSubmit:true,
							mtype: "POST",
							ajaxEditOptions: { contentType: 'application/json; charset=utf-8' },
							serializeEditData: function(postdata) {
								var data = new Object();
								data.crud = "C";
								data.sqlId = "insertD";
								data.m_seq = d_rowdata.m_seq;
								data.d_seq = "";
								data.d_no = postdata.d_no;
								data.side = postdata.side;
								data.d_nm = postdata.d_nm;
								data.music = postdata.music;
								data.player = postdata.d_player;
								data.singer = postdata.d_singer;
								data.play_time = postdata.play_time;
								
								console.log("<<insert>>");
								console.log("data.sqlId => " + data.sqlId);
								console.log("data.m_seq => " + data.m_seq);
								console.log("data.d_seq => " + data.d_seq);
								console.log("data.d_no => " + data.d_no);
								console.log("data.side => " + data.side);
								console.log("data.d_nm => " + data.d_nm);
								console.log("data.music => " + data.music);
								console.log("data.player => " + data.d_player);
								console.log("data.singer => " + data.d_singer);
								console.log("data.play_time => " + data.play_time);
					            return JSON.stringify(data);
					        }
						},
						// del options
						{
							reloadAfterSubmit:true,
							mtype: "POST",
							ajaxDelOptions: { contentType: 'application/json; charset=utf-8' },
							serializeDelData: function(postdata) {
								var data = new Object();
								data.crud = "D";
								data.sqlId = "deleteD";
								data.m_seq = d_rowdata.m_seq;
								data.d_seq = d_rowdata.d_seq;
								
								console.log("<<delete>>");
								console.log("data.sqlId => " + data.sqlId);
								console.log("data.m_seq => " + data.m_seq);
								console.log("data.d_seq => " + data.d_seq);
					            return JSON.stringify(data);
					        }
						},
						{} // search options
				);
				
				reload_d();

			}
			
			function reload_d() {
				jQuery("#grid_d").trigger('reloadGrid');
			}
			
			function crud(param) {
				console.log("<< crud >>" + param);
				
				var editData = new Object();
				editData.crud = "U";
				editData.sqlId = "updateCountAlbum";
				editData.m_seq = p_m_seq;
				
				$.ajax({
			        type: 'POST',
			        url: 'crudData.do',
			        dataType: 'json',
			        data: JSON.stringify(data),
			        contentType: "application/json; charset=UTF-8",
			        success: function(data, status){
			        	if(p_div == 'ALBUM') {
			        		makeResult();
			        	}
			        },
			        error: function(request, status, error) {
			        	;
			        }
				});
			}
			
			$("#addBtn").click(function(){
				console.log("addBtn.click()");
				window.location.href = "album_edit_data.do?m_seq=";
			});
			
			$("#editBtn").click(function(){
				console.log("editBtn.click()");
				window.location.href = "album_edit_data.do?m_seq=" + _m_seq;
			});
			
		</script>
	</body>
</html>