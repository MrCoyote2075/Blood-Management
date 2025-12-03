package com.blood.step2;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SearchinginJAVA extends HttpServlet {
	
	private int cityid;
	private String cityname;
	private String Apos;
	private String Aneg;
	private String Bpos;
	private String Bneg;
	private String ABpos;
	private String ABneg;
	private String Opos;
	private String Oneg;
	private String bloodbankname;
	private String bloodbankID;
	public SearchinginJAVA() {
		super();
	}
	public SearchinginJAVA(int cityid, String cityname, String bloodbankname, String bloodbankID, 
            String Apos, String Aneg, String Bpos, String Bneg, 
            String ABpos, String ABneg, String Opos, String Oneg) {
this.cityid = cityid;
this.cityname = cityname;
this.bloodbankname = bloodbankname;
this.bloodbankID = bloodbankID;
this.Apos = Apos;
this.Aneg = Aneg;
this.Bpos = Bpos;
this.Bneg = Bneg;
this.ABpos = ABpos;
this.ABneg = ABneg;
this.Opos = Opos;
this.Oneg = Oneg;
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		 int cityid = Integer.parseInt(request.getParameter("location"));
	        String cityname = request.getParameter("locationname");
	        String bloodbankname = request.getParameter("bloodbankname");
	        String bloodbankID = request.getParameter("bloodbankID");
	        String Apos = request.getParameter("A+");
	        String Aneg = request.getParameter("A-");
	        String Bpos = request.getParameter("B+");
	        String Bneg = request.getParameter("B-");
	        String ABpos = request.getParameter("AN+");
	        String ABneg = request.getParameter("AB-");
	        String Opos = request.getParameter("O+");
	        String Oneg = request.getParameter("O-");
		 SearchinginJAVA[] city = new SearchinginJAVA[5];
		 
		 
		 
		
		
		
		
		
		
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}
	
	
	
	

}
