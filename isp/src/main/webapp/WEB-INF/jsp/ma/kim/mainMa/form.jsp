<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>

	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type = 'hidden'  id= "mmSeq" name ="mmSeq" value="${mainMaVO.mmSeq}">
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="mmAtchFileId" id="mmAtchFileId"/>
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
						<th scope="row"><strong class="th_tit">대표자</strong></th>
						<td >
							<input type="text" name="mmRepresent" id="mmRepresent" class="text w100p"   maxlength="30" value="${mainMaVO.mmRepresent}" />
						</td>
						<th scope="row"><strong class="th_tit">주소</strong></th>
						<td >
							<input type="text" name="mmAddress" id="mmAddress" class="text w100p"   maxlength="30" value="${mainMaVO.mmAddress}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">사업자번호</strong></th>
						<td >
							<input type="text" name="mmHpNum" id="mmHpNum" class="text w100p"   maxlength="30" value="${mainMaVO.mmHpNum}" />
						</td>
						<th scope="row"><strong >회사번호</strong></th>
						<td >
							<input type="text" name="mmHp" id="mmHp" class="text w100p"   maxlength="30" value="${mainMaVO.mmHp}" />
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong >메일</strong></th>
						<td >
							<input type="text" name="mmMail" id="mmMail" class="text w100p"   maxlength="50" value="${mainMaVO.mmMail}" />
						</td>
						<th scope="row"><strong>팩스</strong></th>
						<td >
							<input type="text" name="mmFax" id="mmFax" class="text w100p"   maxlength="50" value="${mainMaVO.mmFax}" />
						</td>
					</tr>
					
					
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="mmAtchFileIdFrame" id="mmAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${mainMaVO.mmAtchFileId }&fileCnt=5&atchFileIdNm=mmAtchFileId&updateType=upload" style="width: 100%;"  frameborder="0" feTitle="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody>
			</table>
		</div>
		
		
		<div class="btn_area">
			<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="btnSubmit('${mainMaVO.mmSeq}');">${not empty mainMaVO.mmSeq ? '수정' : '등록'}</a>
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
function btnSubmit(mmSeq){
	if($("#mmRepresent").val() == "" || $("#mmRepresent").val() == null) {
		fncMsg('mmRepresent',"대표자를 입력하세요"); 
		count++;
	}else{
		$("#mmRepresent").parent().children('strong').remove(); 
		count--;
	}
	
	if($("#mmAddress").val() == "" || $("#mmAddress").val() == null) {
		fncMsg('mmAddress',"주소를 입력하세요"); 
		count++;
	}else{
		$("#mmAddress").parent().children('strong').remove(); 
		count--;
	}
	
	if($("#mmHpNum").val() == "" || $("#mmHpNum").val() == null) {
		fncMsg('mmHpNum',"사업자번호를 입력하세요"); 
		count++;
	}else{
		$("#mmHpNum").parent().children('strong').remove(); 
		count--;
	}
	if(count>0){
		count = 0;  
		return false;
	}
	
	if(mmSeq ==null || mmSeq =='') { // 등록    
		fncPageBoard('write','insertProc.do');
		
	}else { // 수정
		fncPageBoard('update','updateProc.do');
	}
}

// 취소 
function btnCancle(){
	fncPageBoard('view','form.do');
}


</script>