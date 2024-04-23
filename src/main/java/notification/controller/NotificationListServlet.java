package notification.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import member.model.MemberService;
import member.model.MemberVO;
import notification.model.NotificationListService;
import notification.model.NotificationListVO;

@WebServlet("/NotiServlet")
public class NotificationListServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		//從前端抓取action去做後方對應操作判定
		String action = req.getParameter("action");

		
//查詢1//		
				if("findByMemberId".equals(action)) {
					
					//儲存錯誤訊息，並顯示於畫面提醒使用者
					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);

					
					
					/***************************接收請求並做錯誤判斷**********************/
					String inputText = req.getParameter("memberId");
					if(inputText == null || (inputText.trim()).length() == 0) {
						errorMsgs.add("請輸入會員編號");
					}
					
					//若有錯誤訊息，則帶使用者回到頁面
					if(!errorMsgs.isEmpty()) {
						String failUrl = "/back_end/notification/noti_select_page.jsp" ;
						RequestDispatcher fail = req.getRequestDispatcher(failUrl);
						fail.forward(req, res);
						return; //中斷程式
					}
					
					
					Integer memberId = null;
					try {
						memberId = Integer.valueOf(inputText);
					}catch(Exception e) {
						errorMsgs.add("會員編號格式不正確");
					}
					//若有錯誤訊息，則帶使用者回到頁面
					if(!errorMsgs.isEmpty()) {
						String failUrl = "/back_end/notification/noti_select_page.jsp" ;
						RequestDispatcher fail = req.getRequestDispatcher(failUrl);
						fail.forward(req, res);
						return; //中斷程式
					}
					
					
					
					
					/***************************輸入正確，做資料查詢**********************/
					NotificationListService notiSvc = new NotificationListService();
					NotificationListVO notiVO = notiSvc.findByMemberId(memberId);
					
					if(notiVO == null) {
						errorMsgs.add("此會員無訊息");
					}
					//若有錯誤訊息，則帶使用者回到頁面
					if(!errorMsgs.isEmpty()) {
						String failUrl = "/back_end/notification/noti_select_page.jsp" ;
						RequestDispatcher fail = req.getRequestDispatcher(failUrl);
						fail.forward(req, res);
						return; //中斷程式
					}
					
					
					
					
					/***************************查詢完成，轉交前台**********************/
					req.setAttribute("notiVO",notiVO);
					String successUrl = "/back_end/notification/listOneNotiByMemberId.jsp" ;
					RequestDispatcher success = req.getRequestDispatcher(successUrl);
					success.forward(req, res);
				}
				
				
				
//新增
				if("insert".equals(action)) {
					
					//儲存錯誤訊息，並顯示於畫面提醒使用者
					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);
				
					
					
					/***************************接收請求並做錯誤判斷**********************/

					String inputText = req.getParameter("memberId");
					if(inputText == null || inputText.trim().length() == 0) {
						errorMsgs.add("會員編號:不得為空!");
					} 
					

					
					String title = req.getParameter("title");
					if(title == null || title.trim().length() == 0) {
						errorMsgs.add("消息標題:不得為空!");
					} 														
					
					
					Integer type = Integer.valueOf(req.getParameter("type").trim());
					
					
					
					String content = req.getParameter("content");
					if(content == null || content.trim().length() == 0) {
						errorMsgs.add("消息內容:不得為空!");
					}
					
					
					if(!errorMsgs.isEmpty()) {
						String failUrl = "/back_end/notification/newnoti.jsp" ;
						RequestDispatcher fail = req.getRequestDispatcher(failUrl);
						fail.forward(req, res);
						return; //中斷程式
					}
					
					
					Integer memberId = null;
					try {
						memberId = Integer.valueOf(inputText);
					}catch(Exception e) {
						errorMsgs.add("會員編號格式不正確");
					}
					//若有錯誤訊息，則帶使用者回到頁面
					if(!errorMsgs.isEmpty()) {
						String failUrl = "/back_end/notification/newnoti.jsp" ;
						RequestDispatcher fail = req.getRequestDispatcher(failUrl);
						fail.forward(req, res);
						return; //中斷程式
					}

					
			
					
					//若有錯誤訊息，則帶使用者回到頁面
					if(!errorMsgs.isEmpty()) {
						String failUrl = "/back_end/notification/newnoti.jsp" ;
						RequestDispatcher fail = req.getRequestDispatcher(failUrl);
						fail.forward(req, res);
						return; //中斷程式
					}
					
					
					/***************************輸入正確，做資料新增**********************/
					NotificationListService notiSvc = new NotificationListService();
					notiSvc.sendMessage(memberId,type,title,content);
					
					
					
					/***************************新增完成，轉交前台**********************/
					String successUrl = "/back_end/notification/listAllNoti.jsp" ;
					RequestDispatcher success = req.getRequestDispatcher(successUrl);
					success.forward(req, res);
					
					
				}
		
		
	}
}
