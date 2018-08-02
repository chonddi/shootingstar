package com.ss.star.admin.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


@Component
public class AdminLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// HandlerInterceptorAdapter 에서 override
		String adminId= (String) request.getSession().getAttribute("adminId");
		
		if(adminId==null || adminId.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.print("alert('관리자 로그인을 하세요!!');"); 
			out.print("location.href='"+request.getContextPath()
					+"/admin/login/login.do';");
			out.println("</script>");
			return false;
		}else {
			return true;
		}
		
	}
}
