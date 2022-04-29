<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>



<%-- content --%>
<div class="content_box">
	<%-- search  --%>
	<div class="search_area clear">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="feSeq" name="feSeq"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			
			<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
		
			<fieldset class="search_form">
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">검색구분</strong>
					
					<form:select path="schEtc01" id="schEtc01" title="첨부파일" cssClass="w100"  >  
						<form:option value="0" label="첨부파일"/>
						<form:option value="1" label="있음"/>
						<form:option value="2" label="없음"/>
					</form:select>
					
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100"  >  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="제목"/>
						<form:option value="2" label="내용"/>
					</form:select>
					
					<form:input path="searchKeyword" id="searchKeyword" class="text w50p" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search"><i class="fa fa-search"></i>검색</button>
					</span>
				</div>
			</fieldset>
		</form:form>
	</div>
	
	<%--// addList   --%>
	<div class="tbl">
	</div>
	
</div>

<script type="text/javaScript">

$("#schEtc01").on("change", function(){
	fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
})


$(document).ready(function(){
	fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
});
</script>