<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MyTicketMachine:- Map Overview</title>
        <meta content="text/html; charset=utf-8" http-equiv="content-type">
        <meta name="description" content="Freewall demo for pinterest-like layout" />
        <meta name="keywords" content="javascript, dynamic, grid, layout, jquery plugin, pinterest like layouts" />
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/pinterest-style.css" />
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <style type="text/css">
            .free-wall {
                margin: 3px;
            }
            
            .test {
               margin: 3px;
               width: 221.2px;
            }
            
            .info {
                text-align: center;
                padding: 10px;
                color: #333;
            }
            
            .brick img {
                margin: 0px;
                padding: 0px;
                display: block;
            }
        </style>
    </head>
    <body>
        <div id="freewall" class="free-wall">
            <div class="brick size00">
               <a onclick="window.location.href='tileOverview_Hospitals.jsp'" target="_blank"><img src="img/icon/Hospital_small.png"/></a>
               <a onclick="window.location.href='tileOverview_Transport.jsp'" target="_blank"><img src="img/icon/Transport_small.png"/></a>
               <a onclick="window.location.href='tileOverview_Education.jsp'" target="_blank"><img src="img/icon/Education_small.png"/></a>
               <a onclick="window.location.href='tileOverview_Shopping.jsp'" target="_blank"><img src="img/icon/Shopping_small.png"/></a>
               <a onclick="window.location.href='tileOverview_Garden.jsp'" target="_blank"><img src="img/icon/Garden_small.png"/></a>
               <a onclick="window.location.href='tileOverview_Heritage.jsp'" target="_blank"><img src="img/icon/Heritage_small.png"/></a>
               <a onclick="window.location.href='tileOverview_Landmarks.jsp'" target="_blank"><img src="img/icon/Landmarks_small.png"/></a>
            </div>
            <div class="brick test">
                <a onclick="window.location.href='paymentDetail.jsp?to=CC2 Bras Basah&category=Heritage'" target="_blank">
                    <img src="img/Heritage/Heritage_Bras Basah.PNG" width="100%"/>
                </a>
            </div>
            <div class="brick test">
                <a onclick="window.location.href='paymentDetail.jsp?to=NE4 Chinatown&category=Heritage'" target="_blank">
                    <img src="img/Heritage/Heritage_Chinatown.PNG" width="100%"/>
                </a>
            </div>
            <div class="brick test">
                <a onclick="window.location.href='paymentDetail.jsp?to=EW13-NS25 City Hall&category=Heritage'" target="_blank">
                    <img src="img/Heritage/Heritage_City Hall.PNG" width="100%"/>
                </a>
            </div>
            <div class="brick test">
                <a onclick="window.location.href='paymentDetail.jsp?to=NE5 Clarke Quay&category=Heritage'" target="_blank">
                    <img src="img/Heritage/Heritage_Clarke Quay.PNG" width="100%"/>
                </a>
            </div>
            <div class="brick test">
                <a onclick="window.location.href='paymentDetail.jsp?to=EW11 Lavender&category=Heritage'" target="_blank">
                    <img src="img/Heritage/Heritage_Lavendar.PNG" width="100%"/>
                </a>
            </div>
            <div class="brick test">
                <a onclick="window.location.href='paymentDetail.jsp?to=NE7 Little India&category=Heritage'" target="_blank">
                    <img src="img/Heritage/Heritage_Little India.PNG" width="100%"/>
                </a>
            </div>
            <div class="brick test">
                <a onclick="window.location.href='paymentDetail.jsp?to=CC26 Pasir Panjang&category=Heritage'" target="_blank">
                    <img src="img/Heritage/Heritage_Pasir Panjang.PNG" width="100%"/>
                </a>
            </div>
            <div class="brick test">
                <a onclick="window.location.href='paymentDetail.jsp?to=NS19 Toa Payoh&category=Landmarks'" target="_blank">
                    <img src="img/Heritage/Heritage_Toa Payoh.PNG" width="100%"/>
                </a>
            </div>
        </div>
        <script type="text/javascript">
            var wall = new freewall("#freewall");
            wall.reset({
                selector: '.brick',
                animate: true,
                cellW: 200,
                cellH: 'auto',
                onResize: function() {
                    wall.fitWidth();
                    wall.fitHeight();
                }
            });

            var images = wall.container.find('.brick');
            var length = images.length;
            images.css({visibility: 'hidden'});
            images.find('img')
            .error(function() {
                -- length;
            })
            .load(function() {
                -- length;
                if (!length) {
                    setTimeout(function() {
                        images.css({visibility: 'visible'});
                        wall.fitWidth();
                    }, 505);
                }
            });
        </script>
    </body>
</html>