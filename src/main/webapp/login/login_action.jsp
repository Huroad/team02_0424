<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
    request.setCharacterEncoding("euc-kr");
    String m_id = request.getParameter("m_id");
    String m_pw = request.getParameter("m_pw");
    System.out.println(m_id + "<-- m_id login_action.jsp");
    System.out.println(m_pw + "<-- m_pw login_action.jsp");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Class.forName("com.mysql.jdbc.Driver");

    String dbid = null;
    String dbpw = null;
    String dblevel = null;
    String dbname = null;
    String dbemail = null;
    String dbphone = null;
    String dbaddr = null;
    String msg = null;
    try{
        String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
                "useUnicode=true&characterEncoding=euckr";
        String dbUser = "dev51id";
        String dbPass = "dev51pw";

        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        System.out.println(conn + "<-- conn login_action.jsp");

        pstmt = conn.prepareStatement("SELECT * FROM tb02_member WHERE m_id=?");
        pstmt.setString(1, m_id);
        System.out.println(pstmt + "<-- pstmt login_action.jsp");

        rs = pstmt.executeQuery();
        System.out.println(rs + "<-- rs login_action.jsp");
        //System.out.println(rs.next() + "<-- rs.next() m_update_form.jsp");
        if(rs.next()){			//<---------- 아이디 일치 조건
            System.out.println("1-1 아이디 일치 조건");
            dbid = rs.getString("m_id");
            dbpw = rs.getString("m_pw");
            dblevel = rs.getString("m_level");
            dbname = rs.getString("m_name");
            dbemail = rs.getString("m_email");
            dbphone = rs.getString("m_phone");
            dbaddr = rs.getString("m_addr");
            System.out.println(dbid + "<-- dbid login_action.jsp");
            System.out.println(dbpw + "<-- dbpw login_action.jsp");
            System.out.println(dblevel + "<-- dblevel login_action.jsp");
            System.out.println(dbname + "<-- dbname login_action.jsp");
            System.out.println(dbemail + "<-- dbemail login_action.jsp");
            System.out.println(dbphone + "<-- dbphone login_action.jsp");
            System.out.println(dbaddr + "<-- dbaddr login_action.jsp");
            if(m_pw.equals(dbpw)){
                System.out.println("2-1 로그인 성공 조건");
                session.setAttribute("S_ID", dbid);
                session.setAttribute("S_LEVEL", dblevel);
                session.setAttribute("S_NAME", dbname);
                msg = "로그인 성공";
            }else{
                System.out.println("2-2 비번 불일치 조건");
                msg = "비번 불일치";
            }
        }else{
            System.out.println("1-2 아이디 불일치 조건");
            msg = "아이디 불일치";
        }
    } catch(SQLException ex) {
        out.println(ex.getMessage());
        ex.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
<script type="text/javascript">
    alert('<%= msg %>');
    location.href='<%= request.getContextPath()%>/index.jsp';
</script>







