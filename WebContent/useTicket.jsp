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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href="css/grayscale.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="js/grayscale.js"></script>
        <script>
        var timer;
        var timer2;
        function refundTimer() {
            clearTimeout(timer);
            timer2 = window.setTimeout(function(){
                    showRefundContent();
            },1000); 
        }

        function successTimer() {
            timer = window.setTimeout(function(){
                showSuccessContent();
            },1000); 
        }

        function showRefundContent(){
            var id = document.getElementById('ptID').value;
            var cost = document.getElementById('ptRefund').value;
            var to = document.getElementById('ptTo').value;
            var cto = document.getElementById('ptCto').value;
            var checkNeg = cost.substr(0,1);
            var checkZero = cost.substr(0,3);
            
            if (checkNeg == "-"){
                $("#myModalLabel").text("Notification");
                $('.modal-body').html("You have overshot the number of stops. The remaining balance that you need to pay will be deducted from your bank account.");
            } else {
                
                if (checkZero == "0.0"){
                    $("#myModalLabel").text("Notification");
                    $('.modal-body').html("You have alighted at "+to+" instead "+cto+".");
                }else {
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
            }
            $('.modal-footer').html("<button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\" onclick=\"window.location.href=\'pastTransaction.jsp\'\">OK</button>");
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
            
            $('.modal-footer').html("<button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\" onclick=\"window.location.href=\'index.jsp\'\">OK</button>");
            $("#modal-container-372039").modal('show');
        }
        </script>
    </head>
    <%
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            TicketMachineServlet tms = new TicketMachineServlet();
            Transaction t = tms.retrieveLastTransaction();     
    %>
    <body>
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
                                String refund = "";
                                String modalCategory = "";
                                
                                if (t!=null && !t.equals("")){
                                    String used = t.getPTUsed();  
                                    if (used.equals("Not Used")){
                                        category = t.getPTCategory();

                                        if (category.equals("FFPD")){
                                            to = "NE5 Clarke Quay";
                                        } else if (category.equals("PD")){
                                            to = "NE5 Clarke Quay";
                                        }

                                        String cost = tms.retrieveCost(from, to);
                                        String id = t.getPTId();
                                        String curCost = t.getPTAmount();
                                        String cTo = t.getPTto();

                                        double dcost = Double.parseDouble(cost);
                                        double dCurrCost = Double.parseDouble(curCost);
                                        double dRefund = dCurrCost - dcost;
                                        
                                        if (dRefund > 0){
                                            modalCategory = "refund";
                                            refund = String.valueOf(df.format(dRefund));
                                        } else {
                                            refund = String.valueOf(df.format(dRefund));
                                            modalCategory = "normal";
                                        }
                            %>
                            <div class="col-md-8 col-md-offset-2">
                                <input type ="hidden" value="<%=id%>" id="ptID" name="ptID"/>
                                <input type ="hidden" value="<%=refund%>" id="ptRefund" name="ptRefund"/>
                                <input type ="hidden" value="<%=to%>" id="ptTo" name="ptTo"/>
                                <input type ="hidden" value="<%=cTo%>" id="ptCto" name="ptCto"/>
                                <iframe width="420" height="315" src="//www.youtube.com/embed/pYbg1sN_LPM" frameborder="0" allowfullscreen></iframe><br/><br/>
                                <button type="button" onclick="refundTimer()" class="btn btn-danger">Alight Early</button>
                                <button type="button" onclick="successTimer()" class="btn btn-danger">Alight at destination</button>
                            </div>
                                <%   } else { %>
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
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="modal fade" id="modal-container-372039" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel" style="color:#808080"></h4>
                    </div>
                    <div class="modal-body" style="color:#808080"></div>
                    <div class="modal-footer"></div>
                </div>
            </div>
        </div>
    </body>
</html>
