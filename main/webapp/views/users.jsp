<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý User</title>

<style>

body{
	background:#121212;
	color:white;
	font-family:Arial;
	padding:20px;
}

input,select{
	width:100%;
	padding:10px;
	margin:5px 0;
}

button{
	padding:10px 15px;
	cursor:pointer;
}

table{
	width:100%;
	border-collapse:collapse;
	margin-top:20px;
}

th,td{
	padding:10px;
	border:1px solid #444;
}

th{
	background:#8e44ad;
}

</style>

</head>
<body>

<h1>👥 QUẢN LÝ USER</h1>

<form method="post"
	action="${pageContext.request.contextPath}/users">

	<input type="hidden"
		   name="id"
		   value="${form.id}">

	<input type="text"
		   name="username"
		   placeholder="Username"
		   value="${form.username}">

	<input type="text"
		   name="password"
		   placeholder="Password"
		   value="${form.password}">

	<input type="text"
		   name="fullname"
		   placeholder="Fullname"
		   value="${form.fullname}">

	<input type="email"
		   name="email"
		   placeholder="Email"
		   value="${form.email}">

	<select name="role">

		<option value="USER">
			USER
		</option>

		<option value="ADMIN">
			ADMIN
		</option>

	</select>

	<c:choose>

		<c:when test="${not empty form}">

			<button
				name="action"
				value="update">

				Cập nhật

			</button>

		</c:when>

		<c:otherwise>

			<button
				name="action"
				value="create">

				Thêm mới

			</button>

		</c:otherwise>

	</c:choose>

</form>

<table>

<tr>
	<th>ID</th>
	<th>Username</th>
	<th>Fullname</th>
	<th>Email</th>
	<th>Role</th>
	<th>Action</th>
</tr>

<c:forEach items="${users}" var="u">

<tr>

	<td>${u.id}</td>
	<td>${u.username}</td>
	<td>${u.fullname}</td>
	<td>${u.email}</td>
	<td>${u.role}</td>

	<td>

		<a href="${pageContext.request.contextPath}/users?action=edit&id=${u.id}">
			Sửa
		</a>

		|

		<form style="display:inline"
			  method="post"
			  action="${pageContext.request.contextPath}/users">

			<input type="hidden"
				   name="id"
				   value="${u.id}">

			<button
				name="action"
				value="delete">

				Xóa

			</button>

		</form>

	</td>

</tr>

</c:forEach>

</table>

</body>
</html>