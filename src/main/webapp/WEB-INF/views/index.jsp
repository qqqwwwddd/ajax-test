<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
.m_right {
	display: flex;
	justify-content: flex-end;
}

.test_box {
	border: 1px solid black;
	padding: 10px;
}

</style>
</head>
<body>

	<div class="container">
		<h1>Ajax 테스트</h1>
		<hr />
		<div class="m_right">
			<div class="dropdown">
				<button type="button" class="btn btn-warning dropdown-toggle"
					data-toggle="dropdown">정렬하기</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#" onClick="getId()">번호순(내림차순)</a> <a
						class="dropdown-item" href="#" onClick="getTitle()">제목순(내림차순)</a>
					<a class="dropdown-item" href="#" onClick="getCreatedAt()">날짜순(내림차순)</a>
				</div>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody id="board-box" >
				<c:forEach var="board" items="#{boards}">
					<tr>
						<td>${board.id}</td>
						<td>${board.title}</td>
						<td>${board.createdAt}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

		<div id="test-box" class="test_box"></div>
	</div>

	<script>
		async function getId(){
			let response = await fetch("http://localhost:8080/board?order=id");
			let parseResponse = await response.json();
			console.log(parseResponse);
			
			$("#board-box").empty();
			for(let board of parseResponse.data){
				$("#board-box").append("<tr>"+"<td>"+board.id+"</td>"
						+"<td>"+ board.title + "</td>"
						+"<td>"+board.createdAt+"</td>"+"</tr>");
			}
		}
		
		async function getTitle(){
			let response = await fetch("http://localhost:8080/board?order=title");
			let parseResponse = await response.json();
			console.log(parseResponse);
			
			$("#board-box").empty();
			for(let board of parseResponse.data){
				$("#board-box").append("<tr>"+"<td>"+board.id+"</td>"
						+"<td>"+ board.title + "</td>"
						+"<td>"+board.createdAt+"</td>"+"</tr>");
			}
		}
		
		async function getCreatedAt(){
			let response = await fetch("http://localhost:8080/board?order=createdAt");
			let parseResponse = await response.json();
			console.log(parseResponse);
			
			$("#board-box").empty();
			for(let board of parseResponse.data){
				$("#board-box").append("<tr>"+"<td>"+board.id+"</td>"
						+"<td>"+ board.title + "</td>"
						+"<td>"+board.createdAt+"</td>"+"</tr>");
			}
		}
	</script>

</body>
</html>
