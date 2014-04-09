<%@ page import="java.util.*,myticketmachine.dao.*,myticketmachine.servlet.*,java.text.*"%>
<%@include file="db.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>MyTicketMachine:- Payment Details</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href="css/grayscale.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <style>
          .ui-autocomplete {
            max-height: 200px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
          }
          /* IE 6 doesn't support max-height
           * we use height instead, but this forces the menu to always be this tall
           */
          * html .ui-autocomplete {
            height: 200px;
          }
        </style>
        <script>
        window.onload = function(){
            category = categoryJs;
            if (category == "purchaseNotification"){
                $("#myModalLabel").text("Notification");
                $('.modal-body').html("Ticket Purchased");
                $("#modal-container123").modal('show');
            }
        };
        
        $(function() {
          var availableTags = [
            "NE17 Punggol",
            "NE16 Sengkang",
            "NE15 Buangkok",
            "NE14 Hougang",
            "NE13 Kovan",
            "NE12-CC13 Serangoon",
            "NE11 Woodleigh",
            "NE10 Potong Pasir",
            "NE9 Boon Keng",
            "NE8 Farrer Park",
            "NE7 Little India",
            "NS24-NE6-CC1 Dhoby Ghaut",
            "NE5 Clarke Quay",
            "NE4 Chinatown",
            "EW21-NE3 Outram Park",
            "NE1-CC29 HarbourFront",
            "EW1 Pasir Ris",
            "EW2 Tampines",
            "EW3 Simei",
            "EW4 Tanah Merah",
            "EW5 Bedok",
            "EW6 Kembangan",
            "EW7 Eunos",
            "EW8-CC9 Paya Lebar",
            "EW9 Aljunied",
            "EW10 Kallang",
            "EW11 Lavender",
            "EW12 Bugis",
            "EW13-NS25 City Hall",
            "EW14-NS26 Raffles Place",
            "EW15 Tanjong Pagar",
            "EW17 Tiong Bahru",
            "EW18 Redhill",
            "EW19 Queenstown",
            "EW20 Commonwealth",
            "EW21-CC22 Buona Vista",
            "EW22 Dover",
            "EW23 Clementi",
            "NS1-EW24 Jurong East",
            "EW25 Chinese Garden",
            "EW26 Lakeside",
            "EW27 Boon Lay",
            "EW28 Pioneer",
            "EW29 Joo Koon",
            "CG1 Expo",
            "CG2 Changi Airport",
            "NS2 Bukit Batok",
            "NS3 Bukit Gombak",
            "NS4 Choa Chu Kang",
            "NS5 Yew Tee",
            "NS7 Kranji",
            "NS8 Marsiling",
            "NS9 Woodlands",
            "NS10 Admiralty",
            "NS11 Sembawang",
            "NS13 Yishun",
            "NS14 Khatib",
            "NS15 Yio Chu Kang",
            "NS16 Ang Mo Kio",
            "NS17-CC15 Bishan",
            "NS18 Braddell",
            "NS19 Toa Payoh",
            "NS20 Novena",
            "NS21 Newton",
            "NS22 Orchard",
            "NS23 Somerset",
            "NS27-CE2 Marina Bay",
            "CE1 Bayfront",
            "CC2 Bras Basah",
            "CC3 Esplanade",
            "CC4 Promenade",
            "CC5 Nicoll Highway",
            "CC6 Stadium",
            "CC7 Mountbatten",
            "CC8 Dakota",
            "CC10 MacPherson",
            "CC11 Tai Seng",
            "CC12 Bartley",
            "CC14 Lorong Chuan",
            "CC16 Marymount",
            "CC17 Caldecott",
            "CC19 Botanic Gardens",
            "CC20 Farrer Road",
            "CC21 Holland Village",
            "CC23 One-North",
            "CC24 Kent Ridge",
            "CC25 Haw Par Villa",
            "CC26 Pasir Panjang",
            "CC27 Labrador Park",
            "CC28 Telok Blangah",
            "Thian Hock Keng Temple"
        ];

        $( "#tags" ).autocomplete({
            source: availableTags,
            change: function (event, ui) { 
                var from = document.getElementById('tags2').value;
                var to = document.getElementById('tags').value;
                
                switch(to) {
                    case "Thian Hock Keng Temple":
                        document.getElementById('tags').value = "NE4 Chinatown (Thian Hock Keng Temple)";
                        document.getElementById('tags3').value = "NE4 Chinatown";
                        to = "NE4 Chinatown";
                        break;
                }

                $.ajax({
                    type:"post",
                    url:"search.jsp",
                    data:"search="+ from +"&search2="+to,
                    cache:false,
                    success:function(html)
                    {
                        $("#suggestion_box").html(html);
                    }
                });
                
                document.getElementById('tags3').value = to;
            }
        });

        $( "#tags2" ).autocomplete({
            source: availableTags,
            change: function (event, ui){
                var from = document.getElementById('tags2').value;
                var to = document.getElementById('tags').value;

                $.ajax({
                    type:"post",
                    url:"search.jsp",
                    data:"search="+ from +"&search2="+to,
                    cache:false,
                    success:function(html)
                    {
                        $("#suggestion_box").html(html);
                    }
                });
            }
            });
        });
        </script>
    </head>
    <body>
    <%
        String to = "";
        String pNotification = "";
        String testing = "";
        TicketMachineServlet tms = new TicketMachineServlet();
        ArrayList<String> fromlist = new ArrayList<String>();
        String errorMsg = (String)request.getAttribute("errorMsg");
        
        if (request.getAttribute("purchaseNotification") != null || request.getAttribute("to") != null){
            to = (String)request.getAttribute("to");
            pNotification = (String)request.getAttribute("purchaseNotification");
        } 
        
        fromlist= tms.retrieveFrom();
        String from = "CC2 Bras Basah";
        String pageCategory = "FFPD";
    %>
        <section class="intro">
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1>Payment Details</h1>
                            <div class="col-md-8 col-md-offset-2">
                                <% if(errorMsg != null && !errorMsg.isEmpty()){ %>
                                <p align="center"><font color="red"><%=errorMsg%></font></p>
                                <%}%>
                                <form name="paymentDetails" method="post" action="TicketMachineServlet">
                                    <input type ="hidden" value="<%=pageCategory%>" id="ptCategory" name="ptCategory"/>
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>From:</td>
                                                <td><input type="text" id="tags2" name="fromPD" class="form-control" value="<%=from%>" /></td>
                                            </tr>
                                            <tr>
                                                <td>To:</td>
                                                <td><input type="text" id="tags" name="stringPD" class="form-control" value="<%=to%>"/>
                                                    <input type="hidden" id="tags3" name="toPD" class="form-control"/>
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
                                                    <a href="travelTheme.jsp" role="button" class="btn btn-danger">Back</a>
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
        <div class="modal fade" id="modal-container123" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
        <script>
            categoryJs = '<%=pNotification%>';
        </script>
    </body>
</html>

