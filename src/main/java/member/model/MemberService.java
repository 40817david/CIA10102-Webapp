package member.model;

import java.sql.Date;
import java.util.List;

public class MemberService {

	private MemberDAO_interface dao;
	
	public MemberService() {
		dao = new MemberHibernateDAO();
	}
	
	
	public MemberVO addMember(String email, String memberName, String password, Date birthday ,Integer gender, 
			String phone, String address, byte[] memberPic) {
		
		MemberVO memVO = new MemberVO();
		
		memVO.setEmail(email);
		memVO.setMemberName(memberName);
		memVO.setPassword(password);
		memVO.setBirthday(birthday);
		memVO.setGender(gender);
		memVO.setPhone(phone);
		memVO.setAddress(address);
		memVO.setMemberPic(memberPic);
		
		dao.insert(memVO);
		return memVO;	
	}
	
	public MemberVO updateMember(Integer memberId, String email, String memberName, String password, Date birthday ,Integer gender, 
			String phone, String address, byte[] memberPic) {
		
		MemberVO memVO = new MemberVO();
		
		memVO.setEmail(email);
		memVO.setMemberName(memberName);
		memVO.setPassword(password);
		memVO.setBirthday(birthday);
		memVO.setGender(gender);
		memVO.setPhone(phone);
		memVO.setAddress(address);
		memVO.setMemberPic(memberPic);
		
		memVO.setMemberId(memberId);
		
		dao.update(memVO);
		return memVO;
	}
	
	public List<MemberVO> getAll(){
		return dao.getAll();
	}
	
	public MemberVO findByName(String memberName) {
		return dao.findByName(memberName);
	}
	
	public MemberVO findByPK(Integer memberId) {
		return dao.findByPK(memberId);
	}
}
