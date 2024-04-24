<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="EUC-KR">
        <title>지존팀_회원가입 페이지</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
    </head>
    <body>
        <%@ include file="/layouts/header.jsp"%>
        <%@ include file="/layouts/body.jsp"%>
        <form action="<%= request.getContextPath() %>/member/m_signup/m_signup_action.jsp" method="post">
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="m_id" size="20"></td>
                <tr>
                <tr>
                    <td>암호</td>
                    <td><input type="text" name="m_pw" size="20"></td>
                <tr>
                <tr>
                    <td>권한</td>
                <td>
                    <select name="m_level">
                        <option value="관리자">관리자</option>
                        <option value="일반회원">일반회원</option>
                    </select>
                </td>
                <tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="m_name" size="20"></td>
                <tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="m_email" size="20"></td>
                <tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" name="m_phone" size="20"></td>
                <tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" name="m_addr" size="20"></td>
                <tr>
                <tr>
                    <td colspan="7"><input type="submit" value="회원가입버튼"></td>
                </tr>
            </table>

        </form>
    </body>
</html>