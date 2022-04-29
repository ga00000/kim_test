package com.open.ft.join;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ft.join.service.JoinVO;
import com.open.ma.login.service.LoginVO;
import com.open.ma.notice.service.NoticeVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class JoinController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Join";

    /** folderPath **/
    private final static String folderPath = "/ft/join/join/";


  
	
    // 약관동의 
    @SuppressWarnings("unchecked")
	@RequestMapping(folderPath+ "agree.do")
	public String agree(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
    	return   ".fLayout:" +  folderPath + "agree";
    	}
    
    // 회원가입 폼 
    @SuppressWarnings("unchecked")
	@RequestMapping(folderPath+ "joinForm.do")
	public String joinForm(@ModelAttribute("searchVO") JoinVO searchVO, String agreeCheck, ModelMap model, HttpServletRequest request) throws Exception {
    	
    	// 약관동의 해야 들어갈 수 있음. 
    	if("yes".equals(agreeCheck)){ 
    		return   ".fLayout:" +  folderPath + "joinForm";
    	}
    	model.addAttribute("message", "비정상적인 접근입니다.");
		model.addAttribute("cmmnScript", "/agree.do");
		return "cmmn/execute";
    	
    	}
    
    // 회원가입 
    @RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") JoinVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		// 비밀번호 암호화 
		if(searchVO.getFtPwd() != null && !"".equals(searchVO.getFtPwd())){
			searchVO.setFtPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getFtPwd().getBytes("UTF-8"))));
		}
		if (procType.equals("insert")) {
			cmmnService.insertContents(searchVO, PROGRAM_ID);
			model.addAttribute("message", "회원가입 되었습니다.");
			model.addAttribute("cmmnScript", "loginForm.do");
			return "cmmn/execute";
		} 
		return "redirect:list.do";
	}
		
    // 아이디 중복체크 
    @ResponseBody // ajax 
	@RequestMapping(folderPath + "idDupCheck.do")
	public boolean idDupCheck(@ModelAttribute("JoinVO") JoinVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		// 동일한 아이디 있음 
		if(cmmnService.selectContents(searchVO, PROGRAM_ID +".idDup" )!= null){
			return true;
		}
		return false;
	}
    
 // 로그인 폼
    @SuppressWarnings("unchecked")
  	@RequestMapping(folderPath+ "loginForm.do")
  	public String loginForm(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
  		
      	return   ".fLayout:" +  folderPath + "loginForm";
      	}
    
    // 로그인 
    @SuppressWarnings("unchecked")
	@RequestMapping(value ="/ft/join/join/ftLoginProcess.do", method = RequestMethod.POST)
	public String loginProcess(@ModelAttribute("searchVO") JoinVO searchVO	, HttpServletRequest request	, ModelMap model	, SessionStatus status) throws Exception {
	
    	// loginVO --> searchVO : id 와 pw null 아니면, 패스워드 암호화 
		if(searchVO.getFtId() != null && searchVO.getFtPwd() != null && !"".equals(searchVO.getFtId()) && !"".equals(searchVO.getFtPwd())){
			searchVO.setFtPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getFtPwd().getBytes("UTF-8"))));
			JoinVO userFtLoginVO  = (JoinVO)cmmnService.selectContents(searchVO, PROGRAM_ID);
			// 로그인 실패 
	    	if(userFtLoginVO == null || userFtLoginVO.getFtId() == null || "".equals(userFtLoginVO.getFtId())){
	    		model.addAttribute("message", "아이디 또는 패스워드를 확인하시기 바랍니다.");
	    		model.addAttribute("cmmnScript", "/ft/join/join/loginForm.do");
	    	}else{
	    		 	// 로그인 성공 - 세션 정보 입력 */
					HttpSession session = request.getSession();					
					session.setAttribute(SessionUtil.SESSION_FRONT_KEY, userFtLoginVO);  // manage -> front
					
					session.setAttribute("loginFtId", userFtLoginVO.getFtId());	//사용자 아이디
					session.setAttribute("loginFtNm", userFtLoginVO.getFtName());	//사용자 이름
					session.setAttribute("loginFtSeq", userFtLoginVO.getFtSeq());	//사용자 일련번호
			    	model.addAttribute("message", "로그인 되었습니다.");
		    		model.addAttribute("cmmnScript", "/ft/main.do");
		    }   
		}else{
			model.addAttribute("message", "로그인 정보가 넘어오지 않았습니다.");
    		model.addAttribute("cmmnScript", "/ft/join/join/loginForm.do");
		}
		return "cmmn/execute";
	}
    
    // 로그아웃 
    @SuppressWarnings("unchecked")
  	@RequestMapping(folderPath+ "logout.do")
  	public String logout(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
  		// 사용자 세션 제거 + 관리자도 제거해야함 
    	HttpSession session = request.getSession(); 
    	session.removeAttribute("loginFtId");
    	session.removeAttribute("loginFtNm");
    	session.removeAttribute("loginFtSeq");
    	
    	model.addAttribute("message", "로그아웃 되었습니다.");
		model.addAttribute("cmmnScript", "/ft/main.do");
		return "cmmn/execute";
    }
    
    // 아이디, 비밀번호 찾기 폼 
    @SuppressWarnings("unchecked")
  	@RequestMapping(folderPath+ "find.do")
  	public String find() throws Exception {
  		
      	return   ".fLayout:" +  folderPath + "find";
      	}
    
    // 아이디 찾기 
    @SuppressWarnings("unchecked")
    @ResponseBody
  	@RequestMapping(folderPath+ "findId.do")
  	public String findId(@ModelAttribute("searchVO") JoinVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
  		
    	JoinVO joinVO = new JoinVO();
		joinVO = (JoinVO) cmmnService.selectContents(searchVO, PROGRAM_ID+".idSelectContents" );
		
		if(joinVO != null){
			model.addAttribute("joinVO", joinVO);
			return joinVO.getFtId();
		}
      	return  "fail";
      	}
    
    // 비밀번호 찾기 
    @SuppressWarnings("unchecked")
  	@RequestMapping(folderPath+ "findPwd.do")
  	public String findPwd(@ModelAttribute("searchVO") JoinVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
  		
    	JoinVO joinVO = new JoinVO();
		joinVO = (JoinVO) cmmnService.selectContents(searchVO, PROGRAM_ID+".pwSelectContents" );
		
		if(joinVO != null){
			return "success";
		}
      	return  "fail";
      	}
    
}
