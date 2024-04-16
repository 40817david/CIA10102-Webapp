package member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

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
	public List<MemberVO> findByName(Map<String, String> map) {
		if (map.size() == 0) {
			return getAll();
		}
		CriteriaBuilder builder = getSession().getCriteriaBuilder();
		CriteriaQuery<MemberVO> criteria = builder.createQuery(MemberVO.class);
		Root<MemberVO> root = criteria.from(MemberVO.class);

		List<Predicate> predicates = new ArrayList<>();
		
		for (Map.Entry<String, String> row : map.entrySet()) {
			if ("memberName".equals(row.getKey())) {
				predicates.add(builder.like(root.get("memberName"), "%" + row.getValue() + "%"));
			}
		}
		
		criteria.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
		criteria.orderBy(builder.asc(root.get("memberId")));
		TypedQuery<MemberVO> query = getSession().createQuery(criteria);

		return query.getResultList();
	}

	@Override
	public List<MemberVO> getAll() {
		return getSession().createQuery("from MemberVO", MemberVO.class).list();
	}
	
	@Override
	public MemberVO findByEmail(String email) {
		MemberVO memVO = getSession().createQuery("from MemberVO where email=:email", MemberVO.class)
				.setParameter("email", email)
				.uniqueResult();
		
		if(memVO != null) {
			return memVO;
		}else {
			return null;
		}
	}
}
