package member.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
	
	public List<MemberVO> findByName(Map<String, String[]> map) {
		Map<String, String> query = new HashMap<>();
		// Map.Entry即代表一組key-value
		Set<Map.Entry<String, String[]>> entry = map.entrySet();
		
		for (Map.Entry<String, String[]> row : entry) {
			String key = row.getKey();
			// 因為請求參數裡包含了action，做個去除動作
			if ("action".equals(key)) {
				continue;
			}
			// 若是value為空即代表沒有查詢條件，做個去除動作
			String value = row.getValue()[0]; // getValue拿到一個String陣列, 接著[0]取得第一個元素檢查
			if (value == null || value.isEmpty()) {
				continue;
			}
			query.put(key, value);
		}
		
		System.out.println(query);
		
		return dao.findByName(query);
	}
	
	
	public MemberVO findByPK(Integer memberId) {
		return dao.findByPK(memberId);
	}
	
	public MemberVO findByEmail(String email) {
		return dao.findByEmail(email);
	}
}
