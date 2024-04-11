package member.model;

import java.sql.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import notification.model.NotificationListVO;

@Entity
@Table(name = "member")
public class MemberVO implements java.io.Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_id" ,
		updatable = false, nullable = false)
	private Integer memberId;
	
	
	@Column(name = "member_email" ,
			nullable = false , unique = true)
	private String email;
	
	
	@Column(name = "member_name" , 
			nullable = false)
	private String memberName;
	
	
	@Column(name = "member_password" , 
			nullable = false)
	private String password;
	
	
	@Column(name = "member_birthday" , 
			nullable = false)
	private Date birthday;
	
	
	@Column(name = "member_gender" , 
			nullable = false)
	private Integer gender;
	
	
	@Column(name = "member_phone" , 
			columnDefinition = "char",
			nullable = false)
	private String phone;
	
	
	@Column(name = "member_address" , 
			nullable = false)
	private String address;
	
	
	@Column(name = "member_pic" , 
			columnDefinition = "longblob")
	private byte[] memberPic;
	
	
	
	//Hibernate映射
	
	@OneToMany(mappedBy = "member" , cascade = CascadeType.ALL)
	@OrderBy("member_id asc")
	private Set<NotificationListVO> noti;
	
	
	
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



	public Set<NotificationListVO> getNoti() {
		return noti;
	}



	public void setNoti(Set<NotificationListVO> noti) {
		this.noti = noti;
	}
	
	
	
	
	
	
	//Override toString()
}
