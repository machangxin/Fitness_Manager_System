package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface  costDao {

	List costlog_list(Map params);

	void customer_cost(Map params);

	List cost_list(Map params);

	int getcostCount(Map params);

	void cost_del(Map params);

	void costlog_update(Map params);

	void costlog_del_more(Map params);

	int confirmname(Map params);


	void costlog_save(Map params);

	List month_sales();

	List pre_sales();

	List month_cost(Map params);

	List precost_list(Map params);

	int getprecostCount(Map params);

}
