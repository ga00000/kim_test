<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type = 'hidden'  id= "baSeq" name ="baSeq" value="${bannerVO.baSeq}">
		<form:hidden path="pageIndex"/> 
		<form:hidden path="baAtchFileId" id="baAtchFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		
<div class="content_box">
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
						<th scope="row"><strong class="th_tit">제목</strong></th>
						<td colspan="3">
							<input type="text" name="baTitle" id="baTitle" class="text w100p"   maxlength="50" value="${bannerVO.baTitle}" />
<%-- 							<form:input path="baTitle"/> --%>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">링크</strong></th>
						<td colspan="3">
							<input type="text" name="baCont" id="baCont" class="text w100p"   maxlength="100" value="${bannerVO.baCont}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">창열기</strong></th>
						<td colspan="3">
							새창으로 열기<input type="radio" name="baWindowYn" id="baWindow_Y" class="radio"   value="Y" ${bannerVO.baWindowYn eq "Y" ? "checked" : "" }/>
							기존창으로 열기<input type="radio" name="baWindowYn" id="baWindow_N" class="radio"   value="N"  ${bannerVO.baWindowYn eq "N" ? "checked" : "" }  ${empty bannerVO.baWindowYn ? "checked" : "" } />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="baAtchFileIdFrame" id="baAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${bannerVO.baAtchFileId }&fileCnt=5&atchFileIdNm=baAtchFileId&updateType=upload" style="width: 100%;"  frameborder="0" baTitle="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody>
			</table>
		</div>
		
		
		<div class="btn_area">
			<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="btnSubmit('${bannerVO.baSeq}');">${not empty bannerVO.baSeq ? '수정' : '등록'}</a>
				<a href="javascript:void(0)" class="btn btn_mdl btn_cancel" onclick="btnCancle();">취소</a>
		</div>
		
	</div>
	
</form:form>



<script type="text/javascript">
var oEditors = [];

function fncMsg(id,msg){
	var MsgHtml = '<strong><font color ="red">'+msg+'</strong>'
	$("#"+id).parent().children('strong').remove(); 
	if(msg!=null || msg !=''){
		$("#"+id).parent().append(MsgHtml); 
	}
}

// 등록, 수정버튼 + 유효성 
var count = 0; 
function btnSubmit(baSeq){
	if($("#baTitle").val() == "" || $("#baTitle").val() == null) {
		fncMsg('baTitle',"제목을 입력하세요"); 
		count++;
	}else{
		$("#baTitle").parent().children('strong').remove(); 
		count--;
	}		
	if($("#baCont").val() == "" || $("#baCont").val() == null) {
		fncMsg('baCont',"링크를 입력하세요"); 
		count++;
	}else{
		$("#baCont").parent().children('strong').remove(); 
		count--;
	}
	if(count>0){
		count = 0;
		return false;
	}
	
	if(baSeq==null || baSeq ==''){ // 등록
		fncPageBoard('update','insertProc.do');
	}else { // 수정
		fncPageBoard('update','updateProc.do');
	}
}

// 취소 
function btnCancle(){
	fncPageBoard('view','list.do');
}



</script>