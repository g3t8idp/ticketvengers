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
                margin: 5px;
            }
            .brick {
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
            <div class="brick">
                <a onclick="window.location.href='FFPaymentDetail.jsp'" target="_blank"><img src="img/icon/FastForward.png" width="100%"></a>
                <div class="info">
                    <h3>Fast Forward</h3>
                </div>
            </div>
            <div class="brick">
                <a onclick="window.location.href='tileOverview_Garden.jsp'" target="_blank"><img src="img/icon/Garden.png" width="100%" ></a>
                <div class="info">
                    <h3>Gardens</h3>
                </div>
            </div>
            <div class="brick">
                <a onclick="window.location.href='tileOverview_Shopping.jsp'" target="_blank"><img src="img/icon/Shopping.png" width="100%"></a>
                <div class="info">
                    <h3>Shopping</h3>
                </div>
            </div>
            <div class="brick">
                <a onclick="window.location.href='tileOverview_Landmarks.jsp'" target="_blank"><img src="img/icon/Landmarks.png" width="100%"></a>
                <div class="info">
                    <h3>Landmarks</h3>
                </div>
            </div>
            <div class="brick">
                <a onclick="window.location.href='tileOverview_Hospitals.jsp'" target="_blank"><img src="img/icon/Hospital.png" width="100%"></a>
                <div class="info">
                    <h3>Hospitals</h3>
                </div>
            </div>
            <div class="brick">
                <a onclick="window.location.href='tileOverview_Heritage.jsp'" target="_blank"><img src="img/icon/Heritage.png" width="100%"></a>
                <div class="info">
                    <h3>Heritage Site</h3>
                </div>
            </div>
            <div class="brick">
                <a onclick="window.location.href='tileOverview_Transport.jsp'" target="_blank"><img src="img/icon/Transport.png" width="100%"></a>
                <div class="info">
                    <h3>Transportation</h3>
                </div>
            </div>
            <div class="brick">
                <a onclick="window.location.href='tileOverview_Education.jsp'" target="_blank"><img src="img/icon/Education.png" width="100%"></a>
                <div class="info">
                    <h3>Institution</h3>
                </div>
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
