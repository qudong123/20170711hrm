package com.syedu.hrm.bean;

import org.apache.ibatis.type.Alias;

/**
 * Document 数据传输类
 * @author qxy
 * @email 1766181826@qq.com
 * @date 2019-07-29 13:40:41
 * @version 1.0
 */
@Alias("Document")
public class Document implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private int id;
	private String title;
	private String url;
	private String remark;
	private java.util.Date createDate;
	private int userId;

	private User user;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	/** setter and getter method */
	public void setId(int id){
		this.id = id;
	}
	public int getId(){
		return this.id;
	}
	public void setTitle(String title){
		this.title = title;
	}
	public String getTitle(){
		return this.title;
	}
	public void setUrl(String url){
		this.url = url;
	}
	public String getUrl(){
		return this.url;
	}
	public void setRemark(String remark){
		this.remark = remark;
	}
	public String getRemark(){
		return this.remark;
	}
	public void setCreateDate(java.util.Date createDate){
		this.createDate = createDate;
	}
	public java.util.Date getCreateDate(){
		return this.createDate;
	}
	public void setUserId(int userId){
		this.userId = userId;
	}
	public int getUserId(){
		return this.userId;
	}

}