package notification.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import member.model.MemberVO;
import util.HibernateUtil;

public class NotificationListHibernateDAO implements NotificationListDAO_interface{
	
	// SessionFactory 為 thread-safe，可宣告為屬性讓請求執行緒們共用
	private SessionFactory factory;	
	
	public NotificationListHibernateDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	
	// Session 為 not thread-safe，所以此方法在各個增刪改查方法裡呼叫
			// 以避免請求執行緒共用了同個 Session
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public void insert(NotificationListVO noti) {
		getSession().save(noti);
	}

	@Override
	public NotificationListVO findByMemberId(Integer memberId) {	
		MemberVO memVO = getSession().get(MemberVO.class, memberId);
		NotificationListVO notiVO = getSession().createQuery("from NotificationListVO where member_id =?0" , NotificationListVO.class)
				.setParameter(0,memVO)
				.uniqueResult();
		return notiVO;
	}
	
	@Override
	public List<NotificationListVO> getAll() {
		return getSession().createQuery("from NotificationListVO", NotificationListVO.class).list();
	}

}
