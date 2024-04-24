<%@ page language="java" contentType="text/html; charset=EUC-KR"
				 pageEncoding="EUC-KR" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>

<%
	// 1. 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	// 2. DB 연결
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
					"useUnicode=true&characterEncoding=euckr";
	String dbId = "dev51id";
	String dbPw = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbId, dbPw);
%>
