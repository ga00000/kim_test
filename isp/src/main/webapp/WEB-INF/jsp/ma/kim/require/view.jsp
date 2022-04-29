<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>


	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="reSeq" id="reSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="reAtchFileId" id="reAtchFileId"/>
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
							${requireVO.reRgstId }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${requireVO.reRgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3">
							${requireVO.reTitle }
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>진행상황</strong></th>
						<td>
								${requireVO.reSelect  eq 'select1' ? '신청' : ''}
								${requireVO.reSelect  eq 'select2' ? '승인' : ''}
								${requireVO.reSelect  eq 'select3' ? '거절' : ''}
								${requireVO.reSelect  eq 'select4' ? '재신청' : ''}
						</td>
	                    <th scope="row"><strong>글상태</strong></th>
						<td>
								${requireVO.reSecretYn eq 'Y' ? '비밀글' : ''}
								${requireVO.reSecretYn eq 'N' ? '일반글' : ''}
						</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(requireVO.reCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="reAtchFileIdFrame" id="reAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${requireVO.reAtchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;"  frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		
	<div class="btn_area">
		<a href="javascript:void(0)" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="javascript:void(0)" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="javascript:void(0)" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>
	
	<!--  관리자 답글  -->
			<div class="tbl_wrap">
				<table class="tbl_row_type01"> 
					<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
					<colgroup>
						<col style="width:20%;">
						<col style="width:30%;">
						<col style="width:20%;">
						<col style="width:30%;">
					</colgroup> 
					<tbody>
						
						<tr>
							<th scope="row"><strong >진행상황</strong></th>
							<td  >
								신청<input type="radio" name="reSelect" class="radio"   value="select1" ${requireVO.reSelect eq "select1" ? "checked" : "" }/>
								승인<input type="radio" name="reSelect" class="radio"   value="select2" ${requireVO.reSelect eq "select2" ? "checked" : "" }/>
								거절<input type="radio" name="reSelect" class="radio"   value="select3" ${requireVO.reSelect eq "select3" ? "checked" : "" }/>
								재신청<input type="radio" name="reSelect" class="radio"  value="select4" ${requireVO.reSelect eq "select4" ? "checked" : "" }/>
							</td>
						</tr>
						
						<tr>
							<th scope="row"><strong class="th_tit">내용</strong></th>
							<td colspan="3">
								<input type="text" name="maCont" id="maCont" class="text w100p"   maxlength="50" value="${requireVO.maCont}" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="btn_area">
				<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="btnSubmit('${requireVO.reSeq}');">${not empty requireVO.reSeq ? '수정' : '등록'}</a>
					<a href="javascript:void(0)" class="btn btn_mdl btn_cancel" onclick="btnCancel();">취소</a>
			</div>
			
		</div>	
 	</div>
 
</form:form>


<script type="text/javascript">

function btnSubmit(){
	fncPageBoard('view','MaUpdateProc.do');
}

function btnCancel(){ 
	fncPageBoard('view','view.do');
}

</script>