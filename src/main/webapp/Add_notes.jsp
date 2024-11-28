<%@page import="com.entities.TODO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todo : Add</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">


		<%@include file="navbar.jsp"%>
		<br>
		<h1>Please fill your note detail :-</h1>

		<!-- This is add form form bootstrap -->

		<form action="saveNoteServlet" method="post">

			<div class="form-group">
				<label for="days"> Target Days</label> <input required="required"
					id="days" type="number" name="days" placeholder="Enter Days"
					class="form-control"></input>


			</div>
			<div class="form-group">
				<label for="title">Note Title</label> <input required="required"
					name="title" type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter title">
			</div>
			<div class="form-group">
				<label for="content"> Note Content</label>
				<textarea required="required" id=content name="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px"></textarea>


			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>

			</div>


		</form>


	</div>

</body>
</html>