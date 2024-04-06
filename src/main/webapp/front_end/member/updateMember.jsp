<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>

<%
MemberVO memVO = (MemberVO) request.getAttribute("memVO");
%>
<%=memVO==null%>


<!DOCTYPE html>

<html>

<head>
<meta charset="BIG5">
<title>修改資料 ---From updateMember.jsp</title>
</head>


<body>

<h3>---修改會員資料---</h3>
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
	<td>會員編號:<font color=red><b>*</b></font></td>
	<td><%=memVO.getMemberId()%></td>
</tr>

<tr>
	<td>會員信箱:<font color=red><b>*</b></font></td>
	<td><input type="text" name="email" value="<%=memVO.getEmail()%>"></td>
</tr>

<tr>
	<td>會員名稱:<font color=red><b>*</b></font></td>
	<td><input type="text" name="memberName" value="<%=memVO.getMemberName()%>"></td>
</tr>

<tr>
	<td>會員密碼:<font color=red><b>*</b></font></td>
	<td><input type="text" name="password" value="<%=memVO.getPassword()%>"></td>
</tr>

<tr>
	<td>會員生日:<font color=red><b>*</b></font></td>
	<td><input type="text" name="birthday" value="<%=memVO.getBirthday()%>"></td>
</tr>

<tr>
	<td>會員性別:<font color=red><b>*</b></font></td>
	<td><select name="gender">
		<option value="0">男</option>
		<option value="1">女</option>
		<option value="2">其他</option>
	</select></td>
</tr>

<tr>
	<td>會員電話:<font color=red><b>*</b></font></td>
	<td><input type="text" name="phone" value="<%=memVO.getPhone()%>"></td>
</tr>

<tr>
	<td>會員地址:<font color=red><b>*</b></font></td>
	<td><input type="text" name="address" value="<%=memVO.getAddress()%>"></td>
</tr>

<tr>
	<td>會員圖片:</td>
	<td><input type="file" name="memberPic"></td>
</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memberId" value="<%=memVO.getMemberId()%>">
<input type="submit" value="送出修改">

</form>


</body>

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

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
 		   value: '<%=memVO.getBirthday()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>

</html>