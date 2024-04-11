package member.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import util.HibernateUtil;

public class MemberHibernateDAO implements MemberDAO_interface {

	// SessionFactory 為 thread-safe，可宣告為屬性讓請求執行緒們共用
	private SessionFactory factory;	
	
	public MemberHibernateDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
		
	// Session 為 not thread-safe，所以此方法在各個增刪改查方法裡呼叫
		// 以避免請求執行緒共用了同個 Session
		private Session getSession() {
			return factory.getCurrentSession();
		}
		
		
	@Override
	public void insert(MemberVO memberVO) {
		getSession().save(memberVO);
	}

	
	
	@Override
	public void update(MemberVO memberVO) {
		getSession().update(memberVO);
	
	}

	@Override
	public MemberVO findByPK(Integer memberId) {
		return getSession().get(MemberVO.class, memberId);
	}

	@Override
	public MemberVO findByName(String memberName) {
		return getSession().createQuery("from MemebrVO", MemberVO.class).uniqueResult();
	}

	@Override
	public List<MemberVO> getAll() {
		return getSession().createQuery("from MemberVO", MemberVO.class).list();
	}
	
//	public static void main(String[] args) {
//		MemberDAO_interface dao = new MemberHibernateDAO();
//
//		List<MemberVO> list = dao.getAll();
//		for (MemberVO memVO : list) {
//			System.out.print(memVO.getMemberId() + ",");
//			System.out.print(memVO.getEmail() + ",");
//			System.out.print(memVO.getMemberName() + ",");
//			System.out.print(memVO.getPassword() + ",");
//			System.out.print(memVO.getBirthday() + ",");
//			System.out.print(memVO.getGender() + ",");
//			System.out.print(memVO.getPhone());
//			System.out.print(memVO.getAddress());
//			System.out.print(memVO.getMemberPic());
//			System.out.println();
//		}
//
//	}

}
