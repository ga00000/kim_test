<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>


	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="ntSeq" id="ntSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="ntAtchFileId" id="ntAtchFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		
		<!-- tbl -->
	<div class="content_box">
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${noticeVO.ntRgstId }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${noticeVO.ntRgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3">
							${noticeVO.ntTitle }
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>공지글</strong></th>
						<td colspan="3">
							${noticeVO.ntNoticeYn eq "Y" ? "공지글" : "일반글"  }
						</td>
					</tr>
					
					<c:if test="${noticeVO.ntNoticeYn eq 'Y'}">
						<tr>
							<th scope="row"><strong>공지 시작일 </strong></th>
							<td >
								${noticeVO.ntStart }
							</td>
							<th scope="row"><strong>공지 종료일 </strong></th>
							<td >
								${noticeVO.ntEnd }
							</td>
						</tr>
					</c:if>
					
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(noticeVO.ntCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="ntAtchFileIdFrame" id="ntAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${noticeVO.ntAtchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;"  frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="javascript:void(0)" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="javascript:void(0)" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="javascript:void(0)" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
 </div>
 
</form:form>
