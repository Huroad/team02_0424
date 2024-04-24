<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%

    String b_code = request.getParameter("send_id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Class.forName("com.mysql.jdbc.Driver");

    String title = null;
    String body = null;
    String amount = null;
    String addr = null;
    String date = null;

    try{
        String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
                "useUnicode=true&characterEncoding=euckr";
        String dbUser = "dev51id";
        String dbPass = "dev51pw";
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

        pstmt = conn.prepareStatement("SELECT * FROM tb02_bulletin WHERE b_code = ?");
        pstmt.setString(1, b_code);
        rs = pstmt.executeQuery();


        if(rs.next()){
            title = rs.getString("b_title");
            body = rs.getString("b_body");
            amount = rs.getString("b_amount");
            addr = rs.getString("b_addr");
            date = rs.getString("b_date");


            System.out.println(body);
            System.out.println(date);
            System.out.println(title);
            System.out.println(amount);
            System.out.println(addr);


        }
    }catch(SQLException ex) {
        out.println(ex.getMessage());
        ex.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
<html>
<head>
    <meta charset="EUC-KR">
    <style>
    body {
        margin: 0;
    }
    form {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
        text-align: center;
    }
    .label-area {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }
    .label-area input {
        border-top: none;
        border-right: none;
        border-left: none;
        border-bottom: 1px solid black;
    }
    input.update-btn {
        background-color: white;
        color: black;
        border-radius: 4px;
        border: 1px solid #d5d5d5;
        margin-top: 10px;
        cursor: pointer;
    }


    </style>
</head>
<body>
<form action="<%= request.getContextPath() %>/bulletin/b_update/b_update_action.jsp" method="post">
    <div class="label-area">
        <label> <input type="hidden" name="b_code"  value="<%= b_code %>" /></label>
        <label> 제 목 :  <input type="text" name="b_title"  value="<%= title %>" /></label>
        <label> 내 용 :  <input class="text-box" type="text" name="b_body"  value="<%= body %>" ></label>
        <label> 수 량 :  <input type="text" name="b_amount"  value="<%= amount %>" /></label>
        <label> 주 소 :  <input type="text" name="b_addr"  value="<%= addr %>" /></label>
        <label> 등록일 : <input type="text" name="b_date"  value="<%= date %>" readonly /></label>
    </div>
    <input class="update-btn" type="submit" value="수정하기">
</form>
</body>
</html>

