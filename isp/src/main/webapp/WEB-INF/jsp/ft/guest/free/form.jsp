<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type = 'hidden'  id= "feSeq" name ="feSeq" value="${freeVO.feSeq}">
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="feAtchFileId" id="feAtchFileId"/>
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
							<input type="text" name="feTitle" id="feTitle" class="text w95p"   maxlength="50" value="${freeVO.feTitle}" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="feCont" id="feCont" class="txt_area w_100p" >${util:unEscape(freeVO.feCont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="feAtchFileIdFrame" id="feAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${freeVO.feAtchFileId }&fileCnt=5&atchFileIdNm=feAtchFileId&updateType=upload" style="width: 100%;"  frameborder="0" feTitle="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody>
			</table>
		</div>
		
		
	<div class="tbl_btns r">
		    <a href="javascript:void(0)"  class="btn btn_middle btn_purple" onclick="btnSubmit('${freeVO.feSeq}');">${not empty freeVO.feSeq ? '등록' : '수정' }</a>
		    <a href="javascript:void(0)"  class="btn btn_middle btn_gray" onclick="btnCancel();">취소</a>
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
function btnSubmit(feSeq){
	if($("#feTitle").val() == "" || $("#feTitle").val() == null) {
		fncMsg('feTitle',"제목을 입력하세요"); 
		return false;
	}
		oEditors.getById["feCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
		
	if($("#feCont").val()=='<p>&nbsp;</p>') {
		fncMsg('feCont',"내용을 입력하세요"); 
		return false;
	}		
	if(feSeq==null || feSeq ==''){ // 등록
		fncPageBoard('update','insertProc.do');
	}else { // 수정
		fncPageBoard('update','updateProc.do');
	}
}

// 취소 
function btnCancle(){
	fncPageBoard('view','view.do');
}


$(document).ready(function(){	
	
	<%-- 에디터 --%>
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "feCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	
	
});
</script>