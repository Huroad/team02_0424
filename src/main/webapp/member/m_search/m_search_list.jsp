<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Insert title here</title>
    <!-- <link rel="stylesheet" type="text/css" href="/layoutMG/css/main.css" /> -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>

<body>
<%@ include file="/layouts/header.jsp" %>
<%@ include file="/layouts/body.jsp" %>
<%@ include file="/member/m_search/m_search_form.jsp" %>

<table width="100%" border="1">
    <tr>
        <td>아이디</td><td>권한</td><td>이름</td><td>이메일</td><td>전화번호</td><td>주소</td><td>수정</td><td>삭제</td>
    </tr>
    <%
        request.setCharacterEncoding("euc-kr");
        String m = request.getParameter("m");
        String  input = request.getParameter("input");
        System.out.println(m + "<- m ");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver");

        String selectQuery1="SELECT * FROM tb02_member";
        System.out.println(selectQuery1 + "<- selectQuery1 ");

        String selectQuery2="SELECT * FROM tb02_member WHERE " + m + " LIKE(?) ";
        System.out.println(selectQuery2 + "<- selectQuery2 ");

        try {
            String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
                    "useUnicode=true&characterEncoding=euckr";
            String dbUser = "dev51id";
            String dbPass = "dev51pw";

            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            System.out.println(conn + "<-- conn ");

            if(m == null){
                pstmt = conn.prepareStatement(selectQuery1);
                System.out.println(pstmt + " <-- 초기");
            }else if(m.equals("all")){
                pstmt = conn.prepareStatement(selectQuery1);
                System.out.println(pstmt + " <-- 전체 조회");
            }else{
                pstmt = conn.prepareStatement(selectQuery2);
                pstmt.setString(1, "%" + input + "%");
                System.out.println(pstmt + " <-- 조건 조회");
            }

            rs = pstmt.executeQuery();
            System.out.println(rs + "<-- rs m_search_form.jsp");
            //System.out.println(rs.next() + "<-- rs.next() m_search_form.jsp");
            while(rs.next()){
                System.out.println("while 반복 횟수");
    %>

    <tr>
        <td><%= rs.getString("m_id")%></td>
        <td><%= rs.getString("m_level")%></td>
        <td><%= rs.getString("m_name")%></td>
        <td><%= rs.getString("m_email")%></td>
        <td><%= rs.getString("m_phone")%></td>
        <td><%= rs.getString("m_addr")%></td>
        <td>
            <a href="<%= request.getContextPath() %>/member/m_update/m_update_form.jsp?send_id=<%= rs.getString("m_id")%>">수정버튼</a>
        </td>
        <td>
            <a href="<%= request.getContextPath() %>/member/m_delete/m_delete_action.jsp?send_id=<%= rs.getString("m_id")%>">삭제버튼</a>
        </td>
    </tr>
    <%
            }

        } catch(SQLException ex) {
            out.println(ex.getMessage());
            ex.printStackTrace();
        } finally {
            // 6. 사용한 Statement 종료
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}

            // 7. 커넥션 종료
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    %>
</table>
<%@ include file="/layouts/footer.jsp" %>

</body>
</html>
