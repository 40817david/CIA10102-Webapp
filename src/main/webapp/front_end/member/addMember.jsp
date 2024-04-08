<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>

<% 
	MemberVO memVO = (MemberVO)request.getAttribute("memVO"); 
%>
<%= memVO==null %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增會員 --- From addMember.jsp</title>
</head>


<body>

<h3>---新增會員資料---</h3>
<br>
<h4><a href="<%=request.getContextPath()%>/front_end/member/select_page.jsp">回首頁</a></h4>
<br>

<%-- 錯誤訊息列表呈現處 --%>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form method="post" action="<%=request.getContextPath()%>/member.do" enctype="multipart/form-data">

<table>

<tr>
<td>會員信箱:</td>
<td><input type="text" name="email" value="<%= (memVO==null) ? "" : memVO.getEmail()%>"></td>
</tr>

<tr>
<td>會員名稱</td>
<td><input type="text" name="memberName" value="<%=(memVO==null) ? "" : memVO.getMemberName()%>"></td>
</tr>

<tr>
<td>會員密碼:</td>
<td><input type="text" name="password" value="<%=(memVO==null) ? "" : memVO.getPassword()%>"></td>
</tr>

<tr>
<td>會員生日:</td>
<td><input id="f_date1" type="text" name="birthday" value="<%=(memVO==null) ? "" : memVO.getBirthday()%>"></td>
</tr>

<tr>
<td>會員性別:</td>
<td>
	<select name="gender">
		<option value="0">男</option>
		<option value="1">女</option>
		<option value="2">其他</option>
	</select>
</td>
</tr>

<tr>
<td>會員電話:</td>
<td><input type="text" name="phone" value="<%=(memVO==null) ? "" : memVO.getPhone()%>"></td>
</tr>

<tr>
<td>會員地址:</td>
<td><input type="text" name="address" value="<%=(memVO==null) ? "" : memVO.getAddress()%>"></td>
</tr>

<tr>
<td>會員圖片:</td>
<td><input type="file" name="memberPic" ></td>
</tr>


</table>

<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增">

</form>

</body>


<% 
  java.sql.Date birthday = null;
  try {
	    birthday = memVO.getBirthday();
   } catch (Exception e) {
	   birthday = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
$.datetimepicker.setLocale('zh');
$('#f_date1').datetimepicker({
    theme: '',              //theme: 'dark',
    timepicker:false,       //timepicker:true,
    step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
    format:'Y-m-d',         //format:'Y-m-d H:i:s',
	   value: '<%=birthday%>'
    //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
    //startDate:	            '2017/07/10',  // 起始日
    //minDate:               '-1970-01-01', // 去除今日(不含)之前
    //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
 });
 
</script>
</html>