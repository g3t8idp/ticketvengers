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
        String used = "Used";

        if(!id.equals("") && !used.equals("")){
            sql = "UPDATE pTransaction SET ptUsed = ? where ptID=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, used);
            pst.setString(2, id);

            pst.executeUpdate();
     %>
        <div id="suggestion_bx">Exit Successful</div>
    <%			
        }
    %>
    </body>
</html>