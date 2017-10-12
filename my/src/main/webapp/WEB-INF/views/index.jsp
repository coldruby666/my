<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
			    position: fixed;
			    left:0;
			    right:0;
			    top:0;
			    bottom:0;
			    background: rgba(0,0,0,0.2); /*not in ie */
			    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
			    
			}
		    .wrap-loading div{ /*로딩 이미지*/
		    	display: flex;
			    align-items: center;
			    justify-content: center;
			    height: 100%;
		    }
		    .display-none{ /*감추기*/
		        display:none;
		    }
		    
			div#g_cd_m_box {
				position: relative;
				width: 100%;
				height: 40px;
				line-height:40px;
				border:1px solid #24b3d1;
				border-radius:4px;
				text-transform:uppercase;
				background:#fff;
			}
			div#g_cd_m_box label {
			    position: absolute;
			    width: 100%;
			    font-size:.86em;
			    color:#24b3d1;
			    top:0;
			    left:0;
			    padding:0 5%;
			}
			div#g_cd_m_box label:after {
			    content:'▼';
			    width:40px;
			    height:40px;
			    position:absolute;
			    top:0;
			    right:0;
			    font-size:.76em;
			    color:#fff;
			    text-align:center;
			    background:#24b3d1;
			}
			div#g_cd_m_box select#g_cd_m {
			    width: 100%;
			    height: 40px;
			    opacity: 0;
			    filter: alpha(opacity=0)/* IE 8 */;
			}
			
			div#g_cd_d_box {
				position: relative;
				width: 100%;
				height: 40px;
				line-height:40px;
				border:1px solid #9999FF;
				border-radius:4px;
				text-transform:uppercase;
				background:#fff;
			}
			div#g_cd_d_box label {
			    position: absolute;
			    width: 100%;
			    font-size:.86em;
			    color:#9999FF;
			    top:0;
			    left:0;
			    padding:0 5%;
			}
			div#g_cd_d_box label:after {
			    content:'▼';
			    width:40px;
			    height:40px;
			    position:absolute;
			    top:0;
			    right:0;
			    font-size:.76em;
			    color:#fff;
			    text-align:center;
			    background:#9999FF;
			}
			div#g_cd_d_box select#g_cd_d {
			    position: relative;
				width: 100%;
				height: 40px;
				line-height:40px;
			    opacity: 0;
			    filter: alpha(opacity=0)/* IE 8 */;
			}
			
			div#s_div_box {
				position: relative;
				width: 100%;
				height: 40px;
				line-height:40px;
				border:1px solid #ffb075;
				border-radius:4px;
				text-transform:uppercase;
				background:#fff;
			}
			div#s_div_box label {
			    position: absolute;
			    width: 100%;
			    font-size:.86em;
			    color:#ffb075;
			    top:0;
			    left:0;
			    padding:0 5%;
			}
			div#s_div_box label:after {
			    content:'▼';
			    width:40px;
			    height:40px;
			    position:absolute;
			    top:0;
			    right:0;
			    font-size:.76em;
			    color:#fff;
			    text-align:center;
			    background:#ffb075;
			}
			div#s_div_box select#s_div {
			    position: relative;
				width: 100%;
				height: 40px;
				line-height:40px;
			    opacity: 0;
			    filter: alpha(opacity=0)/* IE 8 */;
			}
			
			#searchTxt {
			    position: relative;
			    width: 100%;
			    height: 35px;
			    font-size:.86em;
			    top:0;
			    left:0;
			    padding:0 5%;
			}
			#searchBtn {
			    position: relative;
			    width: 100%;
			    height: 35px;
			    font-size:.86em;
			    top:0;
			    left:0;
			    padding:0 5%;
			}
			
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
			
			img.left1 {
				float: left;
				margin: 2px 1.25em 0 0;
				height: 80px;
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
								<h1><a href="/my" id="logo">앨범검색</a></h1>
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
				
						<div class="row main-row">
							<div class="4u 12u(mobile)">
								<section>
									<h2>Search</h2>
									<div id="g_cd_m_box">
										<label for="g_cd_m">장르(대) : 전체</label>
										<select id="g_cd_m" title="검색할 장르 선택">
											<option value="" selected="selected">장르(대) : 전체</option>
											<option value="C">Classic</option>
											<option value="K">Korean Pop</option>
											<option value="P">Pop</option>
											<option value="J">Jazz</option>
											<option value="W">World Music</option>
										</select>
									</div>
									<div id="g_cd_d_box">
										<label for="g_cd_d">장르(소) : 전체</label>
										<select id="g_cd_d" title="검색할 장르 선택">
										<option value="" selected="selected">장르(소) : 전체</option>
										<option value="C1">Solo</option>
										<option value="C2">Chamber</option>
										<option value="K1">Concetro</option>
										<option value="P1">Passion</option>
										<option value="J1">Song</option>
										</select>
									</div>
									<div id="s_div_box">
										<label for="s_div">검색조건(앨범)</label>
										<select id="s_div" title="검색할 조회조건 선택">
										<option value="M" selected="selected">검색조건(앨범)</option>
										<option value="D">검색조건(트랙)</option>
										</select>
									</div>
									<div>
										<input type="text" id="searchTxt" />
									</div>
									<div>
										<input type="button" value="검색" id="searchBtn" />
									</div>
								</section>
						</div>
					</div>
				
					<div class="row main-row" id="result_div">
					</div>
					
					<div class="row main-row" id="result_div_grid" style="display: none">
						<div class='20u 12u(mobile)' style="width:100%;">
							<section>
								<div id="jqGrid" style="width:100%;">
									<table id="grid"></table>
									<div id="pager"></div>
								</div>
							</section>
						</div>
					</div>
					
					<div class="wrap-loading display-none">
					    <div><img src="images/icon/loading.gif" /></div>
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
			var pageCnt;
			var pageSize = 20;
			var $grid1;
			
			window.onload = function() {
				console.log("window.onload");
				makeSelectBox();
				makeSelectBox_Detail();
			};
			
			function makeResult() {
				console.log("makeResult()");
				
				$("#result_div").empty();
				$("#result_div_grid").hide();
				jQuery("#grid").jqGrid('clearGridData');
				
				if( $('#s_div option:selected').val() == 'M') {
					makeResult_Album(pageCnt);
				} else if( $('#s_div option:selected').val() == 'D') {
					makeGrid();
				}
			}
			
			//////////////////////////////////////////////////////////////////////////////////////////////
			function makeResult_Album(pCnt) {
				console.log("makeResult_Album()");
				
				var data = new Object();
				data.g_cd_m = $('#g_cd_m option:selected').val();
				data.g_cd = $('#g_cd_d option:selected').val();
				data.s_div = $('#s_div option:selected').val();
				data.searchTxt = $('#searchTxt').val();
				data.paging = "Y";
				data.pageSize = pageSize;
				data.page = pCnt;
				data.fastSelect = "Y";
				
				$.ajax({
			        type: 'POST',
			        url: 'selectMusicList.do',
			        dataType: 'json',
			        data: JSON.stringify(data),
			        contentType: "application/json; charset=UTF-8",
			        success: function(data, status){
			        	
			        	var dataCnt = data.length;
			        	
			        	if (dataCnt > 0) {
			        		$.each(data, function(index,value){
			        			console.log(index + "   " + value.m_nm);
			        			
			        			// img file set
			        			var src_Img_a = "images/emptyA.jpg";
			        			//var src_Img_b = "images/emptyB.jpg";
			        			if(value.img_a != "") {
			        				src_Img_a = "data:image/jpg;base64," + value.img_a;
			        			}
			        			//if(value.img_b != "") {
			        			//	src_Img_b = "data:image/jpg;base64," + value.img_b;
			        			//}
			        			
			        			// album detail page url set
			        			var albumPageUrl = "album.do?m_seq=" + value.m_seq;
			        			
			        			var dataDiv = "<div class='4u 12u(mobile)'>" +
												"<section>" +
												"<a href='" + albumPageUrl + "'>" +
												"<h2>" + value.m_nm + "</h2>" +
												"</a>" +
												"<ul class='small-image-list'>" +
												"<li>" +
												"<a href='" + albumPageUrl + "'>" +
												"<img src='" + src_Img_a + "' class='left1' />" +
												"</a>" +
												"<h4>" + value.singer + "</h4>" +
												"<p>" +
												/* "종류 : " + value.kind + "<br>" +
												"상태 : " + value.cond + "<br>" + */
												"작곡 : " + value.music + "<br>" +
												"연주 : " + value.player + "<br>" +
												"제작사 : " + value.product +
												"</p>" +
												"</li>" +
												"</ul>" +
												/* "<ul class='small-image-list'>" +
												"<li>" +
												"<a href='" + albumPageUrl + "'>" +
												"<img src='" + src_Img_b + "' class='left1' />" +
												"</a>" +
												"<p>" +
												"재생건:" + value.playCnt + "<br>" +
												"재생일:" + value.last_play_dt +
												"</p>" +
												"</li>" +
												"</ul>" + */
												"<footer class='controls'>" +
												"<a id='updateCountAlbum' class='button' onclick='updateCountAlbum(&quot;ALBUM&quot;," + value.m_seq + ")'>♬</a>" +
												"</footer>" +
												"</section>" +
												"</div>";
								console.log(dataDiv);
								var $dataDiv = $(dataDiv);
								$dataDiv.attr('id','data' + value.m_no);
								$("#result_div").append($dataDiv);
								
		                    });
			        		
			        		if (dataCnt < pageSize) {
			        			
			        		} else {
				        		var dataDiv = "<div id='moreDiv' class='4u 12u(mobile)'>" +
	        						"<section>" +
	        						"<h2><a id='moreBtn' class='button'>더보기</a></h2>" +
	        						"</section>" +
	        						"</div>";
	        						
        						$("#result_div").append(dataDiv);
        						
    			        		$('#moreBtn').click(function(){
    								console.log("<<<< more data search!! >>>>");
    								$('#moreDiv').remove();
    								pageCnt = pageCnt +1; 
    								makeResult_Album(pageCnt);
    							});
			        		}
			        		
			        	}
			        },
			        error: function(request, status, error) {
			        },
			        beforeSend: function() {
			        	$('.wrap-loading').removeClass('display-none');
			        },
			        complete: function() {
			        	$('.wrap-loading').addClass('display-none');
			        }
				}).done( function() {
					_sBtnObj.removeAttr('disabled');
				});
				
			}
			//////////////////////////////////////////////////////////////////////////////////////////////
			
			/* Grid - start */
			function makeGrid() {
				console.log("makeGrid()");
				
				$("#result_div_grid").show();
				
				var dataGrid = new Object();
				dataGrid.g_cd_m = $('#g_cd_m option:selected').val();
				dataGrid.g_cd = $('#g_cd_d option:selected').val();
				dataGrid.s_div = $('#s_div option:selected').val();
				dataGrid.searchTxt = $('#searchTxt').val();
				dataGrid.paging = "Y";
				dataGrid.pageSize = 15;
				dataGrid.page = 1;
				dataGrid.m_seq = "";
				
				console.log("data.g_cd_m >>>>>>>" + dataGrid.g_cd_m);
				console.log("data.g_cd >>>>>>>" + dataGrid.g_cd);
				console.log("data.s_div >>>>>>>" + dataGrid.s_div);
				console.log("data.searchTxt >>>>>>>" + dataGrid.searchTxt);
				
				$.jgrid.gridUnload('#grid');
				
				$grid1 = jQuery("#grid").jqGrid({
					url: "<c:url value='selectMusicList_Detail.do'/>",
					/* url: "selectMusicList_Detail.do", */
					datatype: 'json',
					mtype: 'POST',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
					postData: JSON.stringify(dataGrid),
					editurl: 'clientArray',
	                colModel: [
	                    {label: '장르'			,name: 'g_cd'			,width: 40			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink		,align: 'center'		,cellattr: jsFormatterCell},
	                    {label: '장르(대)'		,name: 'g_m_nm'			,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink		,align: 'center'		,cellattr: jsFormatterCell},
	                    {label: '장르(소)'		,name: 'g_d_nm'			,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink		,align: 'center'		,cellattr: jsFormatterCell},
	                    {label: 'm_seq'			,name: 'm_seq'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true		,key: true},
	                    {label: '앨범No'			,name: 'm_no'			,width: 40			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink		,align: 'center'		,cellattr: jsFormatterCell},
	                    {label: '앨범명'			,name: 'm_nm'			,width: 235			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink								,cellattr: jsFormatterCell},
	                    {label: '제작사'			,name: 'product'		,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink		,align: 'center'		,cellattr: jsFormatterCell},
	                    {label: '년도'			,name: 'year'			,width: 50			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink		,align: 'center'		,cellattr: jsFormatterCell},
	                    {label: '종류'			,name: 'kind'			,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink		,align: 'center'		,cellattr: jsFormatterCell},
	                    {label: '상태'			,name: 'cond'			,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink		,align: 'center'		,cellattr: jsFormatterCell},
	                    {label: '작곡'			,name: 'music'			,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink								,cellattr: jsFormatterCell},
	                    {label: '연주'			,name: 'player'			,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink								,cellattr: jsFormatterCell},
	                    {label: '가수'			,name: 'singer'			,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink								,cellattr: jsFormatterCell},
	                    {label: '재생건수'		,name: 'playCnt'		,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink		,align: 'center'		,cellattr: jsFormatterCell},
	                    {label: '최종재생일'		,name: 'last_play_dt'	,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink		,align: 'center'		,cellattr: jsFormatterCell},
	                    {label: 'd_seq'			,name: 'd_seq'			,width: 75			,editable: false	,edittype: 'text' 	,hidden: true		,key: true},
	                    {label: 'A/B'			,name: 'side'			,width: 30			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink		,align: 'center'},
	                    {label: 'TR'			,name: 'd_no'			,width: 20			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink		,align: 'center'},
	                    {label: '곡명'			,name: 'd_nm'			,width: 235			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink},
	                    {label: '작곡'			,name: 'music'			,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink},
	                    {label: '연주'			,name: 'd_player'		,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink},
	                    {label: '가수'			,name: 'd_singer'		,width: 90			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink},
	                    {label: '시간'			,name: 'play_time'		,width: 50			,editable: false	,edittype: 'text'	,formatter:formatter_hhmiss},
	                    {label: '비고'			,name: 'memo'			,width: 75			,editable: false	,edittype: 'text'	,formatter:formatter_pagelink},
	                    {label: '버튼'			,name: 'btn'			,width: 75			,editable: false	,edittype: 'text'	,align: 'center',cellattr: jsFormatterCell_button}
	                ],
	                width: $("#jqGrid").width(),
	                height: 'auto',
	                rowNum: 15,
	                rowList: [15],
	                rownumbers: false,
	                rownumWidth: 15,
	                shrinkToFit: false,
	                cellEdit: false,
	                cellsubmit: 'remote',
	                cellurl: 'index.jsp',
	                caption: '앨범 트랙 목록',
	                loadonce: false,
	                viewrecords: true,
	                jsonReader : {
	                    page: "page",
	                    total: "total",
	                    root: "rows", 
	                    repeatitems: false
		            },
	                gridComplete: function() {
	                    var grid = this;
	                     
	                    $('td[name="cellRowspan"]', grid).each(function() {
	                        var spans = $('td[rowspanid="'+this.id+'"]',grid).length+1;
	                        if(spans>1){
	                         $(this).attr('rowspan',spans);
	                        }
	                    });
	                },
	                pager: '#pager',
	                onPaging: function(action) {
	                	console.log("action>>>>>>>>>>>" + action);
	                	
	                	var page = $("#grid").getGridParam("page");
	                	var newPage = parseInt($(this.p.pager).find('input:text').val());
	                	console.log("page ======> " + page);
	                	console.log("newPage ======> " + newPage);
	                	
	                	var dataGrid = new Object();
	    				dataGrid.g_cd_m = $('#g_cd_m option:selected').val();
	    				dataGrid.g_cd = $('#g_cd_d option:selected').val();
	    				dataGrid.s_div = $('#s_div option:selected').val();
	    				dataGrid.searchTxt = $('#searchTxt').val();
	    				dataGrid.paging = "Y";
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
	                	
	                	$("#grid").jqGrid("setGridParam", { postData: JSON.stringify(dataGrid)}).trigger("reloadGrid");
	                },
			        loadComplete: function(data) {
	                	_sBtnObj.removeAttr('disabled');
	                }
	            });
				
				reload();
				
			}
			
			function reload() {
				jQuery("#grid").trigger('reloadGrid');
			}
			
			function formatter_pagelink(cellValue, options, rowdata, action) {
				var albumPageUrl = "album.do?m_seq=" + rowdata.m_seq;
				console.log(">>>>>>>>>>" + albumPageUrl);
				return "<a href='" + albumPageUrl + "'>" + cellValue + "</a>";
			}
			
			function formatter_hhmiss(cellValue, options, rowdata, action) {
				var html = cellValue.substr(0,2) + ":" + cellValue.substr(0 +2,2) + ":" + cellValue.substr(0 +4,2);
				return html;
			}
			
			function jsFormatterCell_button(rowid, val, rowObject, cm, rdata) {
				return "<a id='updateCountAlbum' class='button' onclick='updateCountAlbum(&quot;TRACK&quot;," + rdata.m_seq + ")'>♬</a>";
			}
			
			function updateCountAlbum( p_div, p_m_seq ) {
				console.log("<< updateAlbumCount >>" + p_m_seq);
				
				alert("앨범 카운트를 증가 합니다.");
				
				var data = new Object();
				data.crud = "U";
				data.sqlId = "updateCountAlbum";
				data.m_seq = p_m_seq;
				
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
			
			var chkcell_g_cd={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_g_m_nm={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_g_d_nm={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_m_no={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_m_nm={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_product={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_year={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_kind={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_cond={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_music={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_player={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_singer={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_playCnt={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			var chkcell_last_play_dt={cellId:undefined, chkval:undefined}; // cell roiwspan 중복체크
			
			function jsFormatterCell(rowid, val, rowObject, cm, rdata){
		        var result = "";
		        var cellId = "";
		        
		        if(cm.name == "g_cd") {
			        if(chkcell_g_cd.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_g_cd = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_g_cd.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "g_m_nm") {
			        if(chkcell_g_m_nm.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_g_m_nm = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_g_m_nm.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "g_d_nm") {
			        if(chkcell_g_d_nm.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_g_d_nm = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_g_d_nm.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "g_d_nm") {
			        if(chkcell_g_d_nm.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_g_d_nm = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_g_d_nm.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "m_no") {
			        if(chkcell_m_no.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_m_no = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_m_no.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "m_nm") {
			        if(chkcell_m_nm.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_m_nm = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_m_nm.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "product") {
			        if(chkcell_product.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_product = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_product.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "year") {
			        if(chkcell_year.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_year = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_year.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "kind") {
			        if(chkcell_kind.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_kind = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_kind.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "cond") {
			        if(chkcell_cond.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_cond = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_cond.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "music") {
			        if(chkcell_music.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_music = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_music.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "player") {
			        if(chkcell_player.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_player = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_player.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "singer") {
			        if(chkcell_singer.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_singer = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_singer.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "playCnt") {
			        if(chkcell_playCnt.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_playCnt = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_playCnt.cellId+'"'; //같을 경우 display none 처리
			        }
		        } else if(cm.name == "last_play_dt") {
			        if(chkcell_last_play_dt.chkval != val){ //check 값이랑 비교값이 다른 경우
		        		cellId = this.id + '_row_'+rowid+'-'+cm.name;
			            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
			            chkcell_last_play_dt = {cellId:cellId, chkval:val};
			        }else{
			            result = 'style="display:none"  rowspanid="'+chkcell_last_play_dt.cellId+'"'; //같을 경우 display none 처리
			        }
		        }
		        
		        return result;
		    }
			/* Grid - end */
				
			function makeSelectBox() {
				console.log("makeSelectBox()");
				
				var data = new Object();
				
				$.ajax({
			        type: 'POST',
			        url: 'selectGroupList.do',
			        dataType: 'json',
			        data: JSON.stringify(data),
			        contentType: "application/json; charset=UTF-8",
			        success: function(data, status){
			        	if(data.length > 0) {
			        		$('#g_cd_m').find("option").remove().end().append("<option value=''>장르(대) : 전체</option>");
			        		$.each(data, function(index,value){
			        			$('#g_cd_m').append("<option value='" + value.cd + "'>" + value.nm + "</option> ");
		                    });
			        		
							var select_g_cd_m = $("select#g_cd_m");
			        		select_g_cd_m.change(function(){
			        			console.log("<<m.change>>");
			        	        var select_name = $(this).children("option:selected").text();
			        	        console.log("<<m.change>> select_name => " + select_name);
			        	        $(this).siblings("label").text(select_name);
			        	    });
			        	}
			        },
			        error: function(request, status, error) {
			        	$('#g_cd_m').find("option").remove().end().append("<option value=''>장르(대) : 전체</option>");
			        }
				});
			}
				
			function makeSelectBox_Detail(cd) {
				console.log("makeSelectBox_Detail(" + cd + ")");
				
				var data = new Object();
				data.g_cd_m = $('#g_cd_m option:selected').val();
				console.log("makeSelectBox_Detail -> data.g_cd_m = " + data.g_cd_m);
				
				$.ajax({
			        type: 'POST',
			        url: 'selectGroupList_Detail.do',
			        dataType: 'json',
			        data: JSON.stringify(data),
			        contentType: "application/json; charset=UTF-8",
			        success: function(data, status){
			        	if(data.length > 0) {
			        		console.log("makeSelectBox_Detail -> success ");
			        		$('#g_cd_d').find("option").remove().end().append("<option value=''>장르(소) : 전체</option>");
			        		console.log("makeSelectBox_Detail -> 전체 ");
			        		$.each(data, function(index,value){
			        			$('#g_cd_d').append("<option value='" + value.cd + "'>" + value.nm + "</option> ");
		                    });
			        		console.log("makeSelectBox_Detail -> 값추가 ");
			        		console.log("makeSelectBox_Detail -> d 차일드 text = " + $(this).children("option:selected").text());
			        		
			        		var select_g_cd_d = $("select#g_cd_d");
			        		
			        		$('select#g_cd_d').siblings("label").text("장르(소) : 전체");
			        		
			        		select_g_cd_d.change(function(){
			        			console.log("<<d.change>>");
			        			var select_name = $(this).children("option:selected").text();
			        			console.log("<<d.change>> select_name => " + select_name);
				        	    $(this).siblings("label").text(select_name);
			        	    });
			        	}
			        },
			        error: function(request, status, error) {
			        	$('#g_cd_d').find("option").remove().end().append("<option value='' selected>장르(소) : 전체</option>");
			        }
				});
			}
			
			$("#g_cd_m").change(function(){
				console.log("<<function>> m.change():1>> m = " + $('#g_cd_m option:selected').val());
				makeSelectBox_Detail( $('#g_cd_m option:selected').val() );
				console.log("<<function>> m.change():2>> m = " + $('#g_cd_m option:selected').val());
				
				//var select_name = $('select#g_cd_d').children("option:selected").text();
			    //console.log("<<function>> m.change():3>> d = " + select_name);
			    //$('select#g_cd_d').siblings("label").text(select_name);
			});
			
			$("#g_cd_d").change(function(){
				console.log("<<function>> g_cd_d.change()");
				console.log("cd : " + $('#g_cd_d option:selected').val() );
				console.log("cd.substr(1,1) : " + $('#g_cd_d option:selected').val().substr(0,1) );
				
			    var select_name = $(this).children("option:selected").text();
			    console.log("select_name >>> " + select_name);
       	        $(this).siblings("label").text(select_name);
       	        
       	        if( $('#g_cd_d option:selected').val() != '') {
           	        $("#g_cd_m").val( $('#g_cd_d option:selected').val().substr(0,1) );
           	        var select_name = $('select#g_cd_m').children("option:selected").text();
   				    console.log("select_name >>> " + select_name);
   				    $('select#g_cd_m').siblings("label").text(select_name);	
       	        }
			});
			
			$("#s_div").change(function(){
				console.log("s_div.change()");
				var select_name = $('select#s_div').children("option:selected").text();
			    console.log("select_name >>> " + select_name);
			    $('select#s_div').siblings("label").text(select_name);
			});
			
			var _sBtnObj;
			$("#searchBtn").click(function(){
				console.log("searchBtn.click()");
				console.log("g_cd_m : " + $('#g_cd_m option:selected').val() );
				console.log("g_cd : " + $('#g_cd_d option:selected').val() );
				console.log("s_div : " + $('#s_div option:selected').val() );
				console.log("searchTxt : " + $('#searchTxt').val() );
				
				_sBtnObj = $(this);
				_sBtnObj.attr('disabled', 'disabled');
				
				pageCnt = 1;
				makeResult();
			});
		</script>
	</body>
</html>