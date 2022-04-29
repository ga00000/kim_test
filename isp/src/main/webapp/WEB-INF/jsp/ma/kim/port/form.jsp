<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type = 'hidden'  id= "ptSeq" name ="ptSeq" value="${portVO.ptSeq}">
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="ptAtchFileId" id="ptAtchFileId"/>
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
							<input type="text" name="ptTitle" id="ptTitle" class="text w100p"   maxlength="50" value="${portVO.ptTitle}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong >게시판 구분</strong></th>
						<td  colspan="3">
							<select name = "ptSelect">
								<option value="port1" >시공사례</option>
								<option value="port2" >추천설계</option>
								<option  value="port3" >시공현장</option>
								<option  value="port4" >인테리어사례</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="ptCont" id="ptCont" class="txt_area w_100p" >${util:unEscape(portVO.ptCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="ptAtchFileIdFrame" id="ptAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${portVO.ptAtchFileId }&fileCnt=5&atchFileIdNm=ptAtchFileId&updateType=upload" style="width: 100%;"  frameborder="0" ptTitle="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody>
			</table>
		</div>
		
		
		<div class="btn_area">
			<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="btnSubmit('${portVO.ptSeq}');">${not empty portVO.ptSeq ? '수정' : '등록'}</a>
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
function btnSubmit(ptSeq){
	if($("#ptTitle").val() == "" || $("#ptTitle").val() == null) {
		fncMsg('ptTitle',"제목을 입력하세요"); 
		return false;
	}
		oEditors.getById["ptCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
		
	if($("#ptCont").val()=='<p>&nbsp;</p>') {
		fncMsg('ptCont',"내용을 입력하세요"); 
		return false;
	}		
	if(ptSeq==null || ptSeq ==''){ // 등록
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
	    elPlaceHolder: "ptCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	
	
});
</script>