package member.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cactus")
public class MemberVO implements java.io.Serializable{
	@Id
	@Column(name = "member_id")
	private Integer memberId;
	
	@Column(name = "member_email")
	private String email;
	
	@Column(name = "member_name")
	private String memberName;
	
	@Column(name = "member_password")
	private String password;
	
	@Column(name = "member_birthday")
	private Date birthday;
	
	@Column(name = "member_gender")
	private Integer gender;
	
	@Column(name = "member_phone")
	private String phone;
	
	@Column(name = "member_address")
	private String address;
	
	@Column(name = "member_pic")
	private byte[] memberPic;
	
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}


	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}


	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}


	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}


	public byte[] getMemberPic() {
		return memberPic;
	}
	public void setMemberPic(byte[] memberPic) {
		this.memberPic = memberPic;
	}
}
