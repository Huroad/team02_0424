<%@ page language="java" contentType="text/html; charset=EUC-KR"
                pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form action="<%=request.getContextPath()%>/bulletin/b_search/b_search_list.jsp" method="post">
    <table>
        <tr>
            <td>
                <select name="sk">
                    <option value="m_name">등록자</option>
                    <option value="m_id">게시판 이름</option>
                    <option value="b_title">제목</option>
                    <option value="b_addr">주소</option>
                </select>
            </td>
            <td>
                <input type="text" name="sv">
            </td>
            <td rowspan="3">
                <input type="submit" value="검색버튼">
            </td>
        </tr>
        <tr>
            <td>
                수량
            </td>
            <td>
                <input type="text" name="start_amount">
                <input type="text" name="end_amount">
            </td>
        </tr>
        <tr>
            <td>
                등록날짜
            </td>
            <td>
                <input type="date" name="start_date">
                <input type="date" name="end_date">
            </td>
        </tr>
    </table>
</form>
