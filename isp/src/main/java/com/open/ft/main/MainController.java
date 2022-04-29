package com.open.ft.main;

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
import com.open.ma.banner.service.BannerVO;
import com.open.ma.free.service.FreeVO;
import com.open.ma.mainMa.service.MainMaVO;
import com.open.ma.notice.service.NoticeVO;
import com.open.ma.port.service.PortVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class MainController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Main";

    /** folderPath **/
    private final static String folderPath = "/ft/main/main/";


    @SuppressWarnings("unchecked")
	@RequestMapping("/ft/main.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(); 
		
		MainMaVO mainMaVO = new MainMaVO(); // 메인관리 데이터 뿌리기
		mainMaVO = (MainMaVO) cmmnService.selectContents(searchVO, "MainMa" );
		session.setAttribute("mainMaVO", mainMaVO);
		
		List<Integer> mainFileSn = (List<Integer>) cmmnService.selectList(mainMaVO, "MainMa.fileSnlist"); // 메인관리 fileSn
		session.setAttribute("mainFileSn", mainFileSn); 
		
		// 배너관리 
		List<BannerVO> bannerList = (List<BannerVO>) cmmnService.selectList(searchVO, "Banner.mainBannerList" );
		session.setAttribute("bannerList", bannerList);
		// 공지사항
		List<NoticeVO> noticeList = (List<NoticeVO>) cmmnService.selectList(searchVO, "Notice.mainNoticeList" );
		session.setAttribute("noticeList", noticeList);
		// 포트폴리오
		List<PortVO> portList = (List<PortVO>) cmmnService.selectList(searchVO, "Port.mainPortselectList" );
		session.setAttribute("portList", portList);
		
		
		
		return  folderPath + "main";
	}
	

	

	
		

}
