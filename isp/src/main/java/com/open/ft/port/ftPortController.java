package com.open.ft.port;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ma.port.service.PortVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class ftPortController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Port";

    /** folderPath **/
    private final static String folderPath = "/ft/port/port/";


	/**
	 * 메뉴권한 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "{procType}/list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, @PathVariable String procType, ModelMap model, HttpServletRequest request) throws Exception {

		return ".fLayout:"+ folderPath + "list";
	}
	
	/**
	 * 메뉴권한 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(folderPath + "{procType}/addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO,@PathVariable String procType, ModelMap model, HttpServletRequest request) throws Exception {
		

		searchVO.setPageSize(10);
		searchVO.setPageUnit(10);


		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		if(procType.equals("port1")){
			searchVO.setSchEtc02("port1");
		}if(procType.equals("port2")){
			searchVO.setSchEtc02("port2");
		}if(procType.equals("port3")){
			searchVO.setSchEtc02("port3");
		}if(procType.equals("port4")){
			searchVO.setSchEtc02("port4");
		}
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID+".ftSelectCount" );
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		

		@SuppressWarnings("unchecked")
		List<PortVO> resultList = (List<PortVO>) cmmnService.selectList(searchVO, PROGRAM_ID+".ftSelectList" );
		model.addAttribute("resultList", resultList);
		
		
		return folderPath + "addList";
	}



	/**
	 * 메뉴권한 상세화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"{procType}/view.do")
	public String view(@ModelAttribute("searchVO") PortVO searchVO, @PathVariable String procType,  Model model, HttpServletRequest request) throws Exception {
		// 포트폴리오 구분값 
		if(procType.equals("port1")){
			searchVO.setSchEtc02("port1");
		}if(procType.equals("port2")){
			searchVO.setSchEtc02("port2");
		}if(procType.equals("port3")){
			searchVO.setSchEtc02("port3");
		}if(procType.equals("port4")){
			searchVO.setSchEtc02("port4");
		}
		
		/* 게시판 상세정보 */
		PortVO portVO = new PortVO();
		portVO = (PortVO) cmmnService.selectContents(searchVO, PROGRAM_ID+".ftSelectContents" );
		model.addAttribute("portVO", portVO);
		
		List<Integer> fileSn = (List<Integer>) cmmnService.selectList(portVO, PROGRAM_ID+".fileSnlist" );
		model.addAttribute("fileSn", fileSn);
		
		return ".fLayout:"+ folderPath + "view";
	}

	/**
	 * 메뉴권한 등록화면
	 * @param searchVO
	 * @param model
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") PortVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		PortVO portVO = new PortVO();
		if (procType.equals("update")) {
			portVO = (PortVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		model.addAttribute("portVO", portVO);

		return ".fLayout:"+ folderPath + "form";
	}

	/**
	 * 메뉴권한 처리
	 * @param searchVO
	 * @param model
	 * @param status
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") PortVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		
		if(procType != null){
			
			if (procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				model.addAttribute("message", "등록되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
				
			} else if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);	
				model.addAttribute("message", "수정되었습니다.");
				model.addAttribute("pName", "ptSeq");	
				model.addAttribute("pValue", searchVO.getPtSeq());
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
				
			} else if (procType.equals("delete")) {				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				model.addAttribute("message", "삭제되었습니다..");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
				
	    	}else{
	    		return "redirect:list.do";
	    	}
		}

		return "redirect:list.do";

	}

	

	
		

}
