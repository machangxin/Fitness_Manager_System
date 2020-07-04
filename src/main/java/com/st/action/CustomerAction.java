package com.st.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.TableJson;
import com.st.service.CustomerService;
import com.st.service.UserService;

@Controller
@RequestMapping("/sys")
public class CustomerAction {
	@Autowired
	CustomerService cust_ser;

	@RequestMapping("/customer_page")
	public String customer_page() {
		cust_ser.test();
		return "customerPage";
	}
	
	@RequestMapping("customer_list")
	@ResponseBody
	public TableJson customer_list(@RequestParam Map params) {
		int count = cust_ser.getCustomerCount(params);
		return new TableJson(count,cust_ser.customer_list(params));
	}
	
	@RequestMapping("customer_del")
	@ResponseBody
	public void customer_del(@RequestParam Map params) {
		//删除用户信息
		cust_ser.customer_del(params);
	}
	@RequestMapping("customer_update")
	@ResponseBody
	public void user_update(@RequestParam Map params) {
		cust_ser.customer_update(params);
	}
	@RequestMapping("cust_del_more")
	@ResponseBody
	public void cust_del_more(@RequestParam Map params) {
		//删除用户信息
		cust_ser.cust_del_more(params);
	}
	
	@RequestMapping("customer_save")
	@ResponseBody
	public String customer_save(@RequestParam Map params) {
		return cust_ser.customer_save(params);
	}
	@RequestMapping("customer_quit")
	@ResponseBody
	public void customer_quit(@RequestParam Map params) {
		cust_ser.customer_quit(params);
	}
	@RequestMapping("confirmcustname")
	@ResponseBody
	public boolean confirmcustname(@RequestParam Map params) {
		return cust_ser.confirmcustname(params);
	}
	@RequestMapping("/custeditPage")
	public String custeditPage() {
		return "custeditPage";
	}
	@RequestMapping("custeditpass")
	public String custeditpass(@RequestParam Map params,HttpSession session) {
		cust_ser.custeditpass(params,session);
		//session失效
		session.invalidate();
		return "tologin";
	}
	@RequestMapping("custconfirmpass")
	@ResponseBody
	public boolean custconfirmpass(@RequestParam Map params,HttpSession session) {
		return cust_ser.custconfirmpass(params,session);
	}
}
