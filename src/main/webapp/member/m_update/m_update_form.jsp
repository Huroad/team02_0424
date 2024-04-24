<%@ page import="java.sql.SQLException" %>
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
<!-- 1~3. 드라이버 로드, DB 연결 -->
<%@ include file="../../WEB-INF/driver/mySqlDriverConn.jsp" %>

<%
	request.setCharacterEncoding("euc-kr");
	String send_id = request.getParameter("send_id");
	String m_id = null;
	String m_pw = null;
	String m_level = null;
	String m_name = null;
	String m_email = null;
	String m_phone = null;
	String m_addr = null;

	try {
		// 3. 쿼리문 준비
		String selectQuery = "SELECT * FROM tb02_member WHERE m_id=?";
		pstmt = conn.prepareStatement(selectQuery);

		int count = 0;
		pstmt.setString(++count, send_id);
		System.out.println(pstmt);

		// 4. 쿼리문 실행
		rs = pstmt.executeQuery();

		// 5. 쿼리 실행결과 사용
		rs.next();
		m_id = rs.getString("m_id");
		m_pw = rs.getString("m_pw");
		m_level = rs.getString("m_level");
		m_name = rs.getString("m_name");
		m_email = rs.getString("m_email");
		m_phone = rs.getString("m_phone");
		m_addr = rs.getString("m_addr");

		// 6, 7. 객체 종료
		if (!rs.isClosed()) {
			rs.close();
		}
		if (!pstmt.isClosed()) {
			pstmt.close();
		}
		if (!conn.isClosed()) {
			conn.close();
		}
	} catch (SQLException e) {
		System.out.println(e);
	}

%>
<%@ include file="/layouts/header.jsp" %>
<%@ include file="/layouts/body.jsp" %>
<!-- TODO: 권한 없을 시 알림창 뜨고, 페이지 표시하지 않도록 구현 -->

<p>send_id: <%= send_id %>
</p>  <!-- test -->

<!-- content here -->
<div id="content">
	<form action="<%= request.getContextPath() %>/member/m_update/m_update_action.jsp" method="POST">
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
					<input type="text" name="m_addr" value="<%= m_addr %>">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="location.href='<%= request.getContextPath() %>'">
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="/layouts/footer.jsp" %>
</body>
</html>
