<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cactus Member Testing</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


</head>

<style>


</style>


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






<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>