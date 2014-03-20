<%@include file="db.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
    </head>
    <body>
    <% 
        String sql = ""; 
        String id = request.getParameter("search");
        String refund= request.getParameter("search2");
        String to = request.getParameter("search3");
        String cto = request.getParameter("search4");
        String used = "Used";

        if(!id.equals("") && !refund.equals("")){
            sql = "UPDATE pTransaction SET status = ?, ptRemarks = ?, ptUsed = ? where ptID=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "1");
            pst.setString(2, refund);
            pst.setString(3, used);
            pst.setString(4, id);

            pst.executeUpdate();
     %>
        <div id="suggestion_bx">You have alighted at <%=to%> instead <%=cto%>. Please obtain a refund from the Transactions Page.</div>
    <%			
        }
    %>
    </body>
</html>