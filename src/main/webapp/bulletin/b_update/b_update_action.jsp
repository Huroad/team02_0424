<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%

    request.setCharacterEncoding("euc-kr");
    Connection conn = null;
    PreparedStatement pstmt = null;

    String b_code = request.getParameter("b_code");
    String b_title = request.getParameter("b_title");
    String b_body = request.getParameter("b_body");
    String b_amount = request.getParameter("b_amount");
    String b_addr = request.getParameter("b_addr");
    String b_date = request.getParameter("b_date");



    Class.forName("com.mysql.jdbc.Driver");
    String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
            "useUnicode=true&characterEncoding=euckr";
    String dbUser = "dev51id";
    String dbPass = "dev51pw";

    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

    pstmt = conn.prepareStatement("UPDATE tb02_bulletin SET b_title=?, b_body=?, b_amount=?, b_addr=?, b_date= CURDATE()  WHERE b_code = ?;");

    pstmt.setString(1, b_title);
    pstmt.setString(2, b_body);
    pstmt.setString(3, b_amount);
    pstmt.setString(4, b_addr);
    pstmt.setString(5, b_code);


    pstmt.executeUpdate();

    pstmt.close();
    conn.close();

    response.sendRedirect(request.getContextPath()+"/bulletin/b_search/b_search_list.jsp");
%>








