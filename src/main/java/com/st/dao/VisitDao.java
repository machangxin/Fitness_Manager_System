package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public interface VisitDao {

	void customer_visit(Map params);
	List visitlog_list(Map params);
	List total_sales();
	List cust_total_sales();
	List total_count();
	List month_sales();

}
