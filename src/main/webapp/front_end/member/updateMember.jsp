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
<title>�ק��� ---From updateMember.jsp</title>
</head>


<body>

<h3>---�ק�|�����---</h3>
<br>

<%-- ���~�T���C��e�{�B --%>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


<form method="post" action="<%=request.getContextPath()%>/member.do" enctype="multipart/form-data">
<table>

<tr>
	<td>�|���s��:<font color=red><b>*</b></font></td>
	<td><%=memVO.getMemberId()%></td>
</tr>

<tr>
	<td>�|���H�c:<font color=red><b>*</b></font></td>
	<td><input type="text" name="email" value="<%=memVO.getEmail()%>"></td>
</tr>

<tr>
	<td>�|���W��:<font color=red><b>*</b></font></td>
	<td><input type="text" name="memberName" value="<%=memVO.getMemberName()%>"></td>
</tr>

<tr>
	<td>�|���K�X:<font color=red><b>*</b></font></td>
	<td><input type="text" name="password" value="<%=memVO.getPassword()%>"></td>
</tr>

<tr>
	<td>�|���ͤ�:<font color=red><b>*</b></font></td>
	<td><input type="text" name="birthday" value="<%=memVO.getBirthday()%>"></td>
</tr>

<tr>
	<td>�|���ʧO:<font color=red><b>*</b></font></td>
	<td><select name="gender">
		<option value="0">�k</option>
		<option value="1">�k</option>
		<option value="2">��L</option>
	</select></td>
</tr>

<tr>
	<td>�|���q��:<font color=red><b>*</b></font></td>
	<td><input type="text" name="phone" value="<%=memVO.getPhone()%>"></td>
</tr>

<tr>
	<td>�|���a�}:<font color=red><b>*</b></font></td>
	<td><input type="text" name="address" value="<%=memVO.getAddress()%>"></td>
</tr>

<tr>
	<td>�|���Ϥ�:</td>
	<td><input type="file" name="memberPic"></td>
</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memberId" value="<%=memVO.getMemberId()%>">
<input type="submit" value="�e�X�ק�">

</form>


</body>

<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

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
 	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=memVO.getBirthday()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        
        
   
        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

        //      1.�H�U���Y�@�Ѥ��e������L�k���
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

        
        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
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


        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
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