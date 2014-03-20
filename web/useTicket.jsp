<%@ page import="java.util.*,myticketmachine.dao.*,myticketmachine.servlet.*,java.text.*"%>
<%@include file="db.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>MyTicketMachine:- Use Ticket</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href="bootstrap/css/grayscale.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="bootstrap/js/grayscale.js"></script>
        <script>
        var timer;
        var timer2;
        function refundTimer() {
            clearTimeout(timer);
            timer2 = window.setTimeout(function(){
                    showRefundContent();
            },5000); 
        }

        function successTimer() {
            timer = window.setTimeout(function(){
                showSuccessContent();
            },30000); 
        }

        function showRefundContent(){
            var id = document.getElementById('ptID').value;
            var cost = document.getElementById('ptRefund').value;
            var to = document.getElementById('ptTo').value;
            var cto = document.getElementById('ptCto').value;

            if (cost == "0.00"){
                $("#myModalLabel").text("Notification");
                $('.modal-body').html("You have alighted at "+to+" instead "+cto+".");
            } else {
                $.ajax({
                    type:"post",
                    url:"simulation.jsp",
                    data:"search="+ id +"&search2="+cost+"&search3="+to+"&search4="+cto,
                    cache:false,
                    success:function(html){
                        $("#myModalLabel").text("Notification");
                        $('.modal-body').html(html);
                    }
                });
            }
            
            $("#modal-container-372039").modal('show');
        }

        function showSuccessContent(){
            var id = document.getElementById('ptID').value;
                    
            $.ajax({
                type:"post",
                url:"simulation2.jsp",
                data:"search="+ id,
                cache:false,
                success:function(html){
                    $("#myModalLabel").text("Notification");
                    $('.modal-body').html(html);
                }
            });
            $("#modal-container-3720").modal('show');
        }

        function guideTimer(){
            $("#myModalLabel").text("Notification");
            $('.modal-body').html("You are arriving at Dhoby Ghaut station. This is an interchange. Please alight and board the next train towards Marina Bay on the Red Line.");
            $("#modal-container-3720").modal('show');
        }
        </script>
    </head>
    <%
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            TicketMachineServlet tms = new TicketMachineServlet();
            Transaction t = tms.retrieveLastTransaction();     
    %>
    <body>
        <script>
                successTimer();
        </script>
        <section class="intro">
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1>Use Ticket</h1>
                            <%
                                String from = "CC2 Bras Basah";
                                String to = "";
                                String category = "";
                                
                                if (t!=null && !t.equals("")){
                                    String used = t.getPTUsed();  
                                    if (used.equals("Not Used")){
                                        category = t.getPTCategory();

                                        if (category.equals("FFPD")){
                                            to = "NE4 Chinatown";
                                        } else if (category.equals("PD")){
                                            to = "EW13-NS25 City Hall";
                                        }

                                        String cost = tms.retrieveCost(from, to);
                                        String id = t.getPTId();
                                        String curCost = t.getPTAmount();
                                        String cTo = t.getPTto();

                                        double dcost = Double.parseDouble(cost);
                                        double dCurrCost = Double.parseDouble(curCost);
                                        double dRefund = dCurrCost - dcost;

                                        String refund = String.valueOf(df.format(dRefund));
                            %>
                            <div class="col-md-8 col-md-offset-2">
                                <input type ="hidden" value="<%=id%>" id="ptID" name="ptID"/>
                                <input type ="hidden" value="<%=refund%>" id="ptRefund" name="ptRefund"/>
                                <input type ="hidden" value="<%=to%>" id="ptTo" name="ptTo"/>
                                <input type ="hidden" value="<%=cTo%>" id="ptCto" name="ptCto"/>
                                <img src="bootstrap/img/ezlink.png"/><br/>
                                <button type="button" onclick="refundTimer()" class="btn btn-danger">Simulation for Refund</button>
                                <button type="button" onclick="guideTimer()" class="btn btn-danger">Guide</button>
                            </div>
                            <%      } else { %>
                                <p align="center"> Please purchase a ticket! </p>
                                <p align="center"><a href="index.jsp" class="btn btn-danger">Back</a></p>
                            <%      }
                                  } else {
                            %>
                                <p align="center"> Please purchase a ticket! </p>
                                <p align="center"><a href="index.jsp" class="btn btn-danger">Back</a></p>
                            <%
                                  }
                            %>
                            <div class="modal fade" id="modal-container-372039" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                            <div class="modal fade" id="modal-container-3720" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="myModalLabel" style="color:#808080">Notification</h4>
                                        </div>
                                        <div class="modal-body" style="color:#808080"></div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">OK</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
