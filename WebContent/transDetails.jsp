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
        String refund = request.getParameter("search2");

        if(!id.equals("")){
            sql = "UPDATE pTransaction SET status=?, ptRemarks=? WHERE ptID=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "0");
            pst.setString(2, "");
            pst.setString(3, id);

            pst.executeUpdate();
     %>
            <div id="suggestion_bx">You have been refunded $<%=refund%>.</div>
    <%			
        }
    %>
    </body>
</html>