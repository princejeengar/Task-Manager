	<!doctype html>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.TODO"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<html lang="en">
<head>

<%@include file="all_js_css.jsp"%>
<title>TODO : Edit</title>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Edit your note</h1>
		<br>
		<%
		int id = Integer.parseInt(request.getParameter("note_id"));
		Session s = FactoryProvider.getFactory().openSession();
		TODO todo = (TODO) s.get(TODO.class, id);
		 LocalDate targetdate= todo.getTargetdate();
		 LocalDate currentdate=LocalDate.now();
		long differenceindays = ChronoUnit.DAYS.between(currentdate,targetdate);
		
		
		%>
		
		<form action="UpdateServlet" method="post">
		
		<input value="<%=todo.getId()%>" name="noteid" type="hidden"/>
		
		<div class="form-group">
				<label for="days"> Target Days</label>
				<input required="required" id="days" type="number"
				name="days" placeholder="Enter Days"
					class="form-control"
					value=<%=differenceindays %> 
					/>
				<!-- 	target date - current date = days -->
		
			<div class="form-group">
				<label for="title">Note Title</label> <input required="required" 
				name="title"
				type="text"
					class="form-control" id="title" aria-describedby="emailHelp"
					placeholder="Enter title"
					value="<%=todo.getTitle()%>"
					/>
					
			</div>
			<div class="form-group">
				<label for="content"> Note Content</label>
				<textarea required="required" id=content
				name="content" placeholder="Enter your content here"
					class="form-control" style="height: 300px"><%=todo.getContent()%>
					
					</textarea>
					
					
			</div>
			
			<div class="container text-center">
			<button type="submit" class="btn btn-success">Save</button>
			
			</div>

			
		</form>

	</div>

</body>
</html>