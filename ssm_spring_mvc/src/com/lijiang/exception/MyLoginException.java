package com.lijiang.exception;

public class MyLoginException extends Exception {

	private String msg;

	private Object obj;

	public String getMsg() {
		return msg;
	}

	public Object getObj() {
		return obj;
	}

	
	public MyLoginException(String msg) {
		super();
		this.msg = msg;
	}

	public MyLoginException(String msg, Object obj) {
		super();
		this.msg = msg;
		this.obj = obj;
	}
	
	
}
