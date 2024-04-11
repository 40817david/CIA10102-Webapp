package notification.model;

import java.util.List;

import org.hibernate.Session;

import util.HibernateUtil;

public class NotificationListHibernateDAO implements NotificationListDAO_interface{

	@Override
	public void insert(NotificationListVO noti) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
			session.save(noti);
			
			session.getTransaction().commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}		
	}

	@Override
	public NotificationListVO findByPK() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NotificationListVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
