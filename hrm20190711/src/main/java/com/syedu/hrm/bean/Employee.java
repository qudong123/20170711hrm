package com.syedu.hrm.bean;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Employee 数据传输类
 * @author qxy
 * @email 1766181826@qq.com
 * @date 2019-07-29 13:40:41
 * @version 1.0
 */
@Alias("Employee")
public class Employee implements java.io.Serializable{


    //员工管理的dept和job
	 private Dept dept;
	 private Job job;


	private static final long serialVersionUID = 1L;
	private int id;
	private int deptId;
	private int jobId;
	private String name;
	private String cardId;
	private String address;
	private String postCode;
	private String tel;
	private String phone;
	private String qqNum;
	private String email;
	private int sex;
	private String party;
	//由于页面上过来的是字符串
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private java.util.Date birthday;
	private String race;
	private String education;
	private String speciality;
	private String picture;
	private String hobby;
	private String remark;
	private java.util.Date createDate;


	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	/** setter and getter method */
	public void setId(int id){
		this.id = id;
	}
	public int getId(){
		return this.id;
	}
	public void setDeptId(int deptId){
		this.deptId = deptId;
	}
	public int getDeptId(){
		return this.deptId;
	}
	public void setJobId(int jobId){
		this.jobId = jobId;
	}
	public int getJobId(){
		return this.jobId;
	}
	public void setName(String name){
		this.name = name;
	}
	public String getName(){
		return this.name;
	}
	public void setCardId(String cardId){
		this.cardId = cardId;
	}
	public String getCardId(){
		return this.cardId;
	}
	public void setAddress(String address){
		this.address = address;
	}
	public String getAddress(){
		return this.address;
	}
	public void setPostCode(String postCode){
		this.postCode = postCode;
	}
	public String getPostCode(){
		return this.postCode;
	}
	public void setTel(String tel){
		this.tel = tel;
	}
	public String getTel(){
		return this.tel;
	}
	public void setPhone(String phone){
		this.phone = phone;
	}
	public String getPhone(){
		return this.phone;
	}
	public void setQqNum(String qqNum){
		this.qqNum = qqNum;
	}
	public String getQqNum(){
		return this.qqNum;
	}
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	public void setSex(int sex){
		this.sex = sex;
	}
	public int getSex(){
		return this.sex;
	}
	public void setParty(String party){
		this.party = party;
	}
	public String getParty(){
		return this.party;
	}
	public void setBirthday(java.util.Date birthday){
		this.birthday = birthday;
	}
	public java.util.Date getBirthday(){
		return this.birthday;
	}
	public void setRace(String race){
		this.race = race;
	}
	public String getRace(){
		return this.race;
	}
	public void setEducation(String education){
		this.education = education;
	}
	public String getEducation(){
		return this.education;
	}
	public void setSpeciality(String speciality){
		this.speciality = speciality;
	}
	public String getSpeciality(){
		return this.speciality;
	}
	public void setPicture(String picture){
		this.picture = picture;
	}
	public String getPicture(){
		return this.picture;
	}
	public void setHobby(String hobby){
		this.hobby = hobby;
	}
	public String getHobby(){
		return this.hobby;
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

}