package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public interface CustomerDao {

	List test();
	List customer_list(Map params);
	int getCustomerCount(Map params);
	void customer_del(Map params);
	void customer_update(Map params);
	void cust_del_more(Map params);
	void customer_save(Map params);
	void customer_track(Map params);
	List publiccustomer_list(Map params);
	int getpublicCustomerCount(Map params);
	int getprivateCustomerCount(Map params);
	List privatecustomer_list(Map params);
	void customer_quit(Map params);
	int confirmcustname(Map params);
	void custeditpass(Map params);
}
