package notification.model;

import java.util.List;

public interface NotificationListService_interface {
	
	public void sendMessage(
			Integer memberId, Integer messType, String messTitle, String messContent);
	
	public void orderSuccess(Integer memberId, String messContent);
	
	public void orderCancel(Integer memberId, String messContent);
	
	public NotificationListVO findByMemberId(Integer memberId);
	
	public List<NotificationListVO> getAll();
	
}
