package member.model;

import java.sql.*;
import java.util.*;

public class MemberJDBCDAO implements MemberDAO_interface{
	
	//SQL指令
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cactus?serverTimezone=Asia/Taipei";
	String userId = "root";
	String password = "davidwei0.";
	
	
	
	private static final String INSERT_STMT = 
			"INSERT INTO member (member_email, member_name, member_password, member_birthday, member_gender, member_phone, member_address, member_pic) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = 
			"UPDATE member SET member_email=?, member_name=?, member_password=?, member_birthday=?, member_gender=?, member_phone=?, member_address=?, member_pic=? WHERE member_id=?";
	
	private static final String GET_ALL_STMT = 
			"SELECT member_id, member_email, member_name, member_password, member_birthday, member_gender, member_phone, member_address, member_pic FROM member ORDER BY member_id";
	private static final String FIND_BY_PK = 
			"SELECT member_id, member_email, member_name, member_password, member_birthday, member_gender, member_phone, member_address, member_pic FROM member WHERE member_id=?";	
	private static final String FIND_BY_NAME = 
			"SELECT member_id, member_email, member_name, member_password, member_birthday, member_gender, member_phone, member_address, member_pic FROM member WHERE member_name=?";
	
	
	
	
	//新增
	@Override
	public void insert(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userId, password);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memberVO.getEmail());
			pstmt.setString(2, memberVO.getMemberName());
			pstmt.setString(3, memberVO.getPassword());
			pstmt.setDate(4, memberVO.getBirthday());
			pstmt.setInt(5, memberVO.getGender());
			pstmt.setString(6, memberVO.getPhone());
			pstmt.setString(7, memberVO.getAddress());
			pstmt.setBytes(8, memberVO.getMemberPic());
			
			pstmt.executeUpdate();
			
			System.out.println("資料新增成功!");

		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				e.printStackTrace();
				}
			}
			
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	
	//修改
	@Override
	public void update(MemberVO memberVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userId, password);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, memberVO.getEmail());
			pstmt.setString(2, memberVO.getMemberName());
			pstmt.setString(3, memberVO.getPassword());
			pstmt.setDate(4, memberVO.getBirthday());
			pstmt.setInt(5, memberVO.getGender());
			pstmt.setString(6, memberVO.getPhone());
			pstmt.setString(7, memberVO.getAddress());
			pstmt.setBytes(8, memberVO.getMemberPic());
			pstmt.setInt(9, memberVO.getMemberId());
			
			pstmt.executeUpdate();
			
			System.out.println("資料更新成功!");


		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				e.printStackTrace();
				}
			}
			
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
	}
	
	
	
	
	// 會員編號查詢
	@Override
	public MemberVO findByPK(Integer memberId) {
		
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userId, password);
			pstmt = con.prepareStatement(FIND_BY_PK);

			pstmt.setInt(1, memberId);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memberVO = new MemberVO();
				
				memberVO.setMemberId(rs.getInt("member_id"));
				memberVO.setEmail(rs.getString("member_email"));
				memberVO.setMemberName(rs.getString("member_name"));
				memberVO.setPassword(rs.getString("member_password"));
				memberVO.setBirthday(rs.getDate("member_birthday"));
				memberVO.setGender(rs.getInt("member_gender"));
				memberVO.setPhone(rs.getString("member_phone"));
				memberVO.setAddress(rs.getString("member_address"));
				memberVO.setMemberPic(rs.getBytes("member_pic"));
			}
			
			
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
			
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				e.printStackTrace();
				}
			}
			
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
		
		return memberVO;
	}
	
	
		
	// 會員姓名查詢
	@Override
	public MemberVO findByName(String memberName) {
		
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userId, password);
			pstmt = con.prepareStatement(FIND_BY_NAME);

			pstmt.setString(1, memberName);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memberVO = new MemberVO();
				
				memberVO.setMemberId(rs.getInt("member_id"));
				memberVO.setEmail(rs.getString("member_email"));
				memberVO.setMemberName(rs.getString("member_name"));
				memberVO.setPassword(rs.getString("member_password"));
				memberVO.setBirthday(rs.getDate("member_birthday"));
				memberVO.setGender(rs.getInt("member_gender"));
				memberVO.setPhone(rs.getString("member_phone"));
				memberVO.setAddress(rs.getString("member_address"));
				memberVO.setMemberPic(rs.getBytes("member_pic"));
			}
			
			
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
			
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				e.printStackTrace();
				}
			}
			
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
		return memberVO;	
	}
	
	
	
	
	// 全部查詢
	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO memberVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userId, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memberVO = new MemberVO();
				
				memberVO.setMemberId(rs.getInt("member_id"));
				memberVO.setEmail(rs.getString("member_email"));
				memberVO.setMemberName(rs.getString("member_name"));
				memberVO.setPassword(rs.getString("member_password"));
				memberVO.setBirthday(rs.getDate("member_birthday"));
				memberVO.setGender(rs.getInt("member_gender"));
				memberVO.setPhone(rs.getString("member_phone"));
				memberVO.setAddress(rs.getString("member_address"));
				memberVO.setMemberPic(rs.getBytes("member_pic"));
				
				list.add(memberVO);
			}
			
			
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
			
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
		
		return list;
	}

	
	
	
	public static void main(String[] args) {
		
		MemberJDBCDAO dao = new MemberJDBCDAO();
		
		
		
//		// 新增
//		MemberVO memberVO1 = new MemberVO();
//		
//		memberVO1.setEmail("123456@yahoo.com.tw");
//		memberVO1.setMemberName("小吳");
//		memberVO1.setPassword("123456789");
//		memberVO1.setBirthday(java.sql.Date.valueOf("2000-01-01"));
//		memberVO1.setGender(0);
//		memberVO1.setPhone("0987654321");
//		memberVO1.setAddress("桃園市中壢區");
//		memberVO1.setMemberPic(null);
//		
//		dao.insert(memberVO1);
//		
//		
//		
//		// 修改
//		MemberVO memberVO2 = new MemberVO();
//		
//		memberVO2.setMemberId(15);
//		memberVO2.setEmail("999999999aa@yahoo.com.tw");
//		memberVO2.setMemberName("大吳");
//		memberVO2.setPassword("abcdefg12300");
//		memberVO2.setBirthday(java.sql.Date.valueOf("2015-10-10"));
//		memberVO2.setGender(0);
//		memberVO2.setPhone("0911223344");
//		memberVO2.setAddress("桃園市中壢區");
//		memberVO2.setMemberPic(null);
//		
//		dao.update(memberVO2);

		
		
//		// 會員編號查詢
//		MemberVO memberVO3 = dao.findByPK(3);
//
//		System.out.print(memberVO3.getMemberId() + ",");
//		System.out.print(memberVO3.getEmail() + ",");
//		System.out.print(memberVO3.getMemberName() + ",");
//		System.out.print(memberVO3.getPassword() + ",");
//		System.out.print(memberVO3.getBirthday() + ",");
//		System.out.print(memberVO3.getGender() + ",");
//		System.out.print(memberVO3.getPhone() + ",");
//		System.out.print(memberVO3.getAddress() + ",");
//		System.out.println(memberVO3.getMemberPic() + ",");
//		System.out.println("=================================================================================");
//
//		
//		
//		
//		// 會員姓名查詢
//		MemberVO memberVO4 = dao.findByName("David");
//
//		System.out.print(memberVO4.getMemberId() + ",");
//		System.out.print(memberVO4.getEmail() + ",");
//		System.out.print(memberVO4.getMemberName() + ",");
//		System.out.print(memberVO4.getPassword() + ",");
//		System.out.print(memberVO4.getBirthday() + ",");
//		System.out.print(memberVO4.getGender() + ",");
//		System.out.print(memberVO4.getPhone() + ",");
//		System.out.print(memberVO4.getAddress() + ",");
//		System.out.println(memberVO4.getMemberPic() + ",");
//		System.out.println("=================================================================================");
//		
//		
//		
//		
//		// 全部查詢
//		List<MemberVO> list = dao.getAll();
//		for(MemberVO member : list) {
//			System.out.print(member.getMemberId() + ",");
//			System.out.print(member.getEmail() + ",");
//			System.out.print(member.getMemberName() + ",");
//			System.out.print(member.getPassword() + ",");
//			System.out.print(member.getBirthday() + ",");
//			System.out.print(member.getGender() + ",");
//			System.out.print(member.getPhone() + ",");
//			System.out.print(member.getAddress() + ",");
//			System.out.println(member.getMemberPic() + ",");
//			System.out.println("=================================================================================");
//		}
	}

}