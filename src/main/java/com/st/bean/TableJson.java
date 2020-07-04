package com.st.bean;

import java.util.List;

public class TableJson {
	private int code=0;
	private String msg="";
	private int count;
	private List data;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List getData() {
		return data;
	}
	public void setData(List data) {
		this.data = data;
	}
	
	public TableJson(int count,List data) {
		this.count=count;
		this.data=data;
		
	}
	
}
