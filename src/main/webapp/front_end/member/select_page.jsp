<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Cactus Member Testing</title>
</head>


<body>

<h3>---��Ƭd��---</h3>

<%-- ���~�T���C��e�{�B --%>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>



<ul>
	<li>
	<a href = "<%=request.getContextPath()%>/front_end/member/listAllMember.jsp">�q�X�Ҧ����</a>
	</li>
	
	
	<br>
	
	
	<li>
		<form method="post" action="<%=request.getContextPath()%>/member.do">
			<label>�п�J�|���s��</label>
			<input type="text" name="memberId">
			<input type="hidden" name="action" value="findByPK">
       		<input type="submit" value="�e�X">
		</form>
	</li>
	
	
<jsp:useBean id="memSvc" scope="page" class="member.model.MemberService" />
	
	<li>
		<form method="post" action="<%=request.getContextPath()%>/member.do">
			<label>�п�ܷ|���s��</label>
			<select size="1" name="memberId">
				<c:forEach var="memVO" items="${memSvc.all}" > 
          			<option value="${memVO.memberId}">${memVO.memberId}
         		</c:forEach>   
       		</select>
       		<input type="hidden" name="action" value="findByPK">
       		<input type="submit" value="�e�X">
		</form>
	</li>

</ul>



<br>
<br>




<ul>

<li> <a href="<%=request.getContextPath()%>/front_end/member/addMember.jsp">�s�W�|��</a></li>

</ul>








</body>
</html>