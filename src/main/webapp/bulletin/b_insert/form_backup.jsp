<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 등록</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>

<%@ include file="/layouts/body.jsp" %>
<%@ include file="/layouts/footer.jsp" %>
<%@ include file="/layouts/header.jsp" %>

<form action="<%= request.getContextPath() %>/bulletin/b_insert/b_insert_action.jsp" method="post">
<table border="1">
<tr>
	<td>게시판번호</td>
	<td><input type="text" name="b_code" size="20"></td>
<tr>
<tr>
	<td>Title</td>
	<td><input type="text" name="b_title" size="20"></td>
<tr>


<%
// session 값 가져오기
System.out.println(session.getAttribute("S_ID"));
if(session.getAttribute("S_ID") == null) {
%>
<tr>
	<td>아이디</td>
	<td><input type="text" readonly value="로그인 해야합니다." name="m_id" size="20"></td>
<tr>

<% 
} else {
%>

<tr>
	<td>아이디</td>
	<td><input type="text" name="m_id" size="20"></td>
<tr>

<%
}
%>



<tr>
	<td>게시날짜</td>
	<td><input type="date" name="b_date" size="20"></td>
<tr>
<tr>
	<td>총수량</td>
	<td><input type="text" name="b_amount" size="20"></td>
<tr>
<tr>
	<td>내용</td>
	<td><textarea name="b_body" rows="5" style="width: 100%; padding 5px;"></textarea></td>
<tr>
<tr>
	<td>주소</td>
	<td><input type="text" name="b_addr" size="20"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="게시 글 등록"></td>
</tr>
</table>
</form>
</body>
</html>