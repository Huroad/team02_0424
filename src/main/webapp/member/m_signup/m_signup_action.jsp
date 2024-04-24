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

    String m_id = request.getParameter("m_id");
    String m_pw = request.getParameter("m_pw");
    String m_level = request.getParameter("m_level");
    String m_name = request.getParameter("m_name");
    String m_email = request.getParameter("m_email");
    String m_phone = request.getParameter("m_phone");
    String m_addr = request.getParameter("m_addr");

    System.out.println(m_id + "<-- m_id /m_signup/m_signup_action.jsp");
    System.out.println(m_pw + "<-- m_pw /m_signup/m_signup_action.jsp");
    System.out.println(m_level + "<-- m_level /m_signup/m_signup_action.jsp");
    System.out.println(m_name + "<-- m_name /m_signup/m_signup_action.jsp");
    System.out.println(m_email + "<-- m_email /m_signup/m_signup_action.jsp");
    System.out.println(m_phone + "<-- m_phone /m_signup/m_signup_action.jsp");
    System.out.println(m_addr + "<-- m_addr /m_signup/m_signup_action.jsp");

    Class.forName("com.mysql.jdbc.Driver");
    String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
            "useUnicode=true&characterEncoding=euckr";
    String dbUser = "dev51id";
    String dbPass = "dev51pw";

    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    System.out.println(conn + "<-- conn");

    pstmt = conn.prepareStatement("INSERT INTO tb02_member VALUES (?, ?, ?, ?, ?, ?, ?)");

    System.out.println(pstmt + "<-- pstmt-1");

    pstmt.setString(1, m_id);
    pstmt.setString(2, m_pw);
    pstmt.setString(3, m_level);
    pstmt.setString(4, m_name);
    pstmt.setString(5, m_email);
    pstmt.setString(6, m_phone);
    pstmt.setString(7, m_addr);

    System.out.println(pstmt + "<-- pstmt-2");

    pstmt.executeUpdate();

    pstmt.close();
    conn.close();

    response.sendRedirect(request.getContextPath()+"/member/m_search/m_search_list.jsp");
%>












