package com.st.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.Util.ParamsUtil;
import com.st.dao.costDao;

@Service
	
public class CostService {
	@Autowired
	costDao cost_dao;

	public List costlog_list(Map params) {
		// TODO Auto-generated method stub
			return cost_dao.costlog_list(params);
	}

	public void customer_cost(Map params) {
		// TODO Auto-generated method stub
		ParamsUtil.uuid(params);
		cost_dao.customer_cost(params);
	}
	public List cost_list(Map params) {
		ParamsUtil.page(params);
		return cost_dao.cost_list(params);
	}

	public int getcostCount(Map params) {
		// TODO Auto-generated method stub
		return cost_dao.getcostCount(params);
	}
	public List precost_list(Map params) {
		ParamsUtil.page(params);
		return cost_dao.precost_list(params);
	}

	public int getprecostCount(Map params) {
		// TODO Auto-generated method stub
		return cost_dao.getprecostCount(params);
	}
	public void cost_del(Map params) {
		// TODO Auto-generated method stub
		cost_dao.cost_del(params);
	}

	public void costlog_update(Map params) {
		// TODO Auto-generated method stub
		cost_dao.costlog_update(params);
	}

	public void costlog_del_more(Map params) {
		// TODO Auto-generated method stub
		ParamsUtil.arr_str(params,"costids");
		cost_dao.costlog_del_more(params);
	}

	public void costlog_save(Map params) {
		ParamsUtil.uuid(params);
		cost_dao.costlog_save(params);
	}

	public boolean confirmnull(Map params) {
		// TODO Auto-generated method stub
		if(params.get("cost_money")==""||params.get("cost_money").equals(""))
			return false;
		return true;
	}

	public Map pre_sales() {
		// TODO Auto-generated method stub
		List list = cost_dao.pre_sales();
		Map map = new HashMap();
		List username_List = new ArrayList();
		Map temp = null;
		for (int i = 0; i < list.size(); i++) {
			temp = (Map) list.get(i);
			username_List.add(temp.get("name"));
		}
		map.put("name", username_List);
		map.put("zong", list);
		return map;
	}
	
	public Map month_sales() {
		List list = cost_dao.month_sales();
		Map map = new HashMap();
		List month_sales_List = new ArrayList();
		List month_List = new ArrayList();
		Map temp = null;
		int f = 1;
		for (int i = 0; i < list.size(); i++) {
			temp = (Map) list.get(i);
			month_List.add(temp.get("month"));
			month_sales_List.add(temp.get("buy"));
		}
		map.put("month", month_List);
		map.put("month_sales", month_sales_List);
		return map;
	}

	public Map month_cost(Map params) {
		// TODO Auto-generated method stub
		//System.out.println("ser:"+params);
        String str1 = ParamsUtil.getMapToString(params);
        //System.out.println("serstr1:"+str1);
        Map<String, Object> map1 = ParamsUtil.getStringToMap(str1);
        //System.out.println(map1);
		List list = cost_dao.month_cost(map1);
		Map map = new HashMap();
		List month_sales_List = new ArrayList();
		List month_List = new ArrayList();
		Map temp = null;
		int f = 1;
		for (int i = 0; i < list.size(); i++) {
			temp = (Map) list.get(i);
			month_List.add(temp.get("month"));
			month_sales_List.add(temp.get("buy"));
		}
		map.put("month", month_List);
		map.put("month_sales", month_sales_List);
		//System.out.println(map);
		return map;
	}

	
}
