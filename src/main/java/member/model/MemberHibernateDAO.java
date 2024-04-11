package member.model;

import java.util.List;

import org.hibernate.Session;

import util.HibernateUtil;
public class MemberHibernateDAO implements MemberDAO_interface {

	@Override
	public void insert(MemberVO memberVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
			session.save(memberVO);
			
			session.getTransaction().commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
	}

	
	
	@Override
	public void update(MemberVO memberVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
			session.update(memberVO);
			
			session.getTransaction().commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}		
	}

	@Override
	public MemberVO findByPK(Integer memberId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			MemberVO memberVO = session.get(MemberVO.class, memberId);
			
			session.getTransaction().commit();

			return memberVO;
		}catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return null;
	}

	@Override
	public MemberVO findByName(String memberName) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			MemberVO memberVO = session.createQuery("from MemebrVO", MemberVO.class).uniqueResult();
			
			session.getTransaction().commit();
			
			return memberVO;
		}catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return null;
	}

	@Override
	public List<MemberVO> getAll() {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
			List<MemberVO> list = session.createQuery("from MemberVO", MemberVO.class).list();
			
			session.getTransaction().commit();

			return list;
		}catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return null;
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
