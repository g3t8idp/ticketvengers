<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>MyTicketMachine:- Travel Theme</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href="bootstrap/css/grayscale.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="bootstrap/js/grayscale.js"></script>
        <link rel="stylesheet" href="bootstrap/css/jquery.mobile-1.3.1.min.css" />
        <link rel="stylesheet" href="bootstrap/css/styles.css" type="text/css" />
        <link rel="stylesheet" href="bootstrap/css/wheel.menu-0.1.css" type="text/css" />
        <script type='text/javascript' src='http://code.jquery.com/jquery-1.7.1.js'></script>
        <script type="text/javascript" src="http://jqueryrotate.googlecode.com/svn/trunk/jQueryRotate.js"></script>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <style type='text/css'>
            #image{
                margin:30px 0px;
            }

            .bubble {
                position: relative;
                width: 250px;
                height: 75px;
                padding: 20px;
                text-align: center;
                background: #FFFFFF;
                -webkit-border-radius: 15px;
                -moz-border-radius: 15px;
                border-radius: 15px;
                border: #7F7F7F solid 5px;
                right: 35px;
                top: 55px;
            }

            .bubble:after{
                content: '';
                position: absolute;
                border-style: solid;
                border-width: 8px 0 8px 16px;
                border-color: transparent #FFFFFF;
                display: block;
                width: 0;
                z-index: 1;
                margin-top: -10px;
                right: -15px;
                top: 50%;
            }

            .bubble:before{
                content: '';
                position: absolute;
                border-style: solid;
                border-width: 12px 0 12px 20px;
                border-color: transparent #7F7F7F;
                display: block;
                width: 0;
                z-index: 0;
                margin-top: -14px;
                right: -24px;
                top: 50%;
            }
        </style>
    </head>
    <body>
        <section class="intro2">
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-8 col-md-offset-2">
                                <form name="categorySelection" method="post" action="TicketMachineServlet">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <p class="bubble" id="categoryL">Select Category</p>
                                                    <input type="hidden" id="categorytext" name="categorytext" />
                                                </td>
                                                <td rowspan="3">
                                                    <img src="bootstrap/img/globe.png" id="image" alt="globe"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div id="main_img">
                                                        <img id="img">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <button type="submit" name="categorySelect" value="categorySelect" class="btn btn-danger btn-lg">Ok</button>
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
        <script type='text/javascript'> 
        $(window).load(function(){
            var catD = "";
            var value = 0;
            var globeValue = 0;
                $("#image").rotate({ 
                   bind: { 
                        click: function(){
                            value +=45;
                            globeValue +=45;
                            $(this).rotate({animateTo:value})
                                if (globeValue == 45){
                                    catD = "Fast Forward";
                                    a = "bootstrap/img/FastForward.png";
                                } else if (globeValue == 90){
                                    catD = "Gardens";
                                    a = "bootstrap/img/Garden.png";
                                } else if (globeValue == 135){
                                    catD = "Shopping";
                                    a = "bootstrap/img/Shopping.png";
                                } else if (globeValue == 180){
                                    catD = "Landmarks";
                                    a = "bootstrap/img/Landmarks.png";
                                } else if (globeValue == 225){
                                    catD = "Hospitals";
                                    a = "bootstrap/img/Hospital.png";
                                } else if (globeValue == 270){
                                    catD = "Heritage Sites";
                                    a = "bootstrap/img/Heritage.png";
                                } else if (globeValue == 315){
                                    catD = "Transportation";
                                    a = "bootstrap/img/Transport.png";
                                } else if (globeValue == 360){
                                    catD = "Institutions";
                                    a = "bootstrap/img/Education.png";
                                    globeValue = 0;
                                }
                                
                            document.getElementById('categorytext').value = catD; 
                            document.getElementById('categoryL').innerHTML = catD; 
                            document.getElementById("img").src=a;
                        }
                    } 
                });
            });
        </script>
    </body>
</html>