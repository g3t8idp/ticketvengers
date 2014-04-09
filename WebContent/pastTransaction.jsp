<%@ page import="java.util.*,myticketmachine.dao.*,myticketmachine.servlet.*,java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>MyTicketMachine:- Past Transaction</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href="css/grayscale.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script>
	    function refundStatus(){
	    	var id = document.getElementById('ptID').value;
	    	var refund = document.getElementById('ptRemarks').value;
                
	    	$.ajax({
                    type:"post",
                    url:"transDetails.jsp",
                    data:"search="+ id + "&search2=" + refund,
	    	    cache:false,
	    	    success:function(html){
	    	    	$("#myModalLabel").text("Notification");
	    	        $('.modal-body').html(html);
	    		}
	    	});
	    	
                $("#modal-container-372039").modal('show');
	    }
        </script>
    </head>
    <body>
<%
		String description = "";
		String cost = "";
		String status = "";
		String remarks = "";
		int tid = 0;
		String nfc = "009384083";
		String id = "";
		
		TicketMachineServlet tms = new TicketMachineServlet();
		
		ArrayList<Transaction> tlist = new ArrayList<Transaction>();
		tlist= tms.retrieveTransaction(nfc);
		DecimalFormat df = new DecimalFormat("#,###,##0.00");
	%>

        <section class="intro">
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-8 col-md-offset-2">
                                <table class="table">
                                    <h1>Past Transactions</h1>
                                    <br/>
                                    <%		
                                    if (tlist!=null && !tlist.isEmpty()){
                                    %>
                                    <thead>
                                        <tr>
                                            <th>Item</th>
                                            <th>Description</th>
                                            <th>Amount</th>
                                            <th>Remarks</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                                for(int i=0; i<tlist.size(); i++) {
                                                    Transaction trans = tlist.get(i);
                                                    id = trans.getPTId();
                                                    description = trans.getPTDescription();
                                                    cost = trans.getPTAmount();
                                                    status = trans.getRefundStatus();
                                                    remarks = trans.getPTRemarks();
                                                    tid += 1;
                                        %>
                                        <tr>
                                            <td><%=tid %></td>
                                            <td><%=description %></td>
                                            <td><%=cost %></td>
                                            <td><%=remarks %></td>
                                            <%
                                                    if (status.equals("1")){
                                            %>

                                            <td>
                                                <input type ="hidden" value="<%=remarks%>" id="ptRemarks" name="ptRemarks<%=id %>" />
                                                <input type ="hidden" value="<%=id%>" id="ptID" name="ptID<%=id %>" />
                                                <button type="button" onclick="refundStatus()" class="btn btn-danger" name="refund<%=id%>" value="<%=id%>">Refund</button>
                                            </td>
                                            <%
                                                    }
                                                }
                                            %>
                                        </tr>
                                    </tbody>
                                </table>
                            <br/>
                            <p align="right"><a href="index.jsp" class="btn btn-danger">Back</a></p>
                            <% } else { %>
                            <p align="center"> No Record Found! </p>
                            <%} %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="modal fade" id="modal-container-372039" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                         <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="window.location.href='index.jsp'">×</button>
                        <h4 class="modal-title" id="myModalLabel" style="color:#808080">Notification</h4>
                    </div>
                    <div class="modal-body" style="color:#808080"></div>
                </div>
            </div>
        </div>
    </body>
</html>
