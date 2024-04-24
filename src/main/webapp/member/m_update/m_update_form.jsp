<%@ page language="java" contentType="text/html; charset=EUC-KR"
				 pageEncoding="EUC-KR" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>회원정보 수정</title>
</head>
<body>
<%
	// Database Connection
	// 0. 준비
	String send_id = request.getParameter("send_id");
	String m_id = "id", m_pw = "pw", m_name = "name", m_email = "email", m_phone = "phone", m_addr = "addr";
%>

<%@ include file="/layouts/header.jsp" %>
<%@ include file="/layouts/body.jsp" %>
<!-- TODO: 권한 없을 시 알림창 뜨고, 페이지 표시하지 않도록 구현 -->

<p>send_id: <%= send_id %>
</p>  <!-- test -->

<!-- content here -->
<div id="content">
	<form>
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="m_id" value="<%= m_id %>" readonly>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="m_pw" value="<%= m_pw %>">
				</td>
			</tr>
			<tr>
				<td>권한</td>
				<td>
					<select name="m_level">
						<option value="일반회원">일반회원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="m_name" value="<%= m_name %>">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="m_email" value="<%= m_email %>">
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<input type="text" name="m_phone" value="<%= m_phone %>">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="m_" value="<%= m_addr %>">
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="/layouts/footer.jsp" %>
</body>
</html>
