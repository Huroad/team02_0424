<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%

    request.setCharacterEncoding("euc-kr");
    Connection conn = null;
    PreparedStatement pstmt = null;
    String b_code = request.getParameter("send_id");

    Class.forName("com.mysql.jdbc.Driver");
    String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
            "useUnicode=true&characterEncoding=euckr";
    String dbUser = "dev51id";
    String dbPass = "dev51pw";

    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);


    pstmt = conn.prepareStatement("DELETE FROM tb02_bulletin WHERE b_code = ?");
    pstmt.setString(1, b_code);
    pstmt.executeUpdate();

    pstmt.close();
    conn.close();

    response.sendRedirect(request.getContextPath()+"/bulletin/b_search/b_search_list.jsp");
%>
