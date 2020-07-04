package com.st.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.TableJson;
import com.st.service.UserService;

@Controller
@RequestMapping("/sys")
public class UserAction {
	@Autowired
	UserService user_ser;

	@RequestMapping("/user_page")
	public String user_page() {
		user_ser.test();
//		return "WEB-INF/page/userPage.jsp";
		return "userPage";
	}
	
	@RequestMapping("/system")
	public String system_page() {
		return "system";
	}
	
	@RequestMapping("user_list")
	@ResponseBody
	public TableJson user_list(@RequestParam Map params) {
		//将参数传给sql语句
		//service-->dao-->mapper-->sql
		//System.out.println(params);
		//count是所有数据量
		int count = user_ser.getuserCount(params);
		return new TableJson(count,user_ser.user_list(params));
	}

	@RequestMapping("user_del")
	@ResponseBody
	public void user_del(@RequestParam Map params) {
		//删除用户信息
		user_ser.user_del(params);
	}
	@RequestMapping("user_del_more")
	@ResponseBody
	public void user_del_more(@RequestParam Map params) {
		//删除用户信息
		user_ser.user_del_more(params);
	}
	
	@RequestMapping("user_save")
	@ResponseBody
	public String user_save(@RequestParam Map params) {
		System.out.println(params);
		return user_ser.user_save(params);
	}
	
	@RequestMapping("user_update")
	@ResponseBody
	public void user_update(@RequestParam Map params) {
		user_ser.user_update(params);
	}
	@RequestMapping("login_out")
	public String login_out(HttpSession session) {
		//session失效
		session.invalidate();
		return "login";
	}
	@RequestMapping("editpassPage")
	public String editpaddPage() {
		return "editpassPage";
	}
	@RequestMapping("editpass")
	public String editpass(@RequestParam Map params,HttpSession session) {
		user_ser.editpass(params,session);
		//session失效
		session.invalidate();
		return "tologin";
	}
	@RequestMapping("confirmpass")
	@ResponseBody
	public boolean confirmpass(@RequestParam Map params,HttpSession session) {
		return user_ser.confirmpass(params,session);
	}
	
	@RequestMapping("confirmusername")
	@ResponseBody
	public boolean confirmusername(@RequestParam Map params) {
		return user_ser.confirmusername(params);
	}
}
