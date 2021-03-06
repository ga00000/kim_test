<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>


	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type = 'text'  id= "ptSeq" name ="ptSeq" value="${portVO.ptSeq}">
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="ptAtchFileId" id="ptAtchFileId"/>
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
							${portVO.ptRgstId }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${portVO.ptRgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3">
							${portVO.ptTitle }
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>게시판 구분</strong></th>
						<td colspan="3">
							${portVO.ptSelect eq 'port1' ? '시공사례' : '' }
							${portVO.ptSelect eq 'port2' ? '추천설계' : '' }
							${portVO.ptSelect eq 'port3' ? '시공현장' : '' }
							${portVO.ptSelect eq 'port4' ? '인테리어사례' : '' }
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(portVO.ptCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
							<td colspan="3">
								<c:forEach var="fileSn" items="${fileSn}"> 
									<li><img src="/atch/getImage.do?atchFileId=${portVO.ptAtchFileId }&fileSn=${fileSn}" alt="" ></li>
								</c:forEach>
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
