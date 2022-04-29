<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>

<style>
* {box-sizing:border-box;}
.btn {display: inline-block;font-weight: normal;text-align: center;vertical-align: middle;cursor: pointer;
border:1px solid transparent;
border-color: rgba(0, 0, 0, 0);
white-space: nowrap;
font-size: 12px;
color:#fff;
line-height: 1;
border-radius: 2px;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
user-select: none;}
.btn_big {width:150px;height:50px;line-height:50px;}
.btn_cancel {color:#000;background:#fff;border-color:#000;}
.btn_join {color:#fff;background:#308cde;}
 
 
/* join */
.join_wrap {position:relative;width:50%;padding:50px;margin: 0 auto;}
.join_wrap h2 {margin-bottom:15px;text-align:center;font-size:26px;}
.join_form {border-left:0px solid #dfdfdf;}
.join {position:relative;}
.join .input_box {position:relative; margin-top:6px;padding-left:48px;border:1px solid #e3e3e3;}
.join .last .input_box {padding-right:120px;}
.join span {position:absolute;left:-1px;top:-1px;bottom:-1px;width:48px;line-height:48px;text-indent:-9999em;border-right:1px solid #e3e3e3;}
.join .i_em {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_em.png) no-repeat 50% 50%}
.join .i_pw {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_pw.png) no-repeat 50% 50%}
.join .i_pwr {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_pwr.png) no-repeat 50% 50%}
.join .i_nm {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_nm.png) no-repeat 50% 50%}
.join .i_ph {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_ph.png) no-repeat 50% 50%}
.join .i_ph02 {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_ph.png) no-repeat 50% 50%}
.join .text {width:100%;height:48px;border:0;}
.identify_time {position:absolute;right:150px;bottom:15px;}
.join_error p {color: red;display:none;}
.btn_identify {position: absolute;right: -1px;top:-1px;bottom:-1px;display:block;width: 120px;line-height:48px; text-align:center; color:#308cde;border:1px solid #308cde;background:#fff;}
.btn_identify02 {position: absolute;right: -1px;top:-1px;bottom:-1px;display:block;width: 120px;line-height:48px; text-align:center; color:#000;border:1px solid #e8e8e8;background:#e8e8e8;}
 
/*약관*/
.terms_box {margin:15px 0; background: #fff;}
.all_check {border:1px solid #e6e6e6;}
.terms_view {border:1px solid #e6e6e6;border-top:0;}
.terms_view dt {position:relative;}
.terms_view dd {padding:12px 3%;font-size:12px;border-top:1px solid #eee;border-bottom:1px solid #eee;}
.btn_terms {position:absolute; right:20px;top:0; width:40px;height:100%;text-indent:-9999em;background-image: url(http://opennote.co.kr/guide/images/sample/terms_arrow.png); background-repeat: no-repeat; background-position: 100% 50%; background-size:auto 25px;-webkit-transition: all 0.1s ease-out;-moz-transition: all 0.1s ease-out; -ms-transition: all 0.1s ease-out;-o-transition: all 0.1s ease-out;transition: all 0.1s ease-out;}
.expanded .btn_terms {background-position:50% 50%;-webkit-transform: rotateZ(90deg); -ms-transform: rotateZ(90deg); transform: rotateZ(90deg);}
.terms_box .checkboxs {padding:10px 3%;background:#fff;}
.terms_box .checkboxs input[type="checkbox"] {position: absolute;left: -9999em;}
.terms_box .checkboxs label {display: inline-block;line-height: 25px;padding-left:28px;min-width: 25px;min-height: 25px;margin-right: 10px;letter-spacing:-0.06em;background: url(http://opennote.co.kr/guide/images/sample/terms_check_off.png) no-repeat 0 50%;background-size:auto 25px;}
.terms_box .checkboxs input[type="checkbox"]:checked + label {background: url(http://opennote.co.kr/guide/images/sample/terms_check_on.png) no-repeat 0 50%;background-size:auto 25px;}
 
.join_btns {margin-top:25px;text-align:center;}

</style>

<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
<form name="defaultFrm" id="defaultFrm" method="post">
	<input type="hidden" id="ftSeq" name="ftSeq"/>
	<input type="hidden" id="ftSeq" name="ftSeq"/>
	<input type="hidden" id="ftSeq" name="ftSeq"/>
	<input type="hidden" id="ftSeq" name="ftSeq"/>

<div class="content_box">
	<div class="join_wrap">
	    <div class="join_form">
	    <h2>아이디 찾기 </h2>
	        <ul class="join js-join">
	            <li>
	            	  <div class="input_box">
	                    <span class="i_nm">이메일</span><input type="text" class="text js-text"  id="ftEmail1" maxlength="10"  placeholder="이메일" />
	                </div>
	                
	            <li class="last">
	                <div class="input_box">
	                    <span class="i_ph">핸드폰번호</span><input type="text" class="text js-text"    id="ftHp1"  maxlength="10" placeholder="휴대폰 번호" />
	                </div>
	            </li>
	        </ul>
	     </div>
	    <div id="get_id"></div>
	    <div class="join_btns">
	        <a href="#" class="btn btn_big btn_join" onclick="btnId();">아이디 찾기 </a>
	    </div>
	    
	    <div class="join_form">
	    <h2>비밀번호 찾기 </h2>
	        <ul class="join js-join">
	            <li>
	            	  <div class="input_box">
	                    <span class="i_nm">아이디</span><input type="text" class="text js-text"  id="ftId2" maxlength="10"  placeholder="아이디" />
	                </div>
	                
	                <div class="input_box">
	                    <span class="i_em">메일</span><input type="text" class="text js-text"  id="ftEmail2" maxlength="10"   placeholder="이메일" />
	                </div>
	            </li>
	            <li class="last">
	                <div class="input_box">
	                    <span class="i_ph">핸드폰번호</span><input type="text" class="text js-text"  id="ftHp2"  maxlength="10" placeholder="휴대폰 번호" />
	                </div>
	            </li>
	        </ul>
	     </div>
	    <div class="join_btns">
	        <a href="#" class="btn btn_big btn_join" onclick="btnPwd();">비밀번호 찾기</a>
	    </div>
	    
	</div>
</div>
</form>


<script type="text/javascript">

function fncMsg(id,msg){
	var MsgHtml = '<strong><font color ="red">'+msg+'</strong>'
	$("#"+id).parent().children('strong').remove(); 
	if(msg!=null || msg !=''){
		$("#"+id).parent().append(MsgHtml); 
	}
}

// 아이디 찾기 ajax 
function btnId(){
	if($("#ftEmail1").val() == "" || $("#ftEmail1").val() == null){
		fncMsg('ftEmail1',"이메일을 입력해주세요.")
	}else{
		fncMsg('ftEmail1',"")
	}
	
	if($("#ftHp1").val() == "" || $("#ftHp1").val() == null){
		fncMsg('ftHp1',"휴대폰 번호를 입력해주세요.")
	}else{
		fncMsg('ftHp1',"")
	}
	
	$("#ftEmail").val( $("#ftEmail1").val() );
	$("#ftHp").val( $("#ftHp1").val() );
	
	 $.ajax({  
		 method: "POST",  
   		 url: '/ft/join/join/findId.do',  
   		 data : $("#defaultFrm").serialize(), 
   		 dataType: "text", 
   		 success: function(data) {
   			var dataHtml = '<strong><font color="red"> 아이디는 '+data+' 입니다. </font></strong>';
   			$("#get_id").html(dataHtml);
   			if(data == "fail" ){
   				var dataHtml = '<strong><font color="red"> 일치하는 값이 없습니다. </font></strong>';
   				$("#get_id").html(dataHtml);
   			}
   		 }
	});
}
// 비밀번호 찾기 
function btnPwd(){
	if($("#ftId2").val() == "" || $("#ftId2").val() == null){
		fncMsg('ftId2',"아이디를 입력해주세요.")
	}else{
		fncMsg('ftId2',"")
	}
	
	if($("#ftEmail2").val() == "" || $("#ftEmail2").val() == null){
		fncMsg('ftEmail2',"이메일을 입력해주세요.")
	}else{
		fncMsg('ftEmail2',"")
	}
	
	if($("#ftHp2").val() == "" || $("#ftHp2").val() == null){
		fncMsg('ftHp2',"휴대폰 번호를 입력해주세요.")
	}else{
		fncMsg('ftHp2',"")
	}
	$("#ftEmail").val( $("#ftEmail2").val() );
	$("#ftHp").val( $("#ftHp2").val() );
	$("#ftId").val( $("#ftId2").val() );
	
	
	$.ajax({  
		 method: "POST",  
  		 url: '/ft/join/join/findPwd.do',  
  		 data : $("#defaultFrm").serialize(), 
  		 dataType: "text", 
  		 success: function(data) {
  			if(data =="success"){
  				alert("회원정보가 일치합니다.");
  				fncPageBoard('view','updatePwd.do');
  			}
  			if(data == "fail" ){
  				alert("회원정보가 불일치합니다.");
  				fncPageBoard('view','find.do');;
  			}
  		 }
	});
	
// 	fncPageBoard('write','findPwd.do');
// 	return false; 
}

function btnCancel(){
	fncPageBoard('view','/ft/main.do');
}
</script>