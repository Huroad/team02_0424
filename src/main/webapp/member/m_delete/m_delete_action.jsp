<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
				 pageEncoding="EUC-KR" %>

<%@ include file="../../WEB-INF/driver/mySqlDriverConn.jsp" %>
<%
	request.setCharacterEncoding("euc-kr");
	String m_id = request.getParameter("send_id");

	try {
		// 3. 쿼리문 준비
		String updateQuery =
						"DELETE FROM tb02_member WHERE m_id =?";
		pstmt = conn.prepareStatement(updateQuery);

		int count = 0;
		pstmt.setString(++count, m_id);
		System.out.println(pstmt);

		// 4. 쿼리문 실행
		conn.setAutoCommit(false);
		int result = pstmt.executeUpdate();

		// 5. 쿼리 실행 결과 사용 - 생략
		conn.commit();
		conn.setAutoCommit(true);

		// 6, 7. 객체 종료
		if (!pstmt.isClosed()) {
			pstmt.close();
		}
		if (!conn.isClosed()) {
			conn.close();
		}
%>
<script>
	alert('회원 정보가 삭제되었습니다.');
	location.href = "<%=request.getContextPath()%>";
</script>
<%
	} catch (SQLException e) {
		System.out.println(e);
	}
%>
