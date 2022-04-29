<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type = 'hidden'  id= "ntSeq" name ="ntSeq" value="${noticeVO.ntSeq}">
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="ntAtchFileId" id="ntAtchFileId"/>
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
							<input type="text" name="ntTitle" id="ntTitle" class="text w100p"   maxlength="50" value="${noticeVO.ntTitle}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>공지글 여부</strong></th>
						<td >
							공지글<input type="radio" name="ntNoticeYn" id="ntNotice_Y" class="radio w100p"    value="Y" ${noticeVO.ntNoticeYn eq "Y" ? 'checked' : ''}   ${empty noticeVO.ntNoticeYn ? 'checked' : ''}/>
							일반글<input type="radio" name="ntNoticeYn" id="ntNotice_N" class="radio w100p"    value="N" ${noticeVO.ntNoticeYn eq "N" ? 'checked' : ''} />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">공지시작일</strong></th>
						<td >
							<input type="date" name="ntStart" id="ntStart" class="date w100p" value="${noticeVO.ntStart}" />
						</td>
						<th scope="row"><strong class="th_tit">공지종료일</strong></th>
						<td >
							<input type="date" name="ntEnd" id="ntEnd" class="date w100p" value="${noticeVO.ntEnd}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="ntCont" id="ntCont" class="txt_area w_100p" >${util:unEscape(noticeVO.ntCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="ntAtchFileIdFrame" id="ntAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${noticeVO.ntAtchFileId }&fileCnt=5&atchFileIdNm=ntAtchFileId&updateType=upload" style="width: 100%;"  frameborder="0" ntTitle="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody>
			</table>
		</div>
		
		
		<div class="btn_area">
			<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="btnSubmit('${noticeVO.ntSeq}');">${not empty noticeVO.ntSeq ? '수정' : '등록'}</a>
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

$("[name='ntNoticeYn']").click(function(){
	var thisVal = $(this).val();
	if(thisVal == "Y"){
		$("#ntStart").attr("disabled", false);
		$("#ntEnd").attr("disabled", false);
	}
	if(thisVal == "N"){
		$("#ntStart").val();
		$("#ntEnd").val();
		$("#ntStart").attr("disabled", true);
		$("#ntEnd").attr("disabled", true);
	}
});


// 등록, 수정버튼 + 유효성 
var count = 0;
function btnSubmit(ntSeq){
	// 제목 
	if($("#ntTitle").val() == "" || $("#ntTitle").val() == null) {
		fncMsg('ntTitle',"제목을 입력하세요"); 
		count++;
	}
	//내용 
	oEditors.getById["ntCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
	if($("#ntCont").val()=='<p>&nbsp;</p>') {
		fncMsg('ntCont',"내용을 입력하세요"); 
		count++;
	}		
		 // 공지글  유효성검사 
		if($("#ntNotice_Y").is(":checked")){  
				// 공지 null 
				if($("#ntStart").val() == "" || $("#ntStart").val() == null) {
					fncMsg('ntStart',"공지시작일을 선택하세요"); 
					count++;
				}
				if($("#ntEnd").val() == "" || $("#ntEnd").val() == null) {
					fncMsg('ntEnd',"공지종료일을 선택하세요"); 
					count++;
				}
				// 공지시작일 < 공지종료일
				if($("#ntEnd").val() < $("#ntEnd").val()){
					fncMsg('ntEnd',"종료일은 시작일보다 빠를 수 없습니다. "); 
					count++;
				}
			}
	
	if(count>0){
		count=0;
		return false; 
	}
	
	if(ntSeq==null || ntSeq ==''){ // 등록
		fncPageBoard('write','insertProc.do');
	}else { // 수정
		fncPageBoard('update','updateProc.do');
	}
}

// 취소 
function btnCancle(){
	fncPageBoard('view','list.do');
}


$(document).ready(function(){	
	
	<%-- 에디터 --%>
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "ntCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	
	
});
</script>