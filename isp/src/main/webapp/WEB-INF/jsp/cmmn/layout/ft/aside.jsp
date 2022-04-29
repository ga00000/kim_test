<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<c:forEach var="menu" items="${ftMenuList }">
	<c:if test="${util:getMenuCd(url).depth1 eq menu.menuCd }">
	<c:set var="depth1" value="${menu.menuNm }"/>
	<c:set var="depth1Cd" value="${menu.menuCd }"/>
	<c:set var="menuList" value="${menu.menuList }"/>
	</c:if>
</c:forEach>

<div id="left_cont">
	<h3 class="lnb_tit">${depth1 }</h3>
	<ul class="lnb">
				<c:forEach var="menuSub" items="${menuList }">
					<c:if test="${util:getMenuCd(url).depth2 eq menuSub.menuCd }">
					<c:set var="depth2" value="${menuSub.menuNm }"/>
					<c:set var="depth2Cd" value="${menuSub.menuCd }"/>
					<c:set var="depth2Url" value="${menuSub.url }"/>
					</c:if>
					<li class="${not empty menuSub.menuList ? 'has_sub' : '' } ${util:getMenuCd(url).depth2 eq menuSub.menuCd ? 'active' : ''}">
						<a href="${not empty menuSub.menuList ? '#' : menuSub.menuCd eq 'cs' ? 'https://analytics.google.com/analytics/web/?hl=ko&pli=1#/report-home/a157536003w221711255p210735021' : menuSub.url }" ${menuSub.menuCd eq 'cs' ? 'target="_blank"' : '' } >${menuSub.menuNm }</a>
						<c:if test="${not empty menuSub.menuList }">
							<ul ${util:getMenuCd(url).depth2 eq util:getMenuCd(menuSub.url).depth2 ? 'style="display:block;"' : ''}>
							</ul>
						</c:if>
					</li>
					
				
				</c:forEach>
			</ul>
		</div>
		
 <div id="right_cont">
		<h4 class="page_title">${not empty depth3 ? depth3 : not empty depth2 ? depth2 : depth1 }</h4>
		<div class="location">
			<a href="#"><i class="fa fa-home"></i></a> <span>&gt; ${depth1 }</span> 
			<c:if test="${not empty depth2 }"><span> &gt; ${depth2 }</span></c:if>
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
			
			
			
			
			