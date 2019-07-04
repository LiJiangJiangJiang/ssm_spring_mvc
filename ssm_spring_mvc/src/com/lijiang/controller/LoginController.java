package com.lijiang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lijiang.bean.User;
import com.lijiang.exception.MyLoginException;

@Controller
@RequestMapping("/login/")
public class LoginController extends BaseController {
	

	
//	登录成功，重定向到列表页
	@RequestMapping(value="doLogin.do",method=RequestMethod.POST)
	public String login(User u,HttpSession session) throws MyLoginException{
			User user=new User();
			user.setUsername("lijiang");
			user.setPassword("123");
			
			if(u.getUsername().equals(user.getUsername())){
				if(u.getPassword().equals(user.getPassword())){
					session.setAttribute("user", u);
				}else{
					throw new MyLoginException("密码错误", u.getUsername());
				}
				
			}
			else{
				throw new MyLoginException("用户名错误");
			}
		    return "redirect:/admin/items/user/allList.do";
	}

	

////	登录失败，前往登录页面
//	@RequestMapping(value="login.do",method=RequestMethod.GET)
//	public String login(){
//		
//		return "login_page";
//	}
	
//	登录失败，前往登录页面
	@RequestMapping("login.do")
	public String login(){
		
		return "login_page";
	}
}
