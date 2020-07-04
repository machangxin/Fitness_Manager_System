package com.st.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.Util.Md5;
import com.st.Util.ParamsUtil;
import com.st.dao.CustomerDao;
import com.st.dao.UserDao;

@Service
public class CustomerService {
	@Autowired
	CustomerDao cust_dao;
	
	public void test() {
		List list=cust_dao.test();
		for(Object obj:list) {
			System.out.println(obj);
		}
	}
	
	public List customer_list(Map params) {
		ParamsUtil.page(params);
		return cust_dao.customer_list(params);
	}

	public int getCustomerCount(Map params) {
		// TODO Auto-generated method stub
		return cust_dao.getCustomerCount(params);
	}

	public void customer_del(Map params) {
		// TODO Auto-generated method stub
		cust_dao.customer_del(params);
	}

	public void customer_update(Map params) {
		// TODO Auto-generated method stub
		cust_dao.customer_update(params);
	}

	public void cust_del_more(Map params) {
		// TODO Auto-generated method stub
		ParamsUtil.arr_str(params,"custids");
		cust_dao.cust_del_more(params);
	}

	public String customer_save(Map params) {
		ParamsUtil.uuid(params);
		String initpassString = ParamsUtil.initpass(params,params.get("uuid").toString());
		cust_dao.customer_save(params);
		return initpassString;
	}

	public void customer_quit(Map params) {
		// TODO Auto-generated method stub
		ParamsUtil.state(params, 0);
		cust_dao.customer_quit(params);
	}

	public boolean confirmcustname(Map params) {
		// TODO Auto-generated method stub
		int count = cust_dao.confirmcustname(params);
		//System.out.println(count);
		if(count==0) return true;
		return false;
	}

	public void custeditpass(Map params, HttpSession session) {
		// TODO Auto-generated method stub
		Map user=(Map)session.getAttribute("loginuser");
		String user_salt_iString=user.get("cust_id").toString();
		int hashint=Integer.parseInt(user_salt_iString.substring(user_salt_iString.length()-4));
		String md5pass = Md5.md5(params.get("user_newpass").toString(), user_salt_iString, hashint);
		params.put("newpass", md5pass);
		params.put("user_id",user_salt_iString);
		cust_dao.custeditpass(params);	
	}

	public boolean custconfirmpass(Map params, HttpSession session) {
		// TODO Auto-generated method stub
		String pass = params.get("oldpass")+"";
		Map user=(Map)session.getAttribute("loginuser");
		System.out.println("session:"+session.getAttribute("loginuser"));
		String user_salt_iString=user.get("cust_id").toString();
		int hashint=Integer.parseInt(user_salt_iString.substring(user_salt_iString.length()-4));
		String md5pass = Md5.md5(pass, user_salt_iString, hashint);
		return md5pass.equals(user.get("cust_loginpass"));
	}
}
