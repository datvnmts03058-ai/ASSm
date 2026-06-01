<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="Model.User"%>
<%
User user = (User) session.getAttribute("user");
%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Music Web</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">

<style>
body {
	margin: 0;
	background: #121212;
	color: white;
	font-family: Arial, sans-serif;
}

/* SIDEBAR */
.sidebar {
	width: 220px;
	background: #181818;
	height: 100vh;
	position: fixed;
	padding: 20px;
	box-sizing: border-box;
}

.sidebar h2 {
	margin-bottom: 20px;
}

.sidebar a {
	display: block;
	padding: 12px;
	margin-top: 10px;
	text-decoration: none;
	color: white;
	border-radius: 8px;
}

.sidebar a:hover {
	background: #282828;
}

/* MAIN */
.main {
	margin-left: 240px;
	padding: 30px;
	padding-bottom: 120px;
}

/* SEARCH */
.search-box {
	display: flex;
	gap: 10px;
	margin-bottom: 25px;
}

.search-box input {
	flex: 1;
	padding: 12px;
	border: none;
	border-radius: 8px;
}

.search-box button {
	padding: 12px 20px;
	border: none;
	border-radius: 8px;
	background: #8e44ad;
	color: white;
	cursor: pointer;
}

.search-box button:hover {
	background: #9b59b6;
}

/* SONG CARD */
.song {
	background: #1e1e1e;
	border-radius: 10px;
	padding: 15px;
	margin-bottom: 15px;
}

.song button {
	background: #1db954;
	border: none;
	color: white;
	padding: 10px 15px;
	border-radius: 8px;
	cursor: pointer;
	margin-top: 10px;
}

.song button:hover {
	background: #1ed760;
}

/* PLAYER */
.player {
	position: fixed;
	bottom: 0;
	left: 220px;
	right: 0;
	background: #181818;
	border-top: 1px solid #333;
	padding: 15px;
	display: flex;
	align-items: center;
	gap: 20px;
}

.player-info {
	min-width: 250px;
}

.player audio {
	flex: 1;
}
</style>

</head>

<body>

	<!-- SIDEBAR -->

	<div class="sidebar">

		<h2>🎵 Music</h2>

		<a href="${pageContext.request.contextPath}/home">
			🏠 Trang chủ
		</a>

		<a href="#">
			❤️ Yêu thích
		</a>

		<a href="#">
			📁 Playlist
		</a>

		<a href="${pageContext.request.contextPath}/logout">
			🚪 Đăng xuất
		</a>

	</div>

	<!-- MAIN -->

	<div class="main">

		<h2>
			Xin chào
			<%=user.getFullname()%>
		</h2>

		<br>

		<!-- SEARCH -->

		<form class="search-box"
			action="${pageContext.request.contextPath}/search"
			method="get">

			<input type="text"
				name="keyword"
				placeholder="Tìm bài hát, ca sĩ hoặc thể loại...">

			<button type="submit">
				🔍 Tìm kiếm
			</button>

		</form>

		<!-- SONG LIST -->

		<c:forEach items="${songs}" var="s">

			<div class="song">

				<h3>🎵 ${s.title}</h3>

				<p>Ca sĩ: ${s.artist}</p>

				<p>Thể loại: ${s.genre}</p>

				<button
					onclick="playSong(
						'${pageContext.request.contextPath}/${s.audioUrl}',
						'${s.title}',
						'${s.artist}'
					)">
					▶ Phát nhạc
				</button>

			</div>

		</c:forEach>

	</div>

	<!-- PLAYER BAR -->

	<div class="player">

		<div class="player-info">

			<strong id="songTitle">
				Chưa chọn bài hát
			</strong>

			<br>

			<small id="songArtist">
			</small>

		</div>

		<audio id="audioPlayer" controls>
		</audio>

	</div>

	<script>

function playSong(url,title,artist){

	const player =
		document.getElementById("audioPlayer");

	player.src = url;

	player.play();

	document.getElementById("songTitle")
		.innerText = title;

	document.getElementById("songArtist")
		.innerText = artist;
}

</script>

</body>
</html>