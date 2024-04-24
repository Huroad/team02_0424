<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>

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

        .scrollable {
            width: 100%;
            height: 300px;
            overflow-y: auto;
        }

    </style>
</head>

<body>
<%@ include file="b_search_form.jsp" %>
상품 검색
<br>
<div class="scrollable">
    <table width="100%" border="1">
        <tr>
            <%
                // 0. 준비
                request.setCharacterEncoding("euc-kr"); //post한글처리
                String sk = request.getParameter("sk"); // 카테고리
                String sv = request.getParameter("sv"); // 들어오는 값
                boolean withSearch = false;
                String start_amount = request.getParameter("start_amount");
                String end_amount = request.getParameter("end_amount");
                boolean withAmount = false;
                String start_date = request.getParameter("start_date");
                String end_date = request.getParameter("end_date");
                boolean withDate = false;
                String order = request.getParameter("order"); //정렬
                boolean withOrder = false;
                boolean orderDesc = Boolean.parseBoolean(request.getParameter("desc"));


                if (sk != null) {
                    withSearch = true;
                    if (sk.isEmpty()) {
                        withSearch = false;
                    }
                }
                if (sv != null) {
                    withSearch = true;
                    if (sv.isEmpty()) {
                        withSearch = false;
                    }
                }
                if (start_amount != null) {
                    withAmount = true;
                    if (start_amount.isEmpty()) {
                        withAmount = false;
                    }
                }
                if (end_amount != null) {
                    withAmount = true;
                    if (end_amount.isEmpty()) {
                        withAmount = false;
                    }
                }
                if (start_date != null) {
                    withDate = true;
                    if (start_date.isEmpty()) {
                        withDate = false;
                    }
                }
                if (end_date != null) {
                    withDate = true;
                    if (end_date.isEmpty()) {
                        withDate = false;
                    }
                }
                if (order != null) {
                    withOrder = true;
                    if (order.isEmpty()) {
                        withOrder = false;
                    }
                }

                System.out.println();
                System.out.println("sk: " + sk);
                System.out.println("sv: " + sv);
                System.out.println("start_amount: " + start_amount);
                System.out.println("end_amount: " + end_amount);
                System.out.println("start_date: " + start_date);
                System.out.println("end_date: " + end_date);
                System.out.println("order: " + order);
                System.out.println("orderDesc: " + orderDesc);

                String[] columns = {"b_code",
                        "b_title",
                        "m_name",
                        "m_id",
                        "b_amount",
                        "b_addr",
                        "b_date"};
                String[] names = {"게시판코드",
                        "제목",
                        "등록자",
                        "아이디",
                        "수량",
                        "주소",
                        "등록일"};
                for (int i = 0; i < columns.length; i++) {
                    if (orderDesc) {
            %>
            <td>
                <a href="<%=request.getContextPath()%>/bulletin/b_search/b_search_list.jsp?order=<%= columns[i] %>&desc=false"><%= names[i] %>
            </td>
            <%
            } else {
            %>
            <td>
                <a href="<%=request.getContextPath()%>/bulletin/b_search/b_search_list.jsp?order=<%= columns[i] %>&desc=true"><%= names[i] %>
            </td>
            <%
                    }
                }
            %>
            <td>수정</td>
            <td>삭제</td>
        </tr>
        <%
            // 1. 드라이버 로드
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver");

            // 쿼리문 작성
            String selectQuery ="select * from tb02_member inner join tb02_bulletin on tb02_member.m_id = tb02_bulletin.m_id";
            // String selectQueryWithDate = "select * from tb_goods " +
            // "WHERE DATE_FORMAT(g_date,'%Y-%m-%d') between ? and ? " +
            // "order by g_date";
            try {
                // 2. DB 연결
                String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
                        "useUnicode=true&characterEncoding=euckr";
                String dbUser = "dev51id";
                String dbPass = "dev51pw";
                conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

                // 3. 쿼리문 생성(조건에 따라 다르게 생성)
                if (withSearch) {
                    selectQuery += " WHERE " + sk + " LIKE ?";
                    if (withAmount || withDate) {
                        selectQuery += " AND";
                    }
                }
                if (withAmount) {
                    if (!selectQuery.contains("WHERE")) {
                        selectQuery += " WHERE";
                    }
                    selectQuery += " b_amount between ? and ?";
                    if (withDate) {
                        selectQuery += " AND";
                    }
                }
                if (withDate) {
                    if (!selectQuery.contains("WHERE")) {
                        selectQuery += " WHERE";
                    }
                    selectQuery += " DATE_FORMAT(b_date,'%Y-%m-%d') between ? and ?";
                }
                if (withOrder) {
                    List<String> bulletinColumns = Arrays.asList("b_code", "b_title", "b_amount", "b_addr", "b_date");
                    List<String> memberColumns = Arrays.asList("m_name", "m_id");
                    if(bulletinColumns.contains(order)) {
                        if (orderDesc) {
                            selectQuery += " ORDER BY tb02_bulletin." + order + " DESC";
                        } else {
                            selectQuery += " ORDER BY tb02_bulletin." + order;
                        }
                    } else if(memberColumns.contains(order)) {
                        if (orderDesc) {
                            selectQuery += " ORDER BY tb02_member." + order + " DESC";
                        } else {
                            selectQuery += " ORDER BY tb02_member." + order;
                        }
                    } else {
                        System.out.println("테이블에 없음" + order);
                    }
                }
                pstmt = conn.prepareStatement(selectQuery);

                int count = 0;
                if (withSearch) {
                    sv = "%" + sv + "%";
                    pstmt.setString(++count, sv);
                }
                if (withAmount) {
                    pstmt.setString(++count, start_amount);
                    pstmt.setString(++count, end_amount);
                }
                if (withDate) {
                    pstmt.setString(++count, start_date);
                    pstmt.setString(++count, end_date);
                }
                System.out.println(pstmt);

                // 4. 쿼리 실행
                rs = pstmt.executeQuery();
                // 5. 쿼리 결과 사용

                while (rs.next()) {
                    if (withOrder) {

        %>
        <tr>
            <%
                for (int i = 0; i < columns.length; i++) {
                    String columnsName = columns[i];
                    String columnsValue = rs.getString(columnsName);
                    if(columnsName.equals("b_title")){
            %>
            <td>
                <a href="<%= request.getContextPath() %>/member/m_search/m_search_list.jsp?b_code=<%= rs.getString("b_code") %>"><%= columnsValue %></a>
            </td>
            <%
                } else {
            %>
            <td>
                <%= columnsValue %>
            </td>
            <%
                    }
                }
            %>
            <td>
                <a href="<%= request.getContextPath() %>/bulletin/b_update/b_update_form.jsp?send_id=<%= rs.getString("b_code")%>">수정버튼</a>
            </td>
            <td>
                <a href="<%= request.getContextPath() %>/bulletin/b_delete/b_delete_action.jsp?send_id=<%= rs.getString("b_code")%>">삭제버튼</a>
            </td>
        </tr>
        <%
                continue;
            }
        %>
        <tr>
            <%
                for (int i = 0; i < columns.length; i++) {
                    String columnsName = columns[i];
                    String columnsValue = rs.getString(columnsName);
                    if(columnsName.equals("b_title")){
            %>
            <td>
                <a href="<%= request.getContextPath() %>/member/m_search/m_search_list.jsp?b_code=<%= rs.getString("b_code") %>"><%= columnsValue %></a>
            </td>
            <%
            } else {
            %>
            <td>
                <%= columnsValue %>
            </td>
            <%
                    }
                }
            %>
            <td>
                <a href="<%= request.getContextPath() %>/bulletin/b_update/b_update_form.jsp?send_id=<%= rs.getString("b_code")%>">수정버튼</a>
            </td>
            <td>
                <a href="<%= request.getContextPath() %>/bulletin/b_delete/b_delete_action.jsp?send_id=<%= rs.getString("b_code")%>">삭제버튼</a>
            </td>
        </tr>
        <%
                }
            } catch (SQLException ex) {
                out.println(ex.getMessage());
                ex.printStackTrace();
            } finally {
                // 6. 사용한 Statement 종료
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException ex) {
                    }
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException ex) {
                    }
                }
                // 7. 커넥션 종료
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException ex) {
                    }
                }
            }
        %>
    </table>
</div>
<%--<%@ include file="/module/hadan.jsp" %>--%>

</body>
</html>
