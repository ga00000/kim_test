<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>


	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type = 'text'  id= "feSeq" name ="feSeq" value="${freeVO.feSeq}">
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="feAtchFileId" id="feAtchFileId"/>
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
							${freeVO.feRgstId }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${freeVO.feRgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3">
							${freeVO.feTitle }
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(freeVO.feCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="feAtchFileIdFrame" id="feAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${freeVO.feAtchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;"  frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="tbl_btns r">
		    <a href="javascript:void(0)"  class="btn btn_middle btn_purple" onclick="btnSubmit('${freeVO.feSeq}');"> 수정 </a>
		    <a href="javascript:void(0)"  class="btn btn_middle btn_gray" onclick="btnCancel();">취소</a>
	</div>
	
 </div>
 
</form:form>

<script type="text/javascript">

function btnSubmit(){
	fncPageBoard('update','updateForm.do');
}

</script>