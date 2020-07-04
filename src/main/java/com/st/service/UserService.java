package com.st.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.Util.Md5;
import com.st.Util.ParamsUtil;
import com.st.dao.UserDao;
@Service
public class UserService {
	@Autowired
	UserDao user_dao;
	
	public void test() {
		List list=user_dao.test();
		for(Object obj:list) {
			System.out.println(obj);
		}
	}
	
	public List user_list(Map params) {
		ParamsUtil.page(params);
		List<Map> list = user_dao.user_list(params);
		for(Map a: list) {
			//System.out.println(a);
			if(a.get("user_state").equals("1")) {
				a.remove("user_state");
				a.put("user_state",true);
			}else {
				a.remove("user_state");
				a.put("user_state",false);
			}
			//System.out.println(a);
		}
		return list;
	}

	public int getuserCount(Map params) {
		// TODO Auto-generated method stub
		return user_dao.getuserCount(params);
	}

	public void user_del(Map params) {
		user_dao.user_del(params);
	}
	public String user_save(Map params) {
		ParamsUtil.uuid(params);
		String initpassString = ParamsUtil.initpass(params,params.get("uuid").toString());
		if(params.get("switch")!=null) {
			params.put("user_state","1");
		}else {
			params.put("user_state","0");
		}
		user_dao.user_save(params);
		return initpassString;
	}
	public void user_del_more(Map params) {
		// TODO Auto-generated method stub
		//将userids={1,2,}改成userids={'1','2'}
		ParamsUtil.arr_str(params,"userids");
		user_dao.user_del_more(params);
		
	}
	public void user_update(Map params) {
		System.out.println(params);
		if(params.get("switch")!=null) {
			params.put("user_state","1");
		}else {
			params.put("user_state","0");
		}
		System.out.println(params);
		user_dao.user_update(params);
	}

	public int login(Map params,HttpSession session) {
		// TODO Auto-generated method stub
		//根据用户名查询,是否有该用户的信心
		//System.out.println();
		if(params.get("choose").toString().equals("user")){
			List list = user_dao.user_login(params);
			if(list!=null&&list.size()==1) {
				Map user=(Map)list.get(0);
				String user_salt_iString=user.get("user_id").toString();
				int hashint=Integer.parseInt(user_salt_iString.substring(user_salt_iString.length()-4));
				//有:查询密码是否正确
				String md5pass = Md5.md5(params.get("login_pass").toString(), user_salt_iString, hashint);
				if(md5pass.equals(user.get("user_loginpass"))) {
					session.setAttribute("loginuser", user);
					session.setAttribute("loginuserid", user.get("user_id"));
					if(user.get("user_state").equals("1")) {
						return 3;
					}else {
						return 1;	
					}
					
				}
				//没有,密码错误:登陆失败
			}
			return 0;	
		}else {
			List list = user_dao.cust_login(params);
			if(list!=null&&list.size()==1) {
				Map user=(Map)list.get(0);
				String user_salt_iString=user.get("cust_id").toString();
				//System.out.println(user_salt_iString);
				int hashint=Integer.parseInt(user_salt_iString.substring(user_salt_iString.length()-4));
				//有:查询密码是否正确
				String md5pass = Md5.md5(params.get("login_pass").toString(), user_salt_iString, hashint);
				//System.out.println("md5pass:"+md5pass);
				if(md5pass.equals(user.get("cust_loginpass"))) {
					session.setAttribute("loginuser", user);
					session.setAttribute("loginuserid", user.get("cust_id"));
					return 2;
				}
				//没有,密码错误:登陆失败
			}
			return 0;	
		}
		
	}
	public void editpass(Map params,HttpSession session) {
		Map user=(Map)session.getAttribute("loginuser");
		String user_salt_iString=user.get("user_id").toString();
		int hashint=Integer.parseInt(user_salt_iString.substring(user_salt_iString.length()-4));
		String md5pass = Md5.md5(params.get("user_newpass").toString(), user_salt_iString, hashint);
		params.put("newpass", md5pass);
		params.put("user_id",user_salt_iString);
		user_dao.editpass(params);	
	}

	public boolean confirmpass(Map params, HttpSession session) {
		String pass = params.get("oldpass")+"";
		Map user=(Map)session.getAttribute("loginuser");
		String user_salt_iString=user.get("user_id").toString();
		int hashint=Integer.parseInt(user_salt_iString.substring(user_salt_iString.length()-4));
		String md5pass = Md5.md5(pass, user_salt_iString, hashint);
		return md5pass.equals(user.get("user_loginpass"));
	}

	public boolean confirmusername(Map params) {
		// TODO Auto-generated method stub
		int count = user_dao.confirmusername(params);
		if(count==0) return true;
		return false;
	}
}