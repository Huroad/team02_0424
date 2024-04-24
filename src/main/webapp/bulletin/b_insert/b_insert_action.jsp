<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
//post방식 한글 처리 방법
request.setCharacterEncoding("euc-kr");
Connection conn = null;
PreparedStatement pstmt = null;

String b_code = request.getParameter("b_code");
String b_title = request.getParameter("b_title");
String m_id = request.getParameter("m_id");
String b_date = request.getParameter("b_date");
String b_amount = request.getParameter("b_amount");
String b_body = request.getParameter("b_body");
String b_addr = request.getParameter("b_addr");

// 콘솔창 확인용
System.out.println(b_code + "<-- m_id /b_insert/b_insert_action.jsp");
System.out.println(b_title + "<-- m_id /minsert/b_insert_action.jsp");
System.out.println(m_id + "<-- m_id /m_insert/m_insert_action.jsp");
System.out.println(b_title + "<-- m_id /minsert/b_insert_action.jsp");
System.out.println(b_title + "<-- m_id /minsert/b_insert_action.jsp");

Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

// db 확인용
System.out.println(conn + "<-- conn");

// 쿼리문
pstmt = conn.prepareStatement("INSERT INTO tb02_bulletin (b_code, b_title, m_id, b_date, b_amount, b_body, b_addr) VALUES (?, ?, ?, now(), ?, ?, ?)");

// 쿼리 실행 1번
System.out.println(pstmt + "<-- pstmt-1");

// db에 입력값 집어 넣기
pstmt.setString(1, b_code);
pstmt.setString(2, b_title);
pstmt.setString(3, m_id);
pstmt.setString(4, b_amount);
pstmt.setString(5, b_body);
pstmt.setString(6, b_addr);
System.out.println(pstmt + "<-- pstmt-2");

//여기까지가 3단계 : 쿼리 실행 준비 완료!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int result = pstmt.executeUpdate(); //4단계 : 쿼리 실행
System.out.println(result + "<-- result");
//1<-- result
pstmt.close();
conn.close();

response.sendRedirect(request.getContextPath()+"/index.jsp");

%>





















