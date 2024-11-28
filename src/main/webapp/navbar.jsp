<%@page import="net.bytebuddy.description.annotation.AnnotationDescription.Loadable"%>
<%@page import="java.time.LocalDate"%>
<%LocalDate curdate=LocalDate.now();

%>



<nav class="navbar navbar-expand-lg navbar-dark purple">
	<a class="navbar-brand" href="index.jsp">TODO</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="Add_notes.jsp">Add
					Note</a></li>

			<li class="nav-item"><a class="nav-link " href="all_notes.jsp">Show
					Notes</a></li>
		</ul>
		<p style="color: white" ><%=curdate %></p>
		
	</div>
</nav>
