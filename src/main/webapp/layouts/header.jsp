<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="header">
    <a href="/index.jsp"><img
            src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/10d7e8b1-9fe1-4c41-aeb7-331f4fb188aa/desbthu-f1421597-f492-40f6-87f5-f7df71b630db.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzEwZDdlOGIxLTlmZTEtNGM0MS1hZWI3LTMzMWY0ZmIxODhhYVwvZGVzYnRodS1mMTQyMTU5Ny1mNDkyLTQwZjYtODdmNS1mN2RmNzFiNjMwZGIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.F-Ysq5sbQQCGPRAhFCX8kjHXq6iCKSXO_bfRSXalL9c"
            alt="logo" width="130" height="50"></a>
    <div class="menu">
        <div class="svg-wrapper">
            <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
                <rect id="shape" height="40" width="150"/>
                <div id="text">
                    <a href=""><span class="spot"></span>POST</a>
                </div>
            </svg>
        </div>
        <div class="svg-wrapper">
            <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
                <rect id="shape" height="40" width="150"/>
                <div id="text">
                    <a href=""><span class="spot"></span>USER</a>
                </div>
            </svg>
        </div>
        <div class="svg-wrapper">
            <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
                <rect id="shape" height="40" width="150"/>
                <div id="text">
                    <a href=""><span class="spot"></span>PARTY</a>
                </div>
            </svg>
        </div>
    </div>
    <div class="searchWrap">
        <div class="search">
            <input type="text" class="searchTerm" placeholder="통합검색">
            <button type="submit" class="searchButton">
                <i class="fa fa-search"></i>
            </button>
        </div>
    </div>
    <div class="login">
        <a href="../login/login_form.jsp" class="button button--login button--border-thin button--text-thick">Login</a>
        <a href="member/m_signup" class="button button--login button--border-thin button--text-thick">Signup</a>
    </div>
</div>
</body>
</html>