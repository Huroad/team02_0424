<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
				 pageEncoding="EUC-KR" %>

<%@ include file="../../WEB-INF/driver/mySqlDriverConn.jsp" %>
<%
	request.setCharacterEncoding("euc-kr");
	String m_pw = request.getParameter("m_pw");
	String m_level = request.getParameter("m_level");
	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
	String m_phone = request.getParameter("m_phone");
	String m_addr = request.getParameter("m_addr");
	String m_id = request.getParameter("m_id");

	try {
		// 3. 쿼리문 준비
		String updateQuery =
						"UPDATE tb02_member"
										+ " SET m_pw=?, m_level=?, m_name=?, m_email=?,	m_phone=?, m_addr=?"
										+ " WHERE m_id =?";
		pstmt = conn.prepareStatement(updateQuery);

		int count = 0;
		pstmt.setString(++count, m_pw);
		pstmt.setString(++count, m_level);
		pstmt.setString(++count, m_name);
		pstmt.setString(++count, m_email);
		pstmt.setString(++count, m_phone);
		pstmt.setString(++count, m_addr);
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
	alert('회원 정보가 수정되었습니다.');
	location.href = "<%=request.getContextPath()%>";
</script>
<%
	} catch (SQLException e) {
		System.out.println(e);
	}
%>
