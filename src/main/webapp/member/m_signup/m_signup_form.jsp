<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="EUC-KR">
        <title>������_ȸ������ ������</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
    </head>
    <body>
        <%@ include file="/layouts/header.jsp"%>
        <%@ include file="/layouts/body.jsp"%>
        <form action="<%= request.getContextPath() %>/member/m_signup/m_signup_action.jsp" method="post">
            <table>
                <tr>
                    <td>���̵�</td>
                    <td><input type="text" name="m_id" size="20"></td>
                <tr>
                <tr>
                    <td>��ȣ</td>
                    <td><input type="text" name="m_pw" size="20"></td>
                <tr>
                <tr>
                    <td>����</td>
                <td>
                    <select name="m_level">
                        <option value="������">������</option>
                        <option value="�Ϲ�ȸ��">�Ϲ�ȸ��</option>
                    </select>
                </td>
                <tr>
                <tr>
                    <td>�̸�</td>
                    <td><input type="text" name="m_name" size="20"></td>
                <tr>
                <tr>
                    <td>�̸���</td>
                    <td><input type="text" name="m_email" size="20"></td>
                <tr>
                <tr>
                    <td>��ȭ��ȣ</td>
                    <td><input type="text" name="m_phone" size="20"></td>
                <tr>
                <tr>
                    <td>�ּ�</td>
                    <td><input type="text" name="m_addr" size="20"></td>
                <tr>
                <tr>
                    <td colspan="7"><input type="submit" value="ȸ�����Թ�ư"></td>
                </tr>
            </table>

        </form>
    </body>
</html>