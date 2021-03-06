<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE HTML>
<html>
	<head>
		<title>앨범</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		
		<style type="text/css">
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
		</style>
	</head>
	<body>
		<div id="page-wrapper">
			<div id="header-wrapper">
				<div class="container">
					<div class="row">
						<div class="12u">

							<header id="header">
								<h1><a href="#" id="logo">앨범관리</a></h1>
								<nav id="nav">
									<a href="#" class="current-page-item">처음으로</a>
									<a href="twocolumn1.html">앨범관리</a>
									<a href="twocolumn2.html">코드관리</a>
									<a href="onecolumn.html">백업</a>
									<a href="threecolumn.html">복구</a>
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
					<div class="row main-row" id="main_div">
						<div class="4u 12u(mobile)">

							<section>
								<h2>검색</h2>
								<div class="select-style">
									<select id="g_cd_m" title="검색할 장르 선택">
										<option value="" selected="selected">전체</option>
										<option value="C">Classic</option>
										<option value="K">Korean Pop</option>
										<option value="P">Pop</option>
										<option value="J">Jazz</option>
										<option value="W">World Music</option>
									</select>
								</div>
								<div class="select-style">
									<select id="g_cd_d" title="검색할 장르 상세 선택">
										<option value="" selected="selected">전체</option>
										<option value="C1">Solo</option>
										<option value="C2">Chamber</option>
										<option value="K1">Concetro</option>
										<option value="P1">Passion</option>
										<option value="J1">Song</option>
									</select>
								</div>
								<div class="text-style">
									<input type="text" id="searchTxt" />
								</div>
								<div class="button-style">
									<input type="button" value="검색" id="searchBtn" />
								</div>
							</section>
							
						</div>
						<div class="4u 12u(mobile)">

							<section>
								<h2>Who are you guys?</h2>
								<ul class="small-image-list">
									<li>
										<a href="#"><img src="images/pic2.jpg" alt="" class="left" /></a>
										<h4>Jane Anderson</h4>
										<p>Varius nibh. Suspendisse vitae magna eget et amet mollis justo facilisis amet quis.</p>
									</li>
									<li>
										<a href="#"><img src="images/pic1.jpg" alt="" class="left" /></a>
										<h4>James Doe</h4>
										<p>Vitae magna eget odio amet mollis justo facilisis amet quis. Sed sagittis consequat.</p>
									</li>
								</ul>
							</section>

						</div>
						<div class="4u 12u(mobile)">

							<section>
								<h2>How about some links?</h2>
								<div>
									<div class="row">
										<div class="6u 12u(mobile)">
											<ul class="link-list">
												<li><a href="#">Sed neque nisi consequat</a></li>
												<li><a href="#">Dapibus sed mattis blandit</a></li>
												<li><a href="#">Quis accumsan lorem</a></li>
												<li><a href="#">Suspendisse varius ipsum</a></li>
												<li><a href="#">Eget et amet consequat</a></li>
											</ul>
										</div>
										<div class="6u 12u(mobile)">
											<ul class="link-list">
												<li><a href="#">Quis accumsan lorem</a></li>
												<li><a href="#">Sed neque nisi consequat</a></li>
												<li><a href="#">Eget et amet consequat</a></li>
												<li><a href="#">Dapibus sed mattis blandit</a></li>
												<li><a href="#">Vitae magna sed dolore</a></li>
											</ul>
										</div>
									</div>
								</div>
							</section>

						</div>
					</div>
					<div class="row main-row">
						<div class="6u 12u(mobile)">

							<section>
								<h2>An assortment of pictures and text</h2>
								<p>Duis neque nisi, dapibus sed mattis quis, rutrum et accumsan.
								Suspendisse nibh. Suspendisse vitae magna eget odio amet mollis
								justo facilisis quis. Sed sagittis mauris amet tellus gravida
								lorem ipsum dolor sit amet consequat blandit lorem ipsum dolor
								sit amet consequat sed dolore.</p>
								<ul class="big-image-list">
									<li>
										<a href="#"><img src="images/pic3.jpg" alt="" class="left" /></a>
										<h3>Magna Gravida Dolore</h3>
										<p>Varius nibh. Suspendisse vitae magna eget et amet mollis justo
										facilisis amet quis consectetur in, sollicitudin vitae justo. Cras
										Maecenas eu arcu purus, phasellus fermentum elit.</p>
									</li>
									<li>
										<a href="#"><img src="images/pic4.jpg" alt="" class="left" /></a>
										<h3>Magna Gravida Dolore</h3>
										<p>Varius nibh. Suspendisse vitae magna eget et amet mollis justo
										facilisis amet quis consectetur in, sollicitudin vitae justo. Cras
										Maecenas eu arcu purus, phasellus fermentum elit.</p>
									</li>
									<li>
										<a href="#"><img src="images/pic5.jpg" alt="" class="left" /></a>
										<h3>Magna Gravida Dolore</h3>
										<p>Varius nibh. Suspendisse vitae magna eget et amet mollis justo
										facilisis amet quis consectetur in, sollicitudin vitae justo. Cras
										Maecenas eu arcu purus, phasellus fermentum elit.</p>
									</li>
								</ul>
							</section>

						</div>
						<div class="6u 12u(mobile)">

							<article class="blog-post">
								<h2>Just another blog post</h2>
								<a class="comments" href="#">33 comments</a>
								<a href="#"><img src="images/pic6.jpg" alt="" class="top blog-post-image" /></a>
								<h3>Magna Gravida Dolore</h3>
								<p>Aenean non massa sapien. In hac habitasse platea dictumst.
								Maecenas sodales purus et nulla sodales aliquam. Aenean ac
								porttitor metus. In hac habitasse platea dictumst. Phasellus
								blandit turpis in leo scelerisque mollis. Nulla venenatis
								ipsum nec est porta rhoncus. Mauris sodales sed pharetra
								nisi nec consectetur. Cras elit magna, hendrerit nec
								consectetur in, sollicitudin vitae justo. Cras amet aliquet
								Aliquam ligula turpis, feugiat id fermentum malesuada,
								rutrum eget turpis. Mauris sodales sed pharetra nisi nec
								consectetur. Cras elit magna, hendrerit nec consectetur
								in sollicitudin vitae.</p>
								<footer class="controls">
									<a href="#" class="button">Continue Reading</a>
								</footer>
							</article>

						</div>
					</div>
				</div>
			</div>
			<div id="footer-wrapper">
				<div class="container">
					<div class="row">
						<div class="8u 12u(mobile)">

							<section>
								<h2>How about a truckload of links?</h2>
								<div>
									<div class="row">
										<div class="3u 12u(mobile)">
											<ul class="link-list">
												<li><a href="#">Sed neque nisi consequat</a></li>
												<li><a href="#">Dapibus sed mattis blandit</a></li>
												<li><a href="#">Quis accumsan lorem</a></li>
												<li><a href="#">Suspendisse varius ipsum</a></li>
												<li><a href="#">Eget et amet consequat</a></li>
											</ul>
										</div>
										<div class="3u 12u(mobile)">
											<ul class="link-list">
												<li><a href="#">Quis accumsan lorem</a></li>
												<li><a href="#">Sed neque nisi consequat</a></li>
												<li><a href="#">Eget et amet consequat</a></li>
												<li><a href="#">Dapibus sed mattis blandit</a></li>
												<li><a href="#">Vitae magna sed dolore</a></li>
											</ul>
										</div>
										<div class="3u 12u(mobile)">
											<ul class="link-list">
												<li><a href="#">Sed neque nisi consequat</a></li>
												<li><a href="#">Dapibus sed mattis blandit</a></li>
												<li><a href="#">Quis accumsan lorem</a></li>
												<li><a href="#">Suspendisse varius ipsum</a></li>
												<li><a href="#">Eget et amet consequat</a></li>
											</ul>
										</div>
										<div class="3u 12u(mobile)">
											<ul class="link-list">
												<li><a href="#">Quis accumsan lorem</a></li>
												<li><a href="#">Sed neque nisi consequat</a></li>
												<li><a href="#">Eget et amet consequat</a></li>
												<li><a href="#">Dapibus sed mattis blandit</a></li>
												<li><a href="#">Vitae magna sed dolore</a></li>
											</ul>
										</div>
									</div>
								</div>
							</section>

						</div>
						<div class="4u 12u(mobile)">

							<section>
								<h2>Something of interest</h2>
								<p>Duis neque nisi, dapibus sed mattis quis, rutrum accumsan sed.
								Suspendisse eu varius nibh. Suspendisse vitae magna eget odio amet
								mollis justo facilisis quis. Sed sagittis mauris amet tellus gravida
								lorem ipsum dolor sit amet consequat blandit.</p>
								<footer class="controls">
									<a href="#" class="button">Oh, please continue ....</a>
								</footer>
							</section>

						</div>
					</div>
					<div class="row">
						<div class="12u">

							<div id="copyright">
								&copy; Untitled. All rights reserved. | Design: <a href="http://html5up.net">HTML5 UP</a>
							</div>

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
			<script type="text/javascript">
				window.onload = function() {
					console.log("window.onload");
					makeSelectBox();
					makeSelectBox_Detail();
				};
				
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
				        		$('#g_cd_m').find("option").remove().end().append("<option value=''>전체</option>");
				        		$.each(data, function(index,value){
				        			console.log(index + "   " + value.nm)
				        			$('#g_cd_m').append("<option value='" + value.cd + "'>" + value.nm + "</option> ");
			                    });
				        	}
				        },
				        error: function(request, status, error) {
				        	$('#g_cd_m').find("option").remove().end().append("<option value=''>전체</option>");
				        }
					});
				}
				
				function makeSelectBox_Detail(cd) {
					console.log("makeSelectBox_Detail(" + cd + ")");
					
					var data = new Object();
					data.g_cd_m = $('#g_cd_m option:selected').val();
					
					$.ajax({
				        type: 'POST',
				        url: 'selectGroupList_Detail.do',
				        dataType: 'json',
				        data: JSON.stringify(data),
				        contentType: "application/json; charset=UTF-8",
				        success: function(data, status){
				        	if(data.length > 0) {
				        		$('#g_cd_d').find("option").remove().end().append("<option value=''>전체</option>");
				        		$.each(data, function(index,value){
				        			console.log(index + "   " + value.nm)
				        			$('#g_cd_d').append("<option value='" + value.cd + "'>" + value.nm + "</option> ");
			                    });
				        	}
				        },
				        error: function(request, status, error) {
				        	$('#g_cd_d').find("option").remove().end().append("<option value=''>전체</option>");
				        }
					});
				}
				
				$("#g_cd_m").change(function(){
					console.log("g_cd_m.change()");
					makeSelectBox_Detail( $('#g_cd_m option:selected').val() );
				});
				
				$("#g_cd_d").change(function(){
					console.log("g_cd_d.change()");
					console.log("cd : " + $('#g_cd_d option:selected').val() );
					console.log("cd.substr(1,1) : " + $('#g_cd_d option:selected').val().substr(0,1) );
					$("#g_cd_m").val( $('#g_cd_d option:selected').val().substr(0,1) );
				});
				
				$("#searchBtn").click(function(){
					console.log("searchBtn.click()");
					console.log("g_cd_m : " + $('#g_cd_m option:selected').val() );
					console.log("g_cd : " + $('#g_cd_d option:selected').val() );
					console.log("searchTxt : " + $('#searchTxt').val() );
					
				});
			</script>
	</body>
</html>