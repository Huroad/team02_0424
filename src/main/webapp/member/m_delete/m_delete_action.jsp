<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
				 pageEncoding="EUC-KR" %>

<%@ include file="../../WEB-INF/driver/mySqlDriverConn.jsp" %>
<%
	request.setCharacterEncoding("euc-kr");
	String m_id = request.getParameter("send_id");

	try {
		// 3. ������ �غ�
		String updateQuery =
						"DELETE FROM tb02_member WHERE m_id =?";
		pstmt = conn.prepareStatement(updateQuery);

		int count = 0;
		pstmt.setString(++count, m_id);
		System.out.println(pstmt);

		// 4. ������ ����
		conn.setAutoCommit(false);
		int result = pstmt.executeUpdate();

		// 5. ���� ���� ��� ��� - ����
		conn.commit();
		conn.setAutoCommit(true);

		// 6, 7. ��ü ����
		if (!pstmt.isClosed()) {
			pstmt.close();
		}
		if (!conn.isClosed()) {
			conn.close();
		}
%>
<script>
	alert('ȸ�� ������ �����Ǿ����ϴ�.');
	location.href = "<%=request.getContextPath()%>";
</script>
<%
	} catch (SQLException e) {
		System.out.println(e);
	}
%>
