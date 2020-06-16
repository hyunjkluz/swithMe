package ssd.pbl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import ssd.pbl.model.LoginForm;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginInterceptor.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Usersession이 있는지 확인
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");

		// Request URL에서 맨 뒤에 있는 PerformerId만 걸러내는 과정
		String url = request.getRequestURL().toString();

		if (userSession == null) {
			ModelAndView modelAndView = new ModelAndView("/auth/LoginForm");

			LoginForm loginForm = new LoginForm();
			modelAndView.addObject("loginForm", loginForm);
			// 로그인 이후 처리를 위해 이전의 request mapping을 저장
			modelAndView.addObject("loginForwardAction", url);
			
			LOGGER.info("이전 URL : " + url);

			throw new ModelAndViewDefiningException(modelAndView);
		} else {
			return true;
		}
	}

}
