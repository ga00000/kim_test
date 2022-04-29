<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<!-- layout  -->
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<title>김건축사무소</title>
	<link rel="stylesheet" type="text/css" href="/publish/ft/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="/publish/ft/css/style.css">
	<script type="text/javascript" src="/publish/ft/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/publish/ft/js/common.js"></script>
	<script type="text/javascript" src="/publish/ft/js/jquery.bxslider.js"></script>
	
 </head>
 

		
 <body>
	<div id="skipnavi">
		<a href="#container">▶본문 바로가기</a>
		<a href="#gnb_area">▶주메뉴 바로가기</a>
	</div>
	<div id="wrapper">
		<!-- header  -->
		<div class="gnb_bg"></div>
		<header id="header">
			<div class="header_box">
				<h1 class="logo"><a href="#"><img src="/publish/ft/images/common/logo.png" alt="김건축사무소"/></a></h1>
				<div class="util_box">
					<ul class=" clear">
						<li><a href="/ft/main.do">HOME</a></li>
						<c:choose>
							<c:when test="${not empty loginFtId }">
								<li><a href="#"> ${loginFtId} 님 환영합니다.  </a></li>
								<li><a href="/ft/join/join/logout.do"> 로그아웃 </a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/ft/join/join/loginForm.do">로그인</a></li>
								<li><a href="/ft/join/join/agree.do">회원가입</a></li>
							</c:otherwise>						
						</c:choose>
						<li><a href="/login.do"><i class="fa fa-star"></i>즐겨찾기</a></li>
					</ul>
				</div>
			</div><!--//header_box-->
			<!-- GNB -->
			<h2 class="hidden">주메뉴</h2>
			<div id="gnb_area">
				<nav id="gnb">
					<ul class="depth2 clear">
						<c:forEach var = "result" items = "${ftMenuList}" varStatus = "status"  > 
							<li class="depth1_1">
							<a href="${result.url}">${result.menuNm}</a>
								<ul class="depthBox">
									<c:forEach var = "menu" items = "${result.menuList}" varStatus = "status" > 
											<li><a href="${menu.url}">${menu.menuNm}</a></li>
									</c:forEach>
								</ul>
							</li>
						</c:forEach>
					</ul>
				</nav>
			</div>
			<!-- //GNB -->
		</header>
		<!-- // header   -->
		<!-- container -->
		<div id="container">
			<div class="main_slider">
				<ul class="slider">
					<c:if test="${fn:length(mainFileSn) > 0}">
						<c:forEach var="fileSn" items="${mainFileSn}" > 
							<li>
								<img src="/atch/getImage.do?atchFileId=${mainMaVO.mmAtchFileId }&fileSn=${fileSn}" alt="" onerror="this.src='/publish/ft/images/main/error.png'" style="width: 1900px; height: 465px">
							</li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			<div id="main_content">
				<div class="main_conts clear">
					<div class="notice_box">
						<div>
							<h3>공지사항</h3>
							<ul class="notice_list">
								<c:forEach var='noticeVO'  items="${noticeList}" varStatus="status">
									<c:if test="${status.index < 4 && noticeVO.noticeNormal eq 'notice' }">
										<li>
											<a href="/ft/guest/notice/view.do?ntSeq=${noticeVO.ntSeq}">${noticeVO.ntTitle}</a><span class="date">${noticeVO.ntRgstDt} </span>
										</li>
									</c:if>
								</c:forEach>
							</ul>
							<a href="/ft/guest/notice/view.do" class="more"></a>
						</div>
					</div>
<!-- 					배너 -->
				<c:forEach var = "bannerVO" items="${bannerList }"> 
					<div class="quotation" style="background: url(/atch/getImage.do?atchFileId=${bannerVO.baAtchFileId }&fileSn=0) 100%;">
						<h3 class="tit_quotation"></h3>
						<div>
							<p>${bannerVO.baTitle }</p>
                            <a href="${bannerVO.baCont }" alt="견적문의" ${bannerVO.baWindowYn eq "Y" ? "target='_blank'" : "" }>${bannerVO.baTitle }<span class="quotation_arrow"></span></a>
						</div>
					</div>
				
				 </c:forEach>
					
					
				</div>
				<div class="main_tabarea clear">
					<ul class="tab_menu main_tab">
						<li class="current"><a href="#main_tab01"><span class="icon_tab01"></span><span>시공사례</span></a></li>
						<li><a href="#main_tab02"><span class="icon_tab02"></span><span>추천설계</span></a></li>
						<li><a href="#main_tab03"><span class="icon_tab03"></span><span>시공현장</span></a></li>
						<li><a href="#main_tab04"><span class="icon_tab04"></span><span>인테리어사례</span></a></li>
					</ul>
<!-- 					포트폴리오  -->

					<!-- 시공사례  -->
					<div id="main_tab01" class="tab_content main_tabcont">
						<ul class="clear">
<%-- 							<c:forEach var="portVO" items="portList" >  --%>
<%-- 								<c:if test="${portVO.ptSelect eq 'port1'}"> --%>
<%-- 									<img src="/atch/getImage.do?atchFileId=${portVO.ptAtchFileId }&fileSn=0" alt="" onerror="this.src='/publish/ft/images/sub/no_img.png'"> --%>
<%-- 									<a href="/ft/port/port1/view.do?ptSeq=${portVO.ptSeq }"><span class="hover_txt"><strong>${portVO.ptTitle}</strong>${portVO.ptRgstDt }</span><span class="more">상세보기 +</span></a> --%>
<%-- 								</c:if> --%>
<%-- 							</c:forEach> --%>
						
						
							<li>
								<img src="images/main/temp_img01.png" alt="">
								<a href="#"><span class="hover_txt"><strong>빛가람동 혁신도시 43평</strong>2017-09-01</span><span class="more">상세보기 +</span></a>
							</li>
							<li>
								<img src="images/main/temp_img02.png" alt="">
								<a href="#"><span class="hover_txt"><strong>빛가람동 혁신도시 43평</strong>2017-09-01</span><span class="more">상세보기 +</span></a>
							</li>
							<li>
								<img src="images/main/temp_img03.png" alt="">
								<a href="#"><span class="hover_txt"><strong>빛가람동 혁신도시 43평</strong>2017-09-01</span><span class="more">상세보기 +</span></a>
							</li>
							
						</ul>
					</div>
					
					
					
					<!-- 추천설계  -->
					<div id="main_tab02"  class="tab_content main_tabcont">
						<ul class="clear">
							<li>
								<img src="images/main/temp_img02.png" alt="">
								<a href="#"><span class="hover_txt"><strong>빛가람동 혁신도시 43평</strong>2017-09-01</span><span class="more">상세보기 +</span></a>
							</li>
							<li>
								<img src="images/main/temp_img01.png" alt="">
								<a href="#"><span class="hover_txt"><strong>빛가람동 혁신도시 43평</strong>2017-09-01</span><span class="more">상세보기 +</span></a>
							</li>
							<li>
								<img src="images/main/temp_img03.png" alt="">
								<a href="#"><span class="hover_txt"><strong>빛가람동 혁신도시 43평</strong>2017-09-01</span><span class="more">상세보기 +</span></a>
							</li>
						</ul>
					</div>
					<!-- 시공현장  -->
					<div id="main_tab03"  class="tab_content main_tabcont">
						<ul class="clear">
							<li>
								<img src="images/main/temp_img03.png" alt="">
								<a href="#"><span class="hover_txt"><strong>빛가람동 혁신도시 43평</strong>2017-09-01</span><span class="more">상세보기 +</span></a>
							</li>
							<li>
								<img src="images/main/temp_img01.png" alt="">
								<a href="#"><span class="hover_txt"><strong>빛가람동 혁신도시 43평</strong>2017-09-01</span><span class="more">상세보기 +</span></a>
							</li>
							<li>
								<img src="images/main/temp_img02.png" alt="">
								<a href="#"><span class="hover_txt"><strong>빛가람동 혁신도시 43평</strong>2017-09-01</span><span class="more">상세보기 +</span></a>
							</li>
						</ul>
					</div>
					<!-- 인테리어사례  -->
					<div id="main_tab04"  class="tab_content main_tabcont">
						<ul class="clear">
							<li>
								<img src="images/main/temp_img03.png" alt="">
								<a href="#"><span class="hover_txt"><strong>빛가람동 혁신도시 43평</strong>2017-09-01</span><span class="more">상세보기 +</span></a>
							</li>
							<li>
								<img src="images/main/temp_img02.png" alt="">
								<a href="#"><span class="hover_txt"><strong>빛가람동 혁신도시 43평</strong>2017-09-01</span><span class="more">상세보기 +</span></a>
							</li>
							<li>
								<img src="images/main/temp_img01.png" alt="">
								<a href="#"><span class="hover_txt"><strong>빛가람동 혁신도시 43평</strong>2017-09-01</span><span class="more">상세보기 +</span></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="quick_menu">
				<ul>
					<li class="quick01">
						<a href="#"><span class="icon_quick"></span><span>A/S신청</span></a>
					</li>
					<li class="quick02">
						<a href="#"><span class="icon_quick"></span><span>건축정보</span></a>
					</li>
					<li class="quick03">
						<a href="#">	<span class="icon_quick"></span><span>자유게시판</span></a>
					</li>
					<li class="quick04">
						<a href="#"><span class="icon_quick"></span><span>오시는길</span></a>
					</li>
					<li class="btn_top"><strong>Top</strong></li>
				</ul>
			</div>
		</div>
		<!-- //container -->
		<!-- footer -->
		<footer id="footer">
			<ul class="footer_link clear">
				<li> 김건축 사무소에 오신 것을 환영합니다. </li>
			</ul>
			<div class="footer_area">
				<div class="footer_box">
					<div class="customer_center">
						<table>
							<thead>
								<tr>
									<th colspan="2">고객센터</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>평일</th>
									<td class="r" > 09:00 ~ 18:00</td>
								</tr>
								<tr>
									<th>토요일</th>
									<td class="r" >09:00 ~ 12:00</td>
								</tr>
								<tr>
									<td class="last" colspan="2">061.123.4567</td>
								</tr>
								<tr>
									<td class="last" colspan="2">010.1234.5678</td>
								</tr>
							</tbody>

						</table>
					</div>
					<p class="address">${mainMaVO.mmAddress } </p>
					<ul class="clear">
						<li>대표 : ${mainMaVO.mmAddress }  ㅣ  사업자등록번호 : ${mainMaVO.mmHpNum }</li>
						<li><i class="fa fa-phone"></i>${mainMaVO.mmHp }</li>
						<li><i class="fa fa-fax"></i>FAX : ${mainMaVO.mmFax }</li>
						<li><i class="fa fa-envelope"></i>${mainMaVO.mmMail }</li>
					</ul>
					<p class="copy">2017 Copyright by 김건축 사무소 &copy; all right reserved.</p>
				</div>
			</div>
		</footer>
		<!-- //footer -->
	</div>
 </body>
 <script type="text/javascript">
		$(document).ready(function() {
			$('.slider').bxSlider({
				controls:false,
				auto: true,
				autoControls: true,
				autoControlsCombine:true,
				pager:true,
				pause: 4000
			});
		});
	</script>
</html>

