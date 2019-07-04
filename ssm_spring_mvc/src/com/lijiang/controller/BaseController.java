package com.lijiang.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lijiang.exception.MyException;
import com.lijiang.exception.MyLoginException;



public class BaseController {
	
//	处理运行时异常 RuntimeException
	@ExceptionHandler(RuntimeException.class)
	@ResponseBody
	public String runtimeHandler(RuntimeException e){
		return e.getMessage();
	}
	
//	处理自定义异常 MyException
	@ExceptionHandler(MyException.class)
	public String myException(MyException e,Model model){
		model.addAttribute("error", e.getMsg()+" "+e.getStackTrace()[0]);
		return "error";
	}
	
//	处理自定义异常 MyLoginException
	@ExceptionHandler(MyLoginException.class)
	public String loginException(MyLoginException e,Model model){
		Object obj=e.getObj();
		if(obj!=null){
			model.addAttribute("username", obj.toString());
		}
		model.addAttribute("errorMsg", e.getMsg());
		return "login_page";
	}

}
