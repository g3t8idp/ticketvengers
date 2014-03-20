<%@include file="db.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
     <body>
    <% 
    	String cost="";
    	String sql = ""; 
       	String from = request.getParameter("search");
       	String to = request.getParameter("search2");
     	
     	if(!from.equals("") && !to.equals("")){
            sql = "SELECT spCost from shortestPath where spTo=? AND spFrom=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, to);
            pst.setString(2, from);

            rs = pst.executeQuery();
	      	
	      	while(rs.next()){
       			cost = rs.getString(1);
       			if (!cost.equals("")){
    	 %>
    		<div id="suggestion_bx">Cost: $ <%=cost%></div>
    	<%			
    			} else {
    				cost = "Cost: $ 1.50";
    	%>
    	<div id="suggestion_bx"><%=cost%> </div>
    	<% 			
    			}
			}
		} else {
		%>
   			<div></div>
    	<%	}	%>
     </body>
</html>
