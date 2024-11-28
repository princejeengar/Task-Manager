package com.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.TODO;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int noteid = Integer.parseInt(request.getParameter("noteid").trim());
			int days=Integer.parseInt(request.getParameter("days").trim());
			
			// jab bna tha createdAt -> 05 march + days (change/no change) => targetDate
			
			
			

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			 TODO todo=s.get(TODO.class, noteid);
				/* LocalDate createdAt = todo.getCreatedAt(); */
			 LocalDate current = LocalDate.now();
			 
			 LocalDate targetdate = current.plusDays(days);
			 
			 todo.setTitle(title);
			 todo.setContent(content);
			 todo.setAddedDate(new Date());
			 todo.setDays(days);
			 todo.setTargetdate(targetdate);
			
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
