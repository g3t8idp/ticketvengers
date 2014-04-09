package myticketmachine.servlet;

import myticketmachine.dao.*;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
/**
 * Servlet implementation class TicketMachineServlet
 */
@WebServlet("/TicketMachineServlet")
public class TicketMachineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Path> pList = new ArrayList<Path>();
	private ArrayList<Transaction> tList = new ArrayList<Transaction>();
	private ArrayList<Transaction> ptList = new ArrayList<Transaction>();
	private ArrayList<Path> pathList = new ArrayList<Path>();
	private ArrayList<String> fromList = new ArrayList<String>();
	private ArrayList<String> toList = new ArrayList<String>();
    /**
     * Default constructor. 
     */
    public TicketMachineServlet() {
        // TODO Auto-generated constructor stub
    }

    public String retrieveCost(String from, String to) throws ClassNotFoundException {        
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;
        String t = "";
        String sql = "";
        
        try {
            con = ConnectionManager.getConnection();
            // Statements allow to issue SQL queries to the database
            sql = "SELECT spCost FROM shortestPath WHERE spFrom = ? and spTo = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, from);
            stmt.setString(2, to);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
            	t = rs.getString("spCost");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                try {
                   stmt.close();
                } catch (SQLException ex) {
                }
            }
            if (con != null) {
                try {
                   con.close();                    
                } catch (SQLException ex) {
                }
            }
        }
        return t;
    }    
    
    public Transaction retrieveLastTransaction() throws ClassNotFoundException {        
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;
        Transaction t = null;
        String sql = "";
        
        try {
        	con = ConnectionManager.getConnection();
            // Statements allow to issue SQL queries to the database
            sql = "SELECT * FROM pTransaction ORDER BY ptID DESC LIMIT 1 ";
            stmt = con.prepareStatement(sql);

            rs = stmt.executeQuery();
            
            while (rs.next()) {
            	String ptID = rs.getString("ptID");
            	String ptDescription = rs.getString("ptDescription");
            	String ptFrom = rs.getString("ptFrom");
            	String ptTo = rs.getString("ptTo");
            	String ptAmount = rs.getString("ptAmount");
            	String ptRemarks = rs.getString("ptRemarks");
            	String status = rs.getString("status");
                String ptCategory = rs.getString("ptCategory");
                String ptUsed = rs.getString("ptUsed");
            	String uID = rs.getString("userID");
            	
            	t = new Transaction(ptID, ptDescription, ptFrom, ptTo, ptAmount, ptRemarks, status, ptCategory, ptUsed, uID);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                try {
                   stmt.close();
                } catch (SQLException ex) {
                }
            }
            if (con != null) {
                try {
                   con.close();                    
                } catch (SQLException ex) {
                }
            }
        }
        return t;
    }    
    
    public ArrayList<Path> retrieveAllPaths() throws ClassNotFoundException  {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;
        Path p = null;
        String sql = "";
        
        try {
        	con = ConnectionManager.getConnection();
            // Statements allow to issue SQL queries to the database
            sql = "SELECT * FROM shortestPath";
            stmt = con.prepareStatement(sql);

            rs = stmt.executeQuery();
            
            while (rs.next()) {
            	String spID = rs.getString("spID");
            	String spFrom = rs.getString("spFrom");
            	String spTo = rs.getString("spTo");
            	String spCost = rs.getString("spCost");
            	String spExchange = rs.getString("spExchange");
            	
            	p = new Path(spID,spFrom,spTo,spCost,spExchange);
            	pathList.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                try {
                   stmt.close();
                } catch (SQLException ex) {
                }
            }
            if (con != null) {
                try {
                   con.close();                    
                } catch (SQLException ex) {
                }
            }
        }
        return pathList;
    }
    
    public ArrayList<String> retrieveFrom() throws ClassNotFoundException  {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;
        Path p = null;
        String sql = "";
        
        try {
        	con = ConnectionManager.getConnection();
            // Statements allow to issue SQL queries to the database
            sql = "SELECT DISTINCT spFrom FROM shortestPath";
            stmt = con.prepareStatement(sql);

            rs = stmt.executeQuery();
            
            while (rs.next()) {
            	String spFrom = rs.getString("spFrom");
            	fromList.add(spFrom);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                try {
                   stmt.close();
                } catch (SQLException ex) {
                }
            }
            if (con != null) {
                try {
                   con.close();                    
                } catch (SQLException ex) {
                }
            }
        }
        return fromList;
    }
    
    public ArrayList<String> retrieveTo() throws ClassNotFoundException  {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;
        Path p = null;
        String sql = "";
        
        try {
        	con = ConnectionManager.getConnection();
            // Statements allow to issue SQL queries to the database
            sql = "SELECT DISTINCT spTo FROM shortestPath";
            stmt = con.prepareStatement(sql);

            rs = stmt.executeQuery();
            
            while (rs.next()) {
            	String spTo = rs.getString("spTo");
            	toList.add(spTo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                try {
                   stmt.close();
                } catch (SQLException ex) {
                }
            }
            if (con != null) {
                try {
                   con.close();                    
                } catch (SQLException ex) {
                }
            }
        }
        return toList;
    }
    
    public void payTransaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException  {
    	String from = request.getParameter("fromPD");
    	String to = request.getParameter("toPD");
        String category = request.getParameter("ptCategory");
        String nextPage = "";
    	String cost = "";
    	String nfc = "009384083";
    	
    	String description = from + " >> "+ to;
    	
        Connection con = null;
        PreparedStatement stmt = null;
        PreparedStatement stmt2 = null;
        String sql = "";
        ResultSet rs = null;
        
        if (from!=null && to!=null && !from.equals("") && !to.equals("")){
            try {
                con = ConnectionManager.getConnection();
                sql = "SELECT spCost from shortestPath where spTo=? AND spFrom=?";
                stmt = con.prepareStatement(sql);
                stmt.setString(1, to);
                stmt.setString(2, from);

                rs = stmt.executeQuery();

                while(rs.next()){
                    cost = rs.getString(1);
                }

                stmt2 = con.prepareStatement("INSERT INTO pTransaction (ptDescription,ptFrom,ptTo,ptAmount,ptRemarks,status,ptCategory,ptUsed,userID) VALUES (?,?,?,?,?,?,?,?,?)");
                stmt2.setString(1, description);
                stmt2.setString(2, from);
                stmt2.setString(3, to);
                stmt2.setString(4, cost);
                stmt2.setString(5, "");
                stmt2.setString(6, "0");
                stmt2.setString(7, category);
                stmt2.setString(8, "Not Used");
                stmt2.setString(9, nfc);
                stmt2.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (stmt != null) {
                    try {
                       stmt.close();
                    } catch (SQLException ex) {
                    }
                }
                if (con != null) {
                    try {
                       con.close();                    
                    } catch (SQLException ex) {
                    }
                }
            }

            Transaction in = new Transaction(description, from, to, cost, "", "0", category, "Not Used", nfc);
            tList.add(in);

            if (category.equals("PD")){
                request.setAttribute("to", to);
                request.setAttribute("purchaseNotification", "purchaseNotification");
                request.setAttribute("categoryT", category);
                nextPage = "paymentDetail.jsp";
            } else {
                request.setAttribute("to", to);
                request.setAttribute("purchaseNotification", "purchaseNotification");
                nextPage = "FFPaymentDetail.jsp";
            }
        } else {
            if (category.equals("PD")){
                request.setAttribute("errorMsg", "Please enter your destination!");
                request.setAttribute("categoryT", category);
                nextPage = "paymentDetail.jsp";
            } else {
                request.setAttribute("errorMsg", "Please enter your destination!");
                nextPage = "FFPaymentDetail.jsp";
            }
        }
        
        RequestDispatcher rd= request.getRequestDispatcher(nextPage);
        rd.forward(request, response);
    }
    
    public ArrayList<Transaction> retrieveTransaction(String userID) throws ClassNotFoundException  {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;
        Transaction tc = null;
        String sql = "";
        
        try {
            con = ConnectionManager.getConnection();
            // Statements allow to issue SQL queries to the database
            sql = "SELECT ptID, ptDescription, ptFrom, ptTo, ptAmount, ptRemarks, status, ptCategory, ptUsed FROM pTransaction WHERE userID = ? ORDER BY ptID DESC";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, userID);

            rs = stmt.executeQuery();
            
            while (rs.next()) {
            	String ptID = rs.getString("ptID");
            	String ptDescription = rs.getString("ptDescription");
            	String ptFrom = rs.getString("ptFrom");
            	String ptTo = rs.getString("ptTo");
            	String ptAmount = rs.getString("ptAmount");
            	String ptRemarks = rs.getString("ptRemarks");
                String ptCategory = rs.getString("ptCategory");
                String ptUsed = rs.getString("ptUsed");
            	String status = rs.getString("status");
            	
            	tc = new Transaction(ptID, ptDescription, ptFrom, ptTo, ptAmount, ptRemarks, status, ptCategory, ptUsed, userID);
            	ptList.add(tc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                try {
                   stmt.close();
                } catch (SQLException ex) {
                }
            }
            if (con != null) {
                try {
                   con.close();                    
                } catch (SQLException ex) {
                }
            }
        }
        return ptList;
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nextPage = "";
		if (request.getParameter("categorySelect") != null) {
            String categoryT = request.getParameter("categorytext");
            
            if (!categoryT.equals("")){
	            if (categoryT.equals("Fast Forward")){
	            	request.setAttribute("categoryT", "FastForward");
	            	nextPage = "FFPaymentDetail.jsp";
	            } else {
	            	request.setAttribute("categoryT", categoryT);
	            	nextPage = "mapOverview.jsp";
	            }
            } else {
            	nextPage = "travelTheme.jsp";
            }

            RequestDispatcher rd= request.getRequestDispatcher(nextPage);
            rd.forward(request, response);
        } else if (request.getParameter("pay") != null) {
        	try {
				payTransaction(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
	}

}
