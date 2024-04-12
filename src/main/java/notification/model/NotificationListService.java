package notification.model;

import java.util.List;

public class NotificationListService implements NotificationListService_interface{
	
	private NotificationListDAO_interface dao;
	
	public NotificationListService() {
		dao = new NotificationListHibernateDAO();
	}

	@Override
	public void sendMessage(Integer memberId, Integer messType, String messTitle, String messContent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void orderSuccess(Integer memberId, String messContent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void orderCancel(Integer memberId, String messContent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public NotificationListVO findByMemberId(Integer memberId) {
		return dao.findByMemberId(memberId);
	}

	@Override
	public List<NotificationListVO> getAll() {
		return dao.getAll();
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
