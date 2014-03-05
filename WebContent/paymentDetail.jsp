<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MyTicketMachine:- Payment Detail</title>
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="starter-template.css" rel="stylesheet">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.9.1.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
    });
 
    $( "#opener" ).click(function() {
      $( "#dialog" ).dialog( "open" );
    });
  });
  </script>
  </head>
  <body>
  	<div id="dialog" title="Notification">
  		<p>Ticket Purchase</p>
	</div>
    <div class="container">
      <div class="starter-template">
      <div class="table-responsive">
        <br/>
      	<br/>
      	<br/>
      	<br/>
      	<br/>
      	<br/>
	      <h1 align="center">Payment Details</h1>
	        <br/>
	        <table align="center">
		        <tr class="success">
			        <td>From:</td>
			        <!-- Can retrieve from DB -->
			        <td>
			        	<select>
							  <option value="volvo">Volvo</option>
							  <option value="saab">Saab</option>
							  <option value="mercedes">Mercedes</option>
							  <option value="audi">Audi</option>
						</select>
					</td>
		        </tr>
		   		<tr class="success">
			        <td>To:</td>
			        <!-- Can retrieve from DB -->
			        <td>
			        	<select>
							  <option value="volvo">Volvo</option>
							  <option value="saab">Saab</option>
							  <option value="mercedes">Mercedes</option>
							  <option value="audi">Audi</option>
						</select>
					</td>
		        </tr>
		      	<tr class="success">
			        <td>Cost:</td>
			        <!-- Will be retrieved from DB -->
			        <td>2.00 SGD</td>
		        </tr>
	        </table>
	        <br/>
	        <br/>
	        <table align="center">
	      		<tr class="success">
			        <td><button type="button" class="btn btn-danger"><a href="mapOverview.jsp" style="color: #FFFFFF">Back To Map</a></button></td>
			        <td><button type="button" class="btn btn-danger" id="opener">Pay</button></td>
		        </tr>
	        </table>
	       	<br/>
	        <br/>
	        <table align="center">
	        <tr class="success">
	        <td>Terms & Conditions:<br/>
	        1. Ticket valid for 1 days<br/>
	        2. Non refundable<br/>
	        3. For assistence, please call 87799874<br/>
	        4. WEAPP is not responsible for ABCD<br/>
	        </td>
	        </tr>
	        </table>
        </div>
      </div>
    </div>
  </body>
</html>