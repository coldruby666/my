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
		    
			#myProgress {
			    width: 100%;
			    background-color: grey;
			}
			#myBar {
			    width: 1%;
			    height: 30px;
			    background-color: green;
			}
			/* If you want the label inside the progress bar */
			#label {
			    text-align: center; /* If you want to center it */
			    line-height: 30px; /* Set the line-height to the same as the height of the progress bar container, to center it vertically */
			    color: white;
			}

			#txt_import_dir{ width: 400px }
			
/*-----------------*/
table.contacts
{ width: 466px;
background-color: #fafafa;
border: 1px #000000 solid;
border-collapse: collapse;
border-spacing: 0px; }


td.contactDept
{ background-color: #99CCCC;
border: 1px #000000 solid;
font-family: Verdana;
font-weight: bold;
font-size: 12px;
color: #404040;
text-align: center;
vertical-align: middle; }


td.contact
{ border-bottom: 1px #6699CC dotted;
text-align: left;
font-family: Verdana, sans-serif, Arial;
font-weight: normal;
font-size: .7em;
color: #404040;
background-color: #fafafa;
padding-top: 4px;
padding-bottom: 4px;
padding-left: 8px;
padding-right: 0px; }

.selected
{ background-color: brown;
color: #FFF; }

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
		</style>
	</head>
	<body>
		<div id="page-wrapper">
			<div id="header-wrapper">
				<div class="container">
					<div class="row">
						<div class="12u">

							<header id="header">
								<h1><a href="/my" id="logo">백업/복구</a></h1>
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
								
								<input type="text" id="txt_import_dir" value="" readonly />
								<button id="btn_import" class="w3-btn w3-white w3-border w3-border-blue w3-round">복구</button>
								<button id="btn_add" class="w3-btn w3-white w3-border w3-border-blue w3-round">추가</button>
								<table class='contacts' cellspacing='0' summary='Contacts template'>
									<tr>
										<td class='contactDept' colspan='2'>복구 폴더 리스트</td>
									</tr>
								</table>
								<div id="folderList" style="width:600px; height:200px; overflow:auto">
								</div>
								
								<br>
								<br>
								<br>
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
								<button id="btn_export" class="w3-btn w3-white w3-border w3-border-blue w3-round">백업</button>
								백업 폴더의 오늘일자+시간 폴더에 생성됨
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
			var $grid1;
			var selrowNum = 0;
			var lastsel2;
			var importFolderName = "";

			function highlightRow(obj){
				console.log("highlightRow()");

 				if ($(obj).find("td[name='checkResult']").text() != "복구 가능.") {
					alert("복구가 불가능한 폴더를 선택할 수 없습니다.");
					return;
				}
				
				//clear
				var parObj = $(obj).parent();
				parObj.find("td").css ("background-color", "#fafafa");
				
				$(obj).find("td").css ("background-color", "#FF6600");
				importFolderName = $(obj).find("td[name='dirName']").text();
				console.log(importFolderName);
				$("input[type='text'][id='txt_import_dir']").prop("value", importFolderName );
			}
			
			window.onload = function() {
				console.log("window.onload");
				makeSelectBox();
				getBackupFolderList();
			};
			
			function getBackupFolderList() {
				console.log("getBackupFolderList()");
				
				var data = new Object();
				$.ajax({
					type : 'POST',
					url : 'showBackupFolderList.do',
					dataType : 'json',
					data : JSON.stringify(data),
					contentType : "application/json; charset=UTF-8",
					success : function(data, status) {
						if (data.length > 0) {
							
 							var strTableHeader = "<table id='listTb' class='contacts' cellspacing='0' summary='Contacts template'>";
							var strTablefooter = "</table>";
							var strHtml = strTableHeader;
							
							$.each(data, function(index,value){
								//console.log(">>>>>>>>>" + value.dirName);
								//console.log(">>>>>>>>>" + value.checkResult);
								strHtml = strHtml +
											"<tr onclick='highlightRow(this)'>" +
											"<td class='contact' width='60%' name='dirName'>" + value.dirName + "</td>" +
											"<td class='contact' width='40%' name='checkResult'>" + value.checkResult + "</td>" +
											"</tr>";
							});
							
							strHtml = strHtml + strTablefooter;
							//console.log(">>>>>"+strHtml);
							var $strHtml = $(strHtml);
							$("#folderList").append ($strHtml);
							
						}
					},
					error : function(request, status, error) {
						alert("백업 폴더 읽기 오류!");
					}
				});
			}
			
			$('.contact tr').click(function() {
				$(this).toggleClass("clicked");
		    });

			$("#btn_import").on("click", function(e) {
				console.log("btn_import.click()");

				e.stopPropagation();
				console.log("$$$$" + $("input[type='text'][id='txt_import_dir']").val());
				if ($("input[type='text'][id='txt_import_dir']").val() == "") {
					alert("복구할 폴더를 선택하세요");
					return;
				}

				var _this = $(this);
				_this.attr('disabled', 'disabled');
				
				var r = confirm("정말로 복구를 하시겠습니까?\n기존 자료는 모두 삭제 됩니다.\n복구를 안하셨다면 복구를 해주세요");
				if (r == false) {
					_this.removeAttr('disabled');
					return;
				}
				
				var data = new Object();
				data.txt_import_dir = $('#txt_import_dir').val();

				$.ajax({
					type : 'POST',
					url : 'xls_import.do',
					dataType : 'json',
					data : JSON.stringify(data),
					contentType : "application/json; charset=UTF-8",
					success : function(data, status) {
						alert("excel import success!");
					},
					error : function(request, status, error) {
						alert("excel import error!");
					},
					beforeSend : function() {
						$('.wrap-loading').removeClass('display-none');
					},
					complete : function() {
						$('.wrap-loading').addClass('display-none');
					}
				}).done(function() {
					_this.removeAttr('disabled');
				});

			});
			
			$("#btn_add").on("click", function(e) {
				console.log("btn_add.click()");

				e.stopPropagation();
				console.log("$$$$" + $("input[type='text'][id='txt_import_dir']").val());
				if ($("input[type='text'][id='txt_import_dir']").val() == "") {
					alert("추가할 폴더를 선택하세요");
					return;
				}

				var _this = $(this);
				_this.attr('disabled', 'disabled');
				
				var r = confirm("추가를 하시겠습니까?\n");
				if (r == false) {
					_this.removeAttr('disabled');
					return;
				}
				
				var data = new Object();
				data.txt_import_dir = $('#txt_import_dir').val();

				$.ajax({
					type : 'POST',
					url : 'xls_add.do',
					dataType : 'json',
					data : JSON.stringify(data),
					contentType : "application/json; charset=UTF-8",
					success : function(data, status) {
						alert("excel import success!");
					},
					error : function(request, status, error) {
						alert("excel import error!");
					},
					beforeSend : function() {
						$('.wrap-loading').removeClass('display-none');
					},
					complete : function() {
						$('.wrap-loading').addClass('display-none');
					}
				}).done(function() {
					_this.removeAttr('disabled');
				});

			});

			$("#btn_export").on("click", function(e) {
				console.log("btn_export.click()");

				e.stopPropagation();

				var _this = $(this);
				_this.attr('disabled', 'disabled');
				
				var r = confirm("백업를 하시겠습니까?\n위치 : C:/myMusicWeb/backup_xls/년월일_시분초_장르코드");
				if (r == false) {
					_this.removeAttr('disabled');
					return;
				}

				// mobile export cut
				var filter = "win16|win32|win64|mac|macintel";
				if (navigator.platform) {
					if (filter.indexOf(navigator.platform
							.toLowerCase()) < 0) {
						alert("모바일에서 백업 실행 시에도 PC 백업폴더에 저장됩니다.");
					}
				}

				var data = new Object();
				data.g_cd_m = $('#g_cd_m option:selected').val();

				$.ajax({
					type : 'POST',
					url : 'xls_export.do',
					dataType : 'json',
					data : JSON.stringify(data),
					contentType : "application/json; charset=UTF-8",
					success : function(data,status) {
						alert("excel import success!");
					},
					error : function(request,status, error) {
						alert("excel import error!");
					},
					beforeSend : function() {
						$('.wrap-loading').removeClass('display-none');
					},
					complete : function() {
						$('.wrap-loading').addClass('display-none');
					}
				}).done(function() {
					_this.removeAttr('disabled');
				});
			});
			
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
		</script>
	</body>
</html>