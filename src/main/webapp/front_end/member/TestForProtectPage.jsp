<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    
    <%
    Object account = session.getAttribute("account");                  // 從 session內取出 (key) account的值
    if (account == null) {                                             // 如為 null, 代表此user未登入過 , 才做以下工作
      session.setAttribute("location", request.getRequestURI());       //*工作1 : 同時記下目前位置 , 以便登入成功後 , 能夠直接導回此網頁
    																   //*工作2 : 請該user去登入網頁, 進行登入
      response.sendRedirect(request.getContextPath()+"/front_end/member/memberLogin.jsp");   
      return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<h2> 購物車結帳 </h2>
</body>
</html>