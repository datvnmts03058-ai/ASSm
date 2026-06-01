<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/style.css">

</head>
<body>

<div style="height:100vh;display:flex;justify-content:center;align-items:center;">

<div class="card" style="width:450px">

<h1 align="center">🎧 Đăng ký</h1>

<form action="${pageContext.request.contextPath}/register" method="post">

<input name="username"
placeholder="Tên đăng nhập">

<input type="password"
name="password"
placeholder="Mật khẩu">

<input name="fullname"
placeholder="Họ và tên">

<input name="email"
placeholder="Email">

<button>Tạo tài khoản</button>

</form>

<br>

<p style="text-align:center">
<a href="${pageContext.request.contextPath}/login">
Đã có tài khoản?
</a>
</p>

</div>

</div>
</body>
</html>