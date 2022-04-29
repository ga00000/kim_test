package com.open.cmmn.interceptor;

import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ma.login.service.LoginVO;
import com.open.ma.sys.mn.service.MnVO;

public class FrontInterceptor extends HandlerInterceptorAdapter implements HandlerInterceptor {


	@Autowired
	private CmmnService cmmnService;

	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler) throws Exception {
		
		CmmnDefaultVO searchVO = new CmmnDefaultVO();
		
		List<MnVO> menuList = (List<MnVO>) cmmnService.selectList(searchVO, "Mn.frontMenuList"); // 대리스트
		for (MnVO mnVO : menuList) {
			List<MnVO> subMenuList = (List<MnVO>) cmmnService.selectList(mnVO, "Mn.frontSubMenuList"); // 소리스트
			mnVO.setMenuList(subMenuList); // 대+소리스트 
		}
		HttpSession session = request.getSession(); 
		session.setAttribute("ftMenuList", menuList);
		
		return true;
	}

	@Override
	public void afterCompletion(final HttpServletRequest request, final HttpServletResponse response, final Object handler, final Exception ex) throws Exception {
		long endTime = System.currentTimeMillis();
	}
}