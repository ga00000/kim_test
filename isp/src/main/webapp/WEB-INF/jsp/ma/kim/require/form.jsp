<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type = 'text'  id= "reSeq" name ="reSeq" value="${requireVO.reSeq}">
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="reAtchFileId" id="reAtchFileId"/>
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
							<input type="text" name="reTitle" id="reTitle" class="text w100p"   maxlength="50" value="${requireVO.reTitle}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong >진행상황</strong></th>
						<td  >
							<select name = "reSelect">
								<option value="select1" >신청</option>
								<option value="select2" >승인</option>
								<option  value="select3" >거절</option>
								<option  value="select4" >재신청</option>
							</select>
						</td>
						
						<th scope="row"><strong > 비밀글 유무</strong></th>
						<td >
							비밀글<input type="radio" name="reSecretYn" id="reSecret_Y" class="radio w100p"    value="Y" ${requireVO.reSecretYn eq 'Y' ? 'checked' : ''  } />
							일반글<input type="radio" name="reSecretYn" id="reSecret_N" class="radio w100p"    value="N" ${requireVO.reSecretYn eq 'N' ? 'checked' : ''  } />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit"> 비밀번호 </strong></th>
						<td >
							<input type="password" name="reSecretPw" id="reSecretPw" class="password w100p"   maxlength="20"  />
						</td>
						<th scope="row"><strong class="th_tit"> 비밀번호 재확인 </strong></th>
						<td >
							<input type="password" name="reSecretPwCheck" id="reSecretPwCheck" class="password w100p"   maxlength="20"  />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="reCont" id="reCont" class="txt_area w_100p" >${util:unEscape(requireVO.reCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="reAtchFileIdFrame" id="reAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${requireVO.reAtchFileId }&fileCnt=5&atchFileIdNm=reAtchFileId&updateType=upload" style="width: 100%;"  frameborder="0" reTitle="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody>
			</table>
		</div>
		
		
		<div class="btn_area">
			<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="btnSubmit('${requireVO.reSeq}');">${not empty requireVO.reSeq ? '수정' : '등록'}</a>
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
function btnSubmit(reSeq){
	if($("#reTitle").val() == "" || $("#reTitle").val() == null) {
		fncMsg('reTitle',"제목을 입력하세요"); 
		return false;
	}
		oEditors.getById["reCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
		
	if($("#reCont").val()=='<p>&nbsp;</p>') {
		fncMsg('reCont',"내용을 입력하세요"); 
		return false;
	}		
	if(reSeq==null || reSeq ==''){ // 등록
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
	    elPlaceHolder: "reCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	
	
});
</script>