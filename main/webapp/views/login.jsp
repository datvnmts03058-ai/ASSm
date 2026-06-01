<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/style.css">

</head>
<body>

<div style="height:100vh;display:flex;justify-content:center;align-items:center;">

<div class="card" style="width:400px">

<h1 align="center">🎵 Music Web</h1>

<br>

<form action="${pageContext.request.contextPath}/login" method="post">

<input name="username"
placeholder="Tên đăng nhập">

<input type="password"
name="password"
placeholder="Mật khẩu">

<button>Đăng nhập</button>

</form>

<br>

<p style="text-align:center;color:red">
${message}
</p>

<p align="center">
Chưa có tài khoản?
<a href="${pageContext.request.contextPath}/register">
Đăng ký
</a>
</p>

</div>

</div>

</body>
</html>