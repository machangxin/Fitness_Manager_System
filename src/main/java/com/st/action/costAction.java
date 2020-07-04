package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.Util.ParamsUtil;
import com.st.bean.TableJson;
import com.st.service.CostService;

@Controller
public class costAction {
	@Autowired
	CostService cost_ser;
	
	
	@RequestMapping("cost_Page")
	public String cost_page() {
		return "costPage";
	}
	
	@RequestMapping("cost_list")
	@ResponseBody
	public TableJson cost_list(@RequestParam Map params) {
		//将参数传给sql语句
		//service-->dao-->mapper-->sql
		//System.out.println(params);
		//count是所有数据量
		int count = cost_ser.getcostCount(params);
		return new TableJson(count,cost_ser.cost_list(params));
	}
	@RequestMapping("precost_list")
	@ResponseBody
	public TableJson precost_list(@RequestParam Map params) {
		//System.out.println(params);
		String ss=(String)params.get("cust_id");
		ss=ss.replace('=', ':');
        Map<String, Object> map1 = ParamsUtil.getStringToMap(ss);
       // System.out.println("map"+map1);
        params.putAll(map1);
        //System.out.println(params);
		int count = cost_ser.getprecostCount(params);
		return new TableJson(count,cost_ser.precost_list(params));
	}
	
	//跳转到回放记录界面
		@RequestMapping("costlogPage")
		public String costlogPage(@RequestParam Map params,HttpServletRequest request) {
			List loglist = cost_ser.costlog_list(params);
			request.setAttribute("loglist", loglist);
			return "costlogPage";
		}
		@RequestMapping("datatable_page")
		public String datatable_page() {
			return "datatablePage";
		}
		@RequestMapping("datatable1_page")
		public String datatable1_page() {
			return "datatableoPage";
		}
		@RequestMapping("custdatatablePage")
		public String custdatatablePage(@RequestParam Map params,HttpServletRequest request) {
			request.setAttribute("cust_id",params);
			return "custdatatablePage";
		}
		@RequestMapping("custcost_Page")
		public String custcost_Page(@RequestParam Map params,HttpServletRequest request) {
			request.setAttribute("cust_id",params);
			return "custcost_page";
		}
		@RequestMapping("customer_cost")
		@ResponseBody
		public void customer_cost(@RequestParam Map params) {
			cost_ser.customer_cost(params);
		}
		@RequestMapping("cost_del")
		@ResponseBody
		public void cost_del(@RequestParam Map params) {
			//删除用户信息
			cost_ser.cost_del(params);
		}
		@RequestMapping("costlog_update")
		@ResponseBody
		public void costlog_update(@RequestParam Map params) {
			cost_ser.costlog_update(params);
		}
		@RequestMapping("costlog_del_more")
		@ResponseBody
		public void costlog_del_more(@RequestParam Map params) {
			//删除用户信息
			cost_ser.costlog_del_more(params);
		}
		@RequestMapping("costlog_save")
		@ResponseBody
		public void costlog_save(@RequestParam Map params) {
			cost_ser.costlog_save(params);
		}
		@RequestMapping("confirmnull")
		@ResponseBody
		public boolean confirmcustname(@RequestParam Map params) {
			return cost_ser.confirmnull(params);
		}
		@RequestMapping("month_sales")
		@ResponseBody
		public Map month_sales() {
			//System.out.println(cost_ser.month_sales());
			return cost_ser.month_sales();
		}
		@RequestMapping("month_cost")
		@ResponseBody
		public Map month_cost(@RequestParam Map params) {
			//System.out.println(params);
			return cost_ser.month_cost(params);
		}
		@RequestMapping("pre_sales")
		@ResponseBody
		public Map pre_sales() {
			return cost_ser.pre_sales();
		}
}
