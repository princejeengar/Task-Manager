<%@page import="java.io.PrintWriter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_js_css.jsp"%>
<meta charset="UTF-8">
<title>TODO : All notes</title>
<style>
.image-deadline-combo {
	display: flex;
	justify-content: space-between
}
</style>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class='text-uppercase'>All notes:</h1>

		<div class="row">
			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from TODO");
				List<TODO> list = q.list();
				for (TODO todo : list) {
				%>
				<%
				SimpleDateFormat dateForm = new SimpleDateFormat("dd/MM/YY");
				Date thisdate = todo.getAddedDate();
				/*
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String saveddatestirng = dateFormat.format(thisdate);
				/* 	String savedDateString = "2024-03-02 14:46:25"; */

				/* DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				LocalDateTime saveddatetime = LocalDateTime.parse(saveddatestirng, formatter);
				LocalDate savedate = saveddatetime.toLocalDate();
				LocalDate currentdate = LocalDate.now(); */ 

			
				LocalDate currentdate=LocalDate.now();
				LocalDate savedtardate=todo.getTargetdate();
				long differenceindays = ChronoUnit.DAYS.between(currentdate,savedtardate);
				
			/*     int tday = todo.getDays(); 
				int rday = (int) (tday - differenceindays); */
				
				
				
				%>

				<div class="card mt-3 mb-3">
					<div class="card-img text-right pr-3  mt-3 image-deadline-combo">
						<div>
							<img class="card-img m-4" style="max-width: 100px"
								src="img/4021693.png" alt="Card image cap">
						</div>
						<div style="align-items: 'right';">
							<p class="text-primary">
								<b>Deadline:</b>
							<p class="text-danger">
								<% if (differenceindays >=0) { %>   
								<b><%=differenceindays%> Days left</b>
								<% } else { %>
								<b>Day Limit Exceeded</b>
								<% } %>
							</p>
							</p>
						</div>
					</div>



					<div class="card-body">
						<h5 class="card-title"><%=todo.getTitle()%></h5>
						<p class="card-text"><%=todo.getContent()%></p>

						<h4>Last Edited on</h4>
						<p><%=dateForm.format(thisdate)%></p>

						<div class="container text-center">
							<a href="DeleteServlet?note_id=<%=todo.getId()%>"
								class="btn btn-danger">Delete</a> <a
								<% if (differenceindays >= 0) { %>
								href="edit.jsp?note_id=<%=todo.getId()%>"
								class="btn btn-primary">Edit</a>
								<% } %>
						</div>
					</div>
				</div>

				<%
				}
				%>
			</div>

		</div>



	</div>
</body>
</html>