<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
//post방식 한글 처리 방법
request.setCharacterEncoding("euc-kr");

String b_title = request.getParameter("b_title");
String m_id = request.getParameter("m_id");
String b_date = request.getParameter("b_date");
String b_amount = request.getParameter("b_amount");
String b_body = request.getParameter("b_body");
String b_addr = request.getParameter("b_addr");

// 콘솔창 확인용
System.out.println(b_title + "<-- m_id /b_insert/b_insert_action.jsp");
System.out.println(m_id + "<-- m_id /b_insert/b_insert_action.jsp");
System.out.println(b_date + "<-- b_date/b_insert/b_insert_action.jsp");
System.out.println(b_amount + "<-- b_mount/b_insert/b_insert_action.jsp");
System.out.println(b_body + "<-- b_body/b_insert/b_insert_action.jsp");
System.out.println(b_addr + "<-- b_addr/b_insert/b_insert_action.jsp");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

// insert 쿼리 문과 작동 값
PreparedStatement pstmt_insert = null;
ResultSet rs_insert = null;


Class.forName("com.mysql.jdbc.Driver");
try{
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";
conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
// db 확인용
System.out.println(conn + "<-- conn");
// 쿼리문 select
pstmt = conn.prepareStatement("select max(CAST(substring(b_code,3) AS DECIMAL)) AS maxcol from tb02_bulletin");

rs = pstmt.executeQuery();

int max = 0;
String tempCode = "bc";
String b_code = rs.getString("maxcol");
if(rs.next()) {
	max = rs.getInt(1);
	System.out.println(max + "<-- max 1");
	max = max + 1;
	System.out.println(max + "<-- max 2");
	b_code = tempCode + max;
	System.out.println(b_code + "<-- b_code");
}

// 쿼리문 insert
pstmt_insert = conn.prepareStatement("INSERT INTO tb02_bulletin (b_code, b_title, m_id, b_date, b_amount, b_body, b_addr) VALUES (?, ?, ?, now(), ?, ?, ?)");
// 쿼리 실행 1번
System.out.println(pstmt + "<-- pstmt-1");

// db에 입력값 집어 넣기
pstmt_insert.setString(1, b_code);
pstmt_insert.setString(2, b_title);
pstmt_insert.setString(3, m_id);
pstmt_insert.setString(4, b_amount);
pstmt_insert.setString(5, b_body);
pstmt_insert.setString(6, b_addr);
System.out.println(pstmt + "<-- pstmt-2");

int insertResult = pstmt_insert.executeUpdate();
System.out.println(insertResult + "<-- result 등록결과"); 


} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close();  } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close();  } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	response.sendRedirect(request.getContextPath()+"/index.jsp");
}

%>





















