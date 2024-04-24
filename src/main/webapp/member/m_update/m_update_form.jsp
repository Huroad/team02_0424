<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
				 pageEncoding="EUC-KR" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>ȸ������ ����</title>
</head>
<body>
<!-- 1~3. ����̹� �ε�, DB ���� -->
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
		// 3. ������ �غ�
		String selectQuery = "SELECT * FROM tb02_member WHERE m_id=?";
		pstmt = conn.prepareStatement(selectQuery);

		int count = 0;
		pstmt.setString(++count, send_id);
		System.out.println(pstmt);

		// 4. ������ ����
		rs = pstmt.executeQuery();

		// 5. ���� ������ ���
		rs.next();
		m_id = rs.getString("m_id");
		m_pw = rs.getString("m_pw");
		m_level = rs.getString("m_level");
		m_name = rs.getString("m_name");
		m_email = rs.getString("m_email");
		m_phone = rs.getString("m_phone");
		m_addr = rs.getString("m_addr");

		// 6, 7. ��ü ����
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
<!-- TODO: ���� ���� �� �˸�â �߰�, ������ ǥ������ �ʵ��� ���� -->

<p>send_id: <%= send_id %>
</p>  <!-- test -->

<!-- content here -->
<div id="content">
	<form action="<%= request.getContextPath() %>/member/m_update/m_update_action.jsp" method="POST">
		<table>
			<tr>
				<td>���̵�</td>
				<td>
					<input type="text" name="m_id" value="<%= m_id %>" readonly>
				</td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td>
					<input type="password" name="m_pw" value="<%= m_pw %>">
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td>
					<select name="m_level">
						<option value="�Ϲ�ȸ��">�Ϲ�ȸ��</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td>
					<input type="text" name="m_name" value="<%= m_name %>">
				</td>
			</tr>
			<tr>
				<td>�̸���</td>
				<td>
					<input type="text" name="m_email" value="<%= m_email %>">
				</td>
			</tr>
			<tr>
				<td>����ó</td>
				<td>
					<input type="text" name="m_phone" value="<%= m_phone %>">
				</td>
			</tr>
			<tr>
				<td>�ּ�</td>
				<td>
					<input type="text" name="m_addr" value="<%= m_addr %>">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="����">
					<input type="button" value="���" onclick="location.href='<%= request.getContextPath() %>'">
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="/layouts/footer.jsp" %>
</body>
</html>
