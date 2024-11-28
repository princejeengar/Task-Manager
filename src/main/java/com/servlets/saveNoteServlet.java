package com.servlets;

import java.io.IOException;

import java.util.Calendar;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.group.Response;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.type.LocalDateType;

import com.entities.*;
import com.helper.FactoryProvider;

import net.bytebuddy.description.annotation.AnnotationDescription.Loadable;

public class saveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public saveNoteServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			/* Here we will fetch the title and content of the given note */

			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int days = Integer.parseInt(request.getParameter("days"));
			LocalDate date = LocalDate.now();
			LocalDate targetdate = date.plusDays(days);
			LocalDate createdAt=LocalDate.now();
			
			

			TODO todo = new TODO(createdAt, targetdate,days, title, content, new Date());
			/* System.out.println(todo.getId()+" "+ todo.getTitle()); */

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			s.save(todo);
			tx.commit();

			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print("<h1 style='text-align:center;'>Note is Added successfully</h1>");
			out.print("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all notes</h1>");

			s.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
