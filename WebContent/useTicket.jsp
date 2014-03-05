<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MyTicketMachine:- Use Ticket</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
  		<p align="center">You have travelled less than what you paid for. _____ SGD will be refunded.</p>
	</div>
    <div class="container">
      <div class="starter-template">
      	<br/>
      	<br/>
      	<br/>
      	<br/>
      	<br/>
      	<br/>
      	<br/>
      	<br/>
      	<br/>
      	<div class="table-responsive">
	      	<tbody>
	        <h1 align="center">MyTicketMachine</h1>
	        <br/>
		        <p align="center">
		        <img src="img/exlink.png" alt="EZ Link">
		        </p>
		        <p align="center"><button type="button" id="opener">Toggle</button></p>
	        </tbody>
        </div>
      </div>
    </div>
  </body>
</html>