<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    
    <%
    Object account = session.getAttribute("account");                  // �q session�����X (key) account����
    if (account == null) {                                             // �p�� null, �N��user���n�J�L , �~���H�U�u�@
      session.setAttribute("location", request.getRequestURI());       //*�u�@1 : �P�ɰO�U�ثe��m , �H�K�n�J���\�� , ��������ɦ^������
    																   //*�u�@2 : �и�user�h�n�J����, �i��n�J
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
<h2> �ʪ������b </h2>
</body>
</html>