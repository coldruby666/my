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
			.m_no {
				font-weight:bold;
				background-color: #ffffff;
				display: none;
			}
		
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
		    
.paper {
  background: #fff;
  padding: 30px;
  position: relative;
  width: 700px;
}

.paper,
.paper::before,
.paper::after {
  /* Styles to distinguish sheets from one another */
  box-shadow: 1px 1px 1px rgba(0,0,0,0.25);
  border: 1px solid #bbb;
}

.paper::before,
.paper::after {
  content: "";
  position: absolute;
  height: 95%;
  width: 99%;
  background-color: #eee;
}

.paper::before {
  right: 15px;
  top: 0;
  transform: rotate(-1deg);
  z-index: -1;
}

.paper::after {
  top: 5px;
  right: -5px;
  transform: rotate(1deg);
  z-index: -2;
}



.form-style-2{
    max-width: 700px;
    padding: 20px 12px 10px 20px;
    font: 13px Arial, Helvetica, sans-serif;
}
.form-style-2-heading{
    font-weight: bold;
    font-style: italic;
    border-bottom: 2px solid #ddd;
    margin-bottom: 20px;
    font-size: 15px;
    padding-bottom: 3px;
}
.form-style-2 label{
    display: block;
    margin: 0px 0px 15px 0px;
}
.form-style-2 label > span{
    width: 100px;
    font-weight: bold;
    float: left;
    padding-top: 8px;
    padding-right: 5px;
}
.form-style-2 span.required{
    color:red;
}
.form-style-2 .tel-number-field{
    width: 40px;
    text-align: center;
}
.form-style-2 .year-number-field{
    width: 60px;
    text-align: center;
}
.form-style-2 input.input-field{
    width: 48%;
}
.form-style-2 .input-8-field{
    width: 80px;
    text-align: center;
}

.form-style-2 input.input-field, 
.form-style-2 .tel-number-field,
.form-style-2 .year-number-field,
.form-style-2 .input-8-field,
.form-style-2 .textarea-field, 
 .form-style-2 .select-field{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    border: 1px solid #C2C2C2;
    box-shadow: 1px 1px 4px #EBEBEB;
    -moz-box-shadow: 1px 1px 4px #EBEBEB;
    -webkit-box-shadow: 1px 1px 4px #EBEBEB;
    border-radius: 3px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    padding: 7px;
    outline: none;
}
.form-style-2 .input-field:focus, 
.form-style-2 .tel-number-field:focus,
.form-style-2 .year-number-field:focus,
.form-style-2 .input-8-field:focus,
.form-style-2 .textarea-field:focus,  
.form-style-2 .select-field:focus{
    border: 1px solid #0C0;
}
.form-style-2 .textarea-field{
    height:100px;
    width: 80%;
}
.form-style-2 input[type=submit],
.form-style-2 input[type=button]{
    border: none;
    padding: 8px 15px 8px 15px;
    background: #FF8500;
    color: #fff;
    box-shadow: 1px 1px 4px #DADADA;
    -moz-box-shadow: 1px 1px 4px #DADADA;
    -webkit-box-shadow: 1px 1px 4px #DADADA;
    border-radius: 3px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
}
.form-style-2 input[type=submit]:hover,
.form-style-2 input[type=button]:hover{
    background: #EA7B00;
    color: #fff;
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
				
					<div class="paper">
						<div class="form-style-2">
							<div class="form-style-2-heading">앨범 정보</div>
							<form id ="alubmForm" method="POST" action="mergeAlbumData.do">
								<label for="field1">
									<span>카테고리<span class="required">*</span></span>
									<select id="g_cd" name="g_cd" class="select-field">
										<option value="General Question">General</option>
										<option value="Advertise">Advertisement</option>
										<option value="Partnership">Partnership</option>
									</select>
								</label>
								<label for="field2">
									<span>앨범번호<span class="required">(자동)</span></span>
									<input type="text" class="input-8-field" id="m_no" name="m_no" readonly />
								</label>
								<label for="field3">
									<span>앨범명<span class="required">*</span></span>
									<input type="text" class="input-field" id="m_nm" name="m_nm" />
								</label>
								<label for="field4">
									<span>제작사</span>
									<input type="text" class="input-field" id="product" name="product" maxlength="50"/>
								</label>
								<label for="field5">
									<span>발행년도</span>
									<input type="text" class="year-number-field" id="year" name="year" maxlength="4" />
								</label>
								<label for="field6">
									<span>이미지(앞)</span>
									<img id="img_a" width="150" height="150" />
									<input type="file" class="input-field" id="input_img_a" accept="image/*" onChange="img_pathUrl('img_a',this);" />
								</label>
								<label for="field7">
									<span>이미지(뒤)</span>
									<img id="img_b" width="150" height="150" />
									<input type="file" class="input-field" id="input_img_b" accept="image/*" onChange="img_pathUrl('img_b',this);" />
								</label>
								<label for="field8">
									<span>종류</span>
									<select id="kind" name="kind" class="select-field">
										<option value="General Question">General</option>
										<option value="Advertise">Advertisement</option>
										<option value="Partnership">Partnership</option>
									</select>
								</label>
								<label for="field9">
									<span>상태</span>
									<select id="cond" name="cond" class="select-field">
										<option value="General Question">General</option>
										<option value="Advertise">Advertisement</option>
										<option value="Partnership">Partnership</option>
									</select>
								</label>
								<label for="field10">
									<span>작곡</span>
									<input type="text" class="input-field" id="music" name="music" maxlength="50"/>
								</label>
								<label for="field11">
									<span>연주</span>
									<input type="text" class="input-field" id="player" name="player" maxlength="50"/>
								</label>
								<label for="field12">
									<span>가수</span>
									<input type="text" class="input-field" id="singer" name="singer" maxlength="50"/>
								</label>
								<label for="field13">
									<span>재생건수</span>
									<input type="text" class="input-8-field" id="playCnt" name="playCnt" maxlength="10"/>
								</label>
								<label for="field14">
									<span>최종재생일</span>
									<input type="text" class="input-8-field" id="last_play_dt" name="last_play_dt" maxlength="8" />
								</label>
								<label for="field15">
									<span>설명</span>
									<textarea id="ex" name="ex" class="textarea-field" maxlength="5000"></textarea>
								</label>
								<label for="field16">
									<span>비고</span>
									<textarea id="memo" name="memo" class="textarea-field" maxlength="1000"></textarea>
								</label>
								<label>
									<span>&nbsp;</span>
									<input id="saveBtn" type="submit" value="저장" />
								</label>
							</form>
						</div>
					</div>

					<div class="wrap-loading display-none">
					    <div><img src="images/icon/loading.gif" /></div>
					</div>

<canvas id="imgCanvas" />

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
		
			var _m_seq = "${m_seq}";
			
			console.log("jsp >> _m_seq = " + _m_seq);
		
			window.onload = function() {
				console.log("window.onload");
				
				make_g_cd();
				//make_kind();
				//make_cond();
				
				if (_m_seq == "") {
					_m_seq = "X";
				}
				
				//setFormData();
			};
			
			function make_g_cd() {
				
				var data = new Object();
				data.g_cd_m = "";
				
				$.ajax({
			        type: 'POST',
			        url: 'selectGroupList_Detail.do',
			        dataType: 'json',
			        data: JSON.stringify(data),
			        contentType: "application/json; charset=UTF-8",
			        success: function(data, status){
			        	if(data.length > 0) {
			        		var obj = $('#g_cd');
			        		obj.find("option").remove();
			        		$.each(data, function(index,value){
			        			obj.append("<option value='" + value.cd + "'>" + value.nm + "</option> ");
		                    });
			        		make_kind();
			        	}
			        },
			        error: function(request, status, error) {
			        }
				});
			}
			
			function make_kind() {
				
				var data = new Object();
				data.sqlId = "selectCdData";
				data.cd_nm = "음반구분";
				
				$.ajax({
			        type: 'POST',
			        url: 'selectData.do',
			        dataType: 'json',
			        data: JSON.stringify(data),
			        contentType: "application/json; charset=UTF-8",
			        success: function(data, status){
			        	if(data.rows.length > 0) {
			        		var obj = $('#kind');
			        		obj.find("option").remove();
			        		$.each(data.rows, function(index,value){
			        			obj.append("<option value='" + value.cd + "'>" + value.nm + "</option> ");
		                    });
			        		
			        		make_cond();
			        	}
			        },
			        error: function(request, status, error) {
			        }
				});
			}
			
			function make_cond() {
				
				var data = new Object();
				data.sqlId = "selectCdData";
				data.cd_nm = "상태코드";
				
				$.ajax({
			        type: 'POST',
			        url: 'selectData.do',
			        dataType: 'json',
			        data: JSON.stringify(data),
			        contentType: "application/json; charset=UTF-8",
			        success: function(data, status){
			        	if(data.rows.length > 0) {
			        		var obj = $('#cond');
			        		obj.find("option").remove();
			        		$.each(data.rows, function(index,value){
			        			obj.append("<option value='" + value.cd + "'>" + value.nm + "</option> ");
		                    });
			        		setFormData();
			        	}
			        },
			        error: function(request, status, error) {
			        }
				});
			}
			
			function setFormData() {
				console.log("setFormData()");
				
				var data = new Object();
				data.g_cd_m = "";
				data.g_cd = "";
				data.s_div = "";
				data.searchTxt = "";
				data.m_seq = _m_seq;
				data.paging = "N";
				data.pageSize = "999999";
				data.page = "";
				data.fastSelect = "N";
				
				$.ajax({
			        type: 'POST',
			        url: 'selectMusicList.do',
			        dataType: 'json',
			        data: JSON.stringify(data),
			        contentType: "application/json; charset=UTF-8",
			        success: function(data, status){
			        	if(data.length > 0) {
			        		$.each(data, function(index,value){
			        			$("#g_cd").val(value.g_cd).prop("selected",true);
			        			$("#m_no").val(value.m_no);
			        			$("#m_nm").val(value.m_nm);
			        			$("#product").val(value.product);
			        			$("#year").val(value.year);
			        			//img_a
			        			//img_b
			        			$("#kind").val(value.kind);
			        			$("#cond").val(value.cond);
			        			$("#music").val(value.music);
			        			$("#player").val(value.player);
			        			$("#singer").val(value.singer);
			        			$("#playCnt").val(value.playCnt);
			        			$("#last_play_dt").val(value.last_play_dt);
			        			$("#ex").val(value.ex);
			        			$("#memo").val(value.memo);
			        			
			        			// img file set
			        			var src_Img_a = "";
			        			var src_Img_b = "";
			        			if(value.img_a != "") {
			        				src_Img_a = "data:image/jpg;base64," + value.img_a;
			        			}
			        			if(value.img_b != "") {
			        				src_Img_b = "data:image/jpg;base64," + value.img_b;
			        			}
			        			$("#img_a").attr("src",src_Img_a);
			        			$("#img_b").attr("src",src_Img_b);
		                    });
			        		
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
					//_sBtnObj.removeAttr('disabled');
				});
			}

			function img_pathUrl(target, input) {
				$('#' + target)[0].src = (window.URL ? URL : webkitURL)
						.createObjectURL(input.files[0]);
			}

			$("#alubmForm").submit(
					function(event) {
						event.preventDefault(); // Prevent the form from submitting via the browser

						if ($('#m_nm').val() == "") {
							alert("앨범명은 필수 입니다.");
							return;
						}

						var _this = $(this);
						_this.attr('disabled', 'disabled');

						var data = new Object();
						data.m_seq = _m_seq;
						data.g_cd = $('#g_cd').val();
						data.m_no = $('#m_no').val();
						data.m_nm = $('#m_nm').val();
						data.product = $('#product').val();
						data.year = $('#year').val();
						data.img_a = "";
						data.img_b = "";
						data.kind = $('#kind').val();
						data.cond = $('#cond').val();
						data.music = $('#music').val();
						data.player = $('#player').val();
						data.singer = $('#singer').val();
						data.playCnt = $('#playCnt').val();
						data.last_play_dt = $('#last_play_dt').val();
						data.ex = $('#ex').val();
						data.memo = $('#memo').val();

						// img_a
						if ($('#img_a').attr('src') != undefined
								&& $('#img_a').attr('src') != '') {
							var img_a = document.getElementById('img_a');
							var img_a_Base64 = getBase64Image(img_a);
							data.img_a = img_a_Base64;
						}

						// img_b
						if ($('#img_b').attr('src') != undefined
								&& $('#img_b').attr('src') != '') {
							var img_b = document.getElementById('img_b');
							var img_b_Base64 = getBase64Image(img_b);
							data.img_b = img_b_Base64;
						}

						$.ajax({
							url : _this.attr('action'),
							type : _this.attr('method'),
							dataType : 'json',
							data : JSON.stringify(data),
							contentType : "application/json; charset=UTF-8",
							success : function(data, status) {
								alert("저장하였습니다.");
								location.href = "album_edit.do";
							},
							error : function(request, status, error) {
								_this.removeAttr('disabled');
								alert("저장 오류.");
							}
						});
					});

			function getBase64Image(img) {
				// Create an empty canvas element
				var canvas = document.createElement("canvas");
				canvas.width = 322;//img.naturalWidth;
				canvas.height = 250;//img.naturalHeight;

				// Copy the image contents to the canvas
				var ctx = canvas.getContext("2d");
				ctx.drawImage(img, 0, 0, 322, 250);

				// Get the data-URL formatted image
				// Firefox supports PNG and JPEG. You could check img.src to
				// guess the original format, but be aware the using "image/jpg"
				// will re-encode the image.
				var dataURL = canvas.toDataURL("image/jpg");

				return dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
			}
		</script>
	</body>
</html>