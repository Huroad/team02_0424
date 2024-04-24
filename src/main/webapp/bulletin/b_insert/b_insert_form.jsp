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
<title>�Խ��� ���</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/layouts/header.jsp" %>

<%@ include file="/layouts/body.jsp" %>
<%@ include file="/layouts/footer.jsp" %>

<form action="<%= request.getContextPath() %>/bulletin/b_insert/b_insert_action.jsp" method="post">
<table border="1">
<tr>
	<td>�Խ��ǹ�ȣ</td>
	<td><input type="text" name="b_code" size="20"></td>
<tr>
<tr>
	<td>Title</td>
	<td><input type="text" name="b_title" size="20"></td>
<tr>
<tr>
	<td>���̵�</td>
	<td><input type="text" name="m_id" size="20"></td>
<tr>
<tr>
	<td>�Խó�¥</td>
	<td><input type="date" name="b_date" size="20" readonly id="b_date"></td>
<tr>
<tr>
	<td>�Ѽ���</td>
	<td><input type="text" name="b_amount" size="20"></td>
<tr>
<tr>
	<td>����</td>
	<td><textarea name="b_body" rows="5" style="width: 100%; padding 5px;"></textarea></td>
<tr>
<tr>
	<td>�ּ�</td>
	<td><input type="text" name="b_addr" size="20"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="�Խ� �� ���"></td>
</tr>
</table>
</form>

<script>
    // ���� ��¥�� �������� �Լ�
    function getCurrentDate() {
        var today = new Date();
        var year = today.getFullYear();
        var month = String(today.getMonth() + 1).padStart(2, '0');
        var day = String(today.getDate()).padStart(2, '0');
        return year + '-' + month + '-' + day;
    }

    // ���� ��¥�� �Է¶��� ����
    document.getElementById('b_date').value = getCurrentDate();
</script>

</body>
</html>
