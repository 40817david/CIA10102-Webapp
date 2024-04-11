<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cactus Member Testing</title>



</head>


<body>



<h3>---資料查詢---</h3>

<%-- 錯誤訊息列表呈現處 --%>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>



<ul>
	<li>
	<a href = "<%=request.getContextPath()%>/front_end/member/listAllMember.jsp">秀出所有資料</a>
	</li>
	
	
	<br>
	
	
	<li>
		<form method="post" action="<%=request.getContextPath()%>/member.do">
			<label>請輸入會員編號</label>
			<input type="text" name="memberId">
			<input type="hidden" name="action" value="findByPK">
       		<input type="submit" value="送出">
		</form>
	</li>
	
	
<jsp:useBean id="memSvc" scope="page" class="member.model.MemberService" />
	
	<li>
		<form method="post" action="<%=request.getContextPath()%>/member.do">
			<label>請選擇會員編號</label>
			<select size="1" name="memberId">
				<c:forEach var="memVO" items="${memSvc.all}" > 
          			<option value="${memVO.memberId}">${memVO.memberId}
         		</c:forEach>   
       		</select>
       		<input type="hidden" name="action" value="findByPK">
       		<input type="submit" value="送出">
		</form>
	</li>

</ul>



<br>
<br>




<ul>

<li> <a href="<%=request.getContextPath()%>/front_end/member/addMember.jsp">新增會員</a></li>

</ul>



</body>
</html>