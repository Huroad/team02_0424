<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form action="<%=request.getContextPath()%>/member/m_search/m_search_list.jsp" method="post">

    <select name="m">
        <option value="all">전체</option>
        <option value="m_id">아이디</option>
        <option value="m_level">권한</option>
        <option value="m_name">이름</option>
        <option value="m_email">이메일</option>
        <option value="m_phone">전화번호</option>
        <option value="m_addr">주소</option>
    </select>
    <input type="text" name ="input">
    <input type="submit" value="검색버튼"> <br>
</form>
