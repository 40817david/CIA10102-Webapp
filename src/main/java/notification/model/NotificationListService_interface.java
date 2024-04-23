package notification.model;

import java.util.List;

public interface NotificationListService_interface {
	
	public void sendMessage(
			Integer memberId, Integer notiType, String notiTitle, String notiContent);
	
	public void orderSuccess(Integer memberId, Integer notiType, String notiContent);
	
	public void orderCancel(Integer memberId, Integer notiType, String notiContent);
	
	public NotificationListVO findByMemberId(Integer memberId);
	
	public List<NotificationListVO> getAll();
	
}
