package member.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import member.model.*;

@WebServlet("/member.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)

public class MemberServlet extends HttpServlet{

	
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
				String failUrl = "/front_end/member/select_page.jsp" ;
				RequestDispatcher fail = req.getRequestDispatcher(failUrl);
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
				String failUrl = "/front_end/member/select_page.jsp" ;
				RequestDispatcher fail = req.getRequestDispatcher(failUrl);
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
				String failUrl = "/front_end/member/select_page.jsp" ;
				RequestDispatcher fail = req.getRequestDispatcher(failUrl);
				fail.forward(req, res);
				return; //中斷程式
			}
			
			
			
			
			/***************************查詢完成，轉交前台**********************/
			req.setAttribute("memVO",memVO);
			String successUrl = "/front_end/member/listOneMember.jsp" ;
			RequestDispatcher success = req.getRequestDispatcher(successUrl);
			success.forward(req, res);
		}
		
		
		
		
//新增
		if("insert".equals(action)) {
			
			//儲存錯誤訊息，並顯示於畫面提醒使用者
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
			
			
			/***************************接收請求並做錯誤判斷**********************/

			String email = req.getParameter("email");
			if(email == null || email.trim().length() == 0) {
				errorMsgs.add("Email:Can't Empty!");
			} 
			
			
			
			String memberName = req.getParameter("memberName");
			String memebrNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9)]{2,10}$";

			if(memberName == null || memberName.trim().length() == 0) {
				errorMsgs.add("Name:Can't Empty!");
			} else if(!memberName.trim().matches(memebrNameReg)) { //以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("姓名: 只能是中、英文字母、數字 , 且長度必需在2到10之間");
            }
			
			
			
			String password = req.getParameter("password");
			if(password == null || password.trim().length() == 0) {
				errorMsgs.add("Password:Can't Empty!");
			}
			
			
			
			java.sql.Date birthday = null;
			try {
				birthday = java.sql.Date.valueOf(req.getParameter("birthday").trim());
			}catch(IllegalArgumentException ie){
				errorMsgs.add("Birthday:Can't Empty!");
			}
			
			
			Integer gender = Integer.valueOf(req.getParameter("gender").trim());
			
			
			
			String phone = req.getParameter("phone");
			if(phone == null || phone.trim().length() == 0) {
				errorMsgs.add("Phone:Can't Empty!");
			}
			
			
			
			String address = req.getParameter("address");
			if(address == null || address.trim().length() == 0) {
				errorMsgs.add("Address:Can't Empty!");
			}
			
			
			//圖片新增
			PrintWriter out = res.getWriter();
			byte[] memberPic = null;

			
			Part part = req.getPart("memberPic");

			if(part != null) {
				
				//上傳資料夾
				String saveDirectory = "/images_uploaded";
				String realPath = getServletContext().getRealPath(saveDirectory);
				File fileSaveDirectory = new File(realPath);
				if (!fileSaveDirectory.exists()) {
					 fileSaveDirectory.mkdirs(); // 自動建立上傳資料夾
				}
				
				
				
				String filename = part.getSubmittedFileName();
				
				
				if (filename!= null && filename.length()!=0 && part.getContentType()!=null) {

					InputStream is = null;

					out.println("<PRE>");
					
					out.println("name: " + part.getName());
					out.println("filename:" + filename);
					out.println("ContentType" + part.getContentType());
					out.println("Size" + part.getSize());
					
					File f = new File(fileSaveDirectory, filename);
					out.println("File: " + f);

					// 寫入資料夾,上傳成功
					part.write(f.toString());
					
					//InputStream寫入
					is = part.getInputStream();
					
					// 上傳圖顯示
					out.println("<br><img src=\""+req.getContextPath()+saveDirectory+"/"+filename+"\">");
					out.println();
					out.println("</PRE>");
					
					memberPic = new byte[is.available()];
					is.read();
					is.close();
				}
			}

			
			
			MemberVO memVO = new MemberVO();
			memVO.setEmail(email);
			memVO.setMemberName(memberName);
			memVO.setPassword(password);
			memVO.setBirthday(birthday);
			memVO.setGender(gender);
			memVO.setPhone(phone);
			memVO.setAddress(address);
			memVO.setMemberPic(memberPic);
			
			
			//若有錯誤訊息，則帶使用者回到頁面
			if(!errorMsgs.isEmpty()) {
				req.setAttribute("memVO", memVO); // 先前輸入的memVO物件也存入req
				String failUrl = "/front_end/member/addMember.jsp" ;
				RequestDispatcher fail = req.getRequestDispatcher(failUrl);
				fail.forward(req, res);
				return; //中斷程式
			}
			
			
			/***************************輸入正確，做資料新增**********************/
			MemberService memSvc = new MemberService();
			memVO = memSvc.addMember(email,memberName,password,birthday,gender,phone,address,memberPic);
			
			
			
			
			/***************************新增完成，轉交前台**********************/
			req.setAttribute("memVO",memVO);
			out.println("<h3>資料新增成功!!</h3>");
		}


		
		
//修改
			if("getOne_For_Update".equals(action)) {
				
				//儲存錯誤訊息，並顯示於畫面提醒使用者
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

				
				
				/***************************接收請求並做錯誤判斷**********************/
				
				Integer memberId = Integer.valueOf(req.getParameter("memberId"));
				
				
				
				
				/***************************輸入正確，做資料查詢**********************/

				MemberService memSvc = new MemberService();
				MemberVO memVO = memSvc.findByPK(memberId);
									
				
				
				
				/***************************查詢完成，轉交修改jsp**********************/

				req.setAttribute("memVO",memVO);
				String successUrl = "/front_end/member/updateMember.jsp" ;
				RequestDispatcher success = req.getRequestDispatcher(successUrl);
				success.forward(req, res);
				
				
				}
			
			
			
			
			if("update".equals(action)) {
				
				//儲存錯誤訊息，並顯示於畫面提醒使用者
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

				
				
				/***************************接收請求並做錯誤判斷**********************/
				
				Integer memberId = Integer.valueOf(req.getParameter("memberId").trim());

				
				String email = req.getParameter("email");
				if(email == null || email.trim().length() == 0) {
					errorMsgs.add("Email:Can't Empty!");
				}
				
				
				
				String memberName = req.getParameter("memberName");
				if(memberName == null || memberName.trim().length() == 0) {
					errorMsgs.add("Name:Can't Empty!");
				}
				
				
				
				String password = req.getParameter("password");
				if(password == null || password.trim().length() == 0) {
					errorMsgs.add("Password:Can't Empty!");
				}
				
				
				
				java.sql.Date birthday = null;
				try {
					birthday = java.sql.Date.valueOf(req.getParameter("birthday").trim());
				}catch(IllegalArgumentException ie){
					errorMsgs.add("Birthday:Can't Empty!");
				}
				
				
				Integer gender = Integer.valueOf(req.getParameter("gender").trim());
				
				
				
				String phone = req.getParameter("phone");
				if(phone == null || phone.trim().length() == 0) {
					errorMsgs.add("Phone:Can't Empty!");
				}
				
				
				
				String address = req.getParameter("address");
				if(address == null || address.trim().length() == 0) {
					errorMsgs.add("Address:Can't Empty!");
				}
				
				
				//圖片新增
				PrintWriter out = res.getWriter();
				byte[] memberPic = null;

				
				Part part = req.getPart("memberPic");

				if(part != null) {
					
					//上傳資料夾
					String saveDirectory = "/images_uploaded";
					String realPath = getServletContext().getRealPath(saveDirectory);
					File fileSaveDirectory = new File(realPath);
					if (!fileSaveDirectory.exists()) {
						 fileSaveDirectory.mkdirs(); // 自動建立上傳資料夾
					}
					
					
					
					String filename = part.getSubmittedFileName();
					
					
					if (filename!= null && filename.length()!=0 && part.getContentType()!=null) {

						InputStream is = null;

						out.println("<PRE>");
						
						out.println("name: " + part.getName());
						out.println("filename:" + filename);
						out.println("ContentType" + part.getContentType());
						out.println("Size" + part.getSize());
						
						File f = new File(fileSaveDirectory, filename);
						out.println("File: " + f);

						// 寫入資料夾,上傳成功
						part.write(f.toString());
						
						//InputStream寫入
						is = part.getInputStream();
						
						// 上傳圖顯示
						out.println("<br><img src=\""+req.getContextPath()+saveDirectory+"/"+filename+"\">");
						out.println();
						out.println("</PRE>");
						
						memberPic = new byte[is.available()];
						is.read(memberPic);
						is.close();
					}
				}

				
				
				MemberVO memVO = new MemberVO();
				memVO.setMemberId(memberId);
				memVO.setEmail(email);
				memVO.setMemberName(memberName);
				memVO.setPassword(password);
				memVO.setBirthday(birthday);
				memVO.setGender(gender);
				memVO.setPhone(phone);
				memVO.setAddress(address);
				memVO.setMemberPic(memberPic);
				
				
				//若有錯誤訊息，則帶使用者回到頁面
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO); // 先前輸入的memVO物件也存入req
					String failUrl = "/front_end/member/addMember.jsp" ;
					RequestDispatcher fail = req.getRequestDispatcher(failUrl);
					fail.forward(req, res);
					return; //中斷程式
				}
				
				/***************************輸入正確，做資料修改**********************/
				MemberService memSvc = new MemberService();
				memVO = memSvc.updateMember(memberId,email,memberName,password,birthday,gender,phone,address,memberPic);
				
				
				
				
				/***************************修改完成，轉交前台**********************/
				
				req.setAttribute("memVO",memVO);
				out.println("<h3>資料修改成功!!</h3>");
				}
		
	}
}
