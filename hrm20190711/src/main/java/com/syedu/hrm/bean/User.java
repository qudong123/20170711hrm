package com.syedu.hrm.bean;

import org.apache.ibatis.type.Alias;

/**
 * User 数据传输类
 * @author qxy
 * @email 1766181826@qq.com
 * @date 2019-07-29 13:40:41
 * @version 1.0
 */
@Alias("User")
public class User implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String passWord;
	private int status;
	private java.util.Date createDate;

	/** setter and getter method */
	public void setId(int id){
		this.id = id;
	}
	public int getId(){
		return this.id;
	}
	public void setName(String name){
		this.name = name;
	}
	public String getName(){
		return this.name;
	}
	public void setPassWord(String passWord){
		this.passWord = passWord;
	}
	public String getPassWord(){
		return this.passWord;
	}
	public void setStatus(int status){
		this.status = status;
	}
	public int getStatus(){
		return this.status;
	}
	public void setCreateDate(java.util.Date createDate){
		this.createDate = createDate;
	}
	public java.util.Date getCreateDate(){
		return this.createDate;
	}

}