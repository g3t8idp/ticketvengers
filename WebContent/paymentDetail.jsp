<%@ page import="java.util.*,myticketmachine.dao.*,myticketmachine.servlet.*,java.text.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>MyTicketMachine:- Payment Detail</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href="css/grayscale.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="js/grayscale.js"></script>
        <script type="text/javascript">
            function retrieveCost() {
                var from = document.getElementById('fromPD').value;
                var to = document.getElementById('toPD').value;

                $.ajax(
                {
                    type:"post",
                    url:"search.jsp",
                    data:"search="+ from +"&search2="+to,
                    cache:false,
                    success:function(html){
                        $("#suggestion_box").html(html);
                    }
                });
            }
            
            function pNotification(){
                $("#myModalLabel").text("Notification");
                $('.modal-body').html("Ticket Purchased");
                $("#modal-container").modal('show');
            }
        </script>
    </head>
    <body> 
        <% 
            String catergory = "";
            String to = "";
            String pNotification = "";
            if (request.getAttribute("categoryT") != null){
                catergory = (String)request.getAttribute("categoryT"); 
            } else {
                catergory = request.getParameter("category");
            }
            
            if (request.getAttribute("purchaseNotification") != null || request.getAttribute("to") != null){
                to = (String)request.getAttribute("to");
                pNotification = (String)request.getAttribute("purchaseNotification");
            } else {
                to = request.getParameter("to");
            }

            TicketMachineServlet tms = new TicketMachineServlet();
            ArrayList<String> fromlist = new ArrayList<String>();
            ArrayList<String> tolist = new ArrayList<String>();

            fromlist= tms.retrieveFrom();
            tolist= tms.retrieveTo();
            String from = "CC2 Bras Basah";
            String pageCategory = "PD";
        %>
        <div class="modal fade" id="modal-container" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel" style="color:#808080"></h4>
                    </div>
                    <div class="modal-body" style="color:#808080"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="window.location.href='index.jsp'">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <section class="intro">
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1>Payment Details</h1>
                            <div class="col-md-8 col-md-offset-2">
                                <form name="paymentDetails" method="post" action="TicketMachineServlet">
                                    <input type ="hidden" value="<%=pageCategory%>" id="ptCategory" name="ptCategory"/>
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>From:</td>
                                                <td>
                                                    <select id="fromPD" name="fromPD" class="form-control" onchange="retrieveCost()"> 
                                                    <%
                                                        for(String fl:fromlist){
                                                            if (from.equals(fl)){
                                                    %>
                                                    <option selected="selected"><%=fl%></option>
                                                    <%
                                                            } else {
                                                    %>
                                                    <option><%=fl%></option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>To:</td>
                                                <td>
                                                    <select id="toPD" name="toPD" class="form-control" onchange="retrieveCost()"> 
                                                    <%
                                                        for(String tl:tolist){
                                                            if (to.equals(tl)){
                                                    %>
                                                    <option selected="selected"><%=tl%></option>
                                                    <%
                                                            } else {
                                                    %>
                                                    <option><%=tl%></option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <div id="suggestion_box"></div>       
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    Terms & Conditions:<br/>
                                                    1. Ticket is valid for 1 day<br/>
                                                    2. For assistance, please call 87799874<br/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <% if (catergory.equals("Transport")) {%>
                                                        <a href="tileOverview_Transport.jsp" role="button" class="btn btn-danger">Back to Category Selection</a>
                                                    <% } else if (catergory.equals("Shopping"))  { %>
                                                        <a href="tileOverview_Shopping.jsp" role="button" class="btn btn-danger">Back to Category Selection</a>
                                                    <% } else if (catergory.equals("Hospital"))  { %>
                                                        <a href="tileOverview_Hospitals.jsp" role="button" class="btn btn-danger">Back to Category Selection</a>
                                                    <% } else if (catergory.equals("Gardens"))  { %>
                                                        <a href="tileOverview_Garden.jsp" role="button" class="btn btn-danger">Back to Category Selection</a>
                                                    <% } else if (catergory.equals("Education"))  { %>
                                                        <a href="tileOverview_Education.jsp" role="button" class="btn btn-danger">Back to Category Selection</a>
                                                    <% } else if (catergory.equals("Landmarks"))  { %>
                                                        <a href="tileOverview_Landmarks.jsp" role="button" class="btn btn-danger">Back to Category Selection</a>
                                                    <% } else if (catergory.equals("Heritage"))  { %>
                                                        <a href="tileOverview_Heritage.jsp" role="button" class="btn btn-danger">Back to Category Selection</a>
                                                    <% } %>
                                                    <button type="submit" name="pay" value="pay" class="btn btn-danger">Pay</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>      
        </section>
        <% if (pNotification!=null && !pNotification.equals("")){ %>
            <script>
                pNotification();
            </script>
        <% } %>
        <script>
            retrieveCost();
        </script>
    </body>
</html>