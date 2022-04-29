<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>


<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>

<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col style="width:10%">
			<col style="width:8%">
			<col>
			<col style="width:8%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">진행상황</th>
				<th scope="col">비밀글</th>
				<th scope="col" class="subject">제목</th>
				<th scope="col">첨부파일</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor" onclick="fncPageBoard('view','view.do','${result.reSeq}','reSeq')">
						
							<td >${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)} 	</td>
							<td >
								${result.reSelect  eq 'select1' ? '신청' : ''}
								${result.reSelect  eq 'select2' ? '승인' : ''}
								${result.reSelect  eq 'select3' ? '거절' : ''}
								${result.reSelect  eq 'select4' ? '재신청' : ''}
							</td>
							<td >${ result.reSecretYn eq "Y" ? "비밀글" : "일반글" }</td>
							<td class="subject" >${util:cutText(result.reTitle,30,'...') }</td>
							<td >${not empty result.reAtchFileId ? "📁" : "-" }</td>
							<td >${result.reRgstId }</td>
							<td >${result.reRgstDt }</td>
							
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="7" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- //tbl end --%>

<%-- paging start --%>
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="btn_right">
		<a href="#" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">등록</a>
	</div>
</div>
<%-- //paging end--%>