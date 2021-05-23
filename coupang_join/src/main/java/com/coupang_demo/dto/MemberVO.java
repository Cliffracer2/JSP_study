package com.coupang_demo.dto;

public class MemberVO {
	private Integer memberNumber;
	private String email;
	private String password;
	private String name;
	private String phone;
	private String postCode;
	private String address;
	private String joinDate;
	private String memberGrade;
	
	public Integer getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(Integer memberNumber) {
		this.memberNumber = memberNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String psw) {
		this.password = psw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String strDate) {
		this.joinDate = strDate;
	}
	public String getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memberNumber=" + memberNumber + ", email=" + email + ", psw=" + password + ", name=" + name
				+ ", phone=" + phone + ", postCode=" + postCode + ", address=" + address + ", joinDate=" + joinDate
				+ ", memberGrade=" + memberGrade + "]";
	}
}
