package member.model;

import java.util.*;

public interface MemberDAO_interface {
	
	// 新增
	public void insert(MemberVO memberVO);

	// 修改
	public void update(MemberVO memberVO);

	// 會員編號查詢
	public MemberVO findByPK(Integer memberId);
	
	// 會員姓名模糊查詢
	public List<MemberVO> findByName(Map<String, String> map);

	// 全部查詢
	public List<MemberVO> getAll();
	
	//會員信箱查詢
	public MemberVO findByEmail(String email);


}