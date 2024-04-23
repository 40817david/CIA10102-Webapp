package notification.model;

import java.util.List;

import member.model.MemberVO;

public class NotificationListService implements NotificationListService_interface{
	
	private NotificationListDAO_interface dao;
	
	public NotificationListService() {
		dao = new NotificationListHibernateDAO();
	}

	@Override
	public void sendMessage(Integer memberId, Integer notiType, String notiTitle, String notiContent) {
		MemberVO memVO = new MemberVO();
		memVO.setMemberId(memberId);
		
		NotificationListVO notiVO = new NotificationListVO();
		notiVO.setMember(memVO);
		notiVO.setType(notiType);
		notiVO.setTitle(notiTitle);
		notiVO.setContent(notiContent);
		
		dao.insert(notiVO);
	}

	@Override
	public void orderSuccess(Integer memberId, Integer notiType, String notiContent) {
		MemberVO memVO = new MemberVO();
		memVO.setMemberId(memberId);
		
		NotificationListVO notiVO = new NotificationListVO();
		notiVO.setMember(memVO);
		notiVO.setType(notiType);
		
		switch(notiType) {
			case 0:
				notiVO.setTitle("房間訂單成立!");
				break;
			case 1:
				notiVO.setTitle("活動訂單成立!");
				break;
			case 2:
				notiVO.setTitle("商品訂單成立!");
				break;
			}
		
		notiVO.setContent(notiContent);
		
		dao.insert(notiVO);
	}

	@Override
	public void orderCancel(Integer memberId, Integer notiType, String notiContent) {
		MemberVO memVO = new MemberVO();
		memVO.setMemberId(memberId);
		
		NotificationListVO notiVO = new NotificationListVO();
		notiVO.setMember(memVO);
		notiVO.setType(notiType);
		
		switch(notiType) {
			case 0:
				notiVO.setTitle("房間訂單取消成功!");
				break;
			case 1:
				notiVO.setTitle("活動訂單取消成功!");
				break;
			case 2:
				notiVO.setTitle("商品訂單取消成功!");
				break;
			}
		
		notiVO.setContent(notiContent);
		
		dao.insert(notiVO);		
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
