<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*,java.io.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="myticketmachine.dao.*;" %>

<%! 
    Connection con; 
    Statement s; 
    ResultSet rs;
    PreparedStatement pst;
%>
<% 
    try{
            con = ConnectionManager.getConnection();
    s = con.createStatement();
    } catch(Exception e) { 
            e.printStackTrace(); 
    }
%>

