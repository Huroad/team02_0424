<%@ page language="java" contentType="text/html; charset=EUC-KR"
                pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form action="<%=request.getContextPath()%>/bulletin/b_search/b_search_list.jsp" method="post">
    <table>
        <tr>
            <td>
                <select name="sk">
                    <option value="m_name">�����</option>
                    <option value="m_id">�Խ��� �̸�</option>
                    <option value="b_title">����</option>
                    <option value="b_addr">�ּ�</option>
                </select>
            </td>
            <td>
                <input type="text" name="sv">
            </td>
            <td rowspan="3">
                <input type="submit" value="�˻���ư">
            </td>
        </tr>
        <tr>
            <td>
                ����
            </td>
            <td>
                <input type="text" name="start_amount">
                <input type="text" name="end_amount">
            </td>
        </tr>
        <tr>
            <td>
                ��ϳ�¥
            </td>
            <td>
                <input type="date" name="start_date">
                <input type="date" name="end_date">
            </td>
        </tr>
    </table>
</form>
