package com.blood.step2;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("//tsep2")
public class Step2 extends HttpServlet{
		
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		int victimid=Integer.parseInt(request.getParameter("victimid"));
		int goinghospital=Integer.parseInt(request.getParameter("goinghospital"));
		out.println("<h2>"+victimid+"</h2>");
		out.println("<h2>"+goinghospital+"</h2>");
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

}
