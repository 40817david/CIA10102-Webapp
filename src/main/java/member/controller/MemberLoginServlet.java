package member.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import member.model.*;

@WebServlet("/memberLogin")

public class MemberLoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		// 從前端抓取action去做後方對應操作判定
		String action = req.getParameter("action");

		if ("login".equals(action)) {

			// 儲存錯誤訊息，並顯示於畫面提醒使用者
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 接收請求並做錯誤判斷 **********************/
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			if (email == null || (email.trim()).length() == 0) {
				errorMsgs.add("EmptyEmail");
			}
			if (password == null || (password.trim()).length() == 0) {
				errorMsgs.add("EmptyPassword");
			}

			// 若有錯誤訊息，則帶使用者回到頁面
			if (!errorMsgs.isEmpty()) {
				String failUrl = "/front_end/member/memberLogin.jsp";
				RequestDispatcher fail = req.getRequestDispatcher(failUrl);
				fail.forward(req, res);
				return; // 中斷程式
			}

			/*************************** 輸入正確，做資料查詢 **********************/
			MemberService memSvc = new MemberService();
			MemberVO memVO = memSvc.findByEmail(email);

			if (memVO == null) {
				errorMsgs.add("Not this One");
			}
			if (!errorMsgs.isEmpty()) {
				String failUrl = "/front_end/member/memberLogin.jsp";
				RequestDispatcher fail = req.getRequestDispatcher(failUrl);
				fail.forward(req, res);
				return; // 中斷程式
			}
			
			
			if(!memVO.getEmail().equals(email)) {
				errorMsgs.add("WrongEmail");
			}
			
			if(!memVO.getPassword().equals(password)) {
				errorMsgs.add("WrongPassword");
			}

			// 若有錯誤訊息，則帶使用者回到頁面
			if (!errorMsgs.isEmpty()) {
				String failUrl = "/front_end/member/memberLogin.jsp";
				RequestDispatcher fail = req.getRequestDispatcher(failUrl);
				fail.forward(req, res);
				return; // 中斷程式
			}

			/*************************** 查詢完成，轉交前台 **********************/
			HttpSession session = req.getSession();
			session.setAttribute("memVO", memVO);
			req.setAttribute("status", "success");
			String successUrl = "/front_end/member/memberOnlyWeb.jsp";
			RequestDispatcher success = req.getRequestDispatcher(successUrl);
			success.forward(req, res);
		}

	}
}