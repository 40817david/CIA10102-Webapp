package member.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import member.model.*;

@WebServlet("/member.do")

public class MemberServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		
		req.setCharacterEncoding("UTF-8");
		
		//從前端抓取action去做後方對應操作判定
		String action = req.getParameter("action");
		
		
//查詢1//		
		if("findByPK".equals(action)) {
			
			//儲存錯誤訊息，並顯示於畫面提醒使用者
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			
			
			/***************************接收請求並做錯誤判斷**********************/
			String str = req.getParameter("memberId");
			if(str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請輸入會員編號");
			}
			
			//若有錯誤訊息，則帶使用者回到頁面
			if(!errorMsgs.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/front_end/member/select_page.jsp");
				fail.forward(req, res);
				return; //中斷程式
			}
			
			
			Integer memberId = null;
			try {
				memberId = Integer.valueOf(str);
			}catch(Exception e) {
				errorMsgs.add("會員編號格式不正確");
			}
			//若有錯誤訊息，則帶使用者回到頁面
			if(!errorMsgs.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/front_end/member/select_page.jsp");
				fail.forward(req, res);
				return; //中斷程式
			}
			
			
			
			
			/***************************輸入正確，做資料查詢**********************/
			MemberService memSvc = new MemberService();
			MemberVO memVO = memSvc.findByPK(memberId);
			
			if(memVO == null) {
				errorMsgs.add("查無此人");
			}
			//若有錯誤訊息，則帶使用者回到頁面
			if(!errorMsgs.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/front_end/member/select_page.jsp");
				fail.forward(req, res);
				return; //中斷程式
			}
			
			
			
			
			/***************************查詢完成，轉交前台**********************/
			req.setAttribute("memVO",memVO);
			RequestDispatcher success = req.getRequestDispatcher("/front_end/member/listOneMember.jsp");
			success.forward(req, res);
		}
	}
}
