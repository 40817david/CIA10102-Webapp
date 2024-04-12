package notification.model;

import java.util.List;

public interface NotificationListDAO_interface {
	
	public void insert(NotificationListVO noti);
	
	public NotificationListVO findByMemberId(Integer memberId);
	
	public List<NotificationListVO> getAll();
}
