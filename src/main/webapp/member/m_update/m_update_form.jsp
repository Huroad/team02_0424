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
<%
	// Database Connection
	// 0. �غ�
	String send_id = request.getParameter("send_id");
	String m_id = "id", m_pw = "pw", m_name = "name", m_email = "email", m_phone = "phone", m_addr = "addr";
%>

<%@ include file="/layouts/header.jsp" %>
<%@ include file="/layouts/body.jsp" %>
<!-- TODO: ���� ���� �� �˸�â �߰�, ������ ǥ������ �ʵ��� ���� -->

<p>send_id: <%= send_id %>
</p>  <!-- test -->

<!-- content here -->
<div id="content">
	<form>
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
					<input type="text" name="m_" value="<%= m_addr %>">
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="/layouts/footer.jsp" %>
</body>
</html>
