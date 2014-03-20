<!DOCTYPE html>
<% 
    String catergory = "";
    if (request.getAttribute("categoryT")!=null){
        catergory = (String)request.getAttribute("categoryT"); 
    } else {
        catergory = request.getParameter("category");
    }
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>MyTicketMachine:- Map Overview</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="bootstrap/css/grayscale.css" rel="stylesheet">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="bootstrap/js/grayscale.js"></script>
        <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
        <style type='text/css'>
            #outerdiv {border: 1px solid blue; width: 99%; height: 99%; position:fixed; text-align:center}
            #map_go {border: 1px solid red; width: 100%; height: 100%; margin:0px auto; display:inline-block}
        </style>
        <script type="text/javascript">
            var categoryJs;
            var from = "";
            function toggle(){
                category = categoryJs;

                var transport = [
                    ['NE1-CC29 HarbourFront',1.265297,103.839486,'NE','bootstrap/img/Transport_HarbourFront.png', 16],
                    ['EW4 Tanah Merah',1.327358,103.946344,'EW','bootstrap/img/Tranport_Tanah Merah.png',20],
                    ['CG2 Changi Airport',1.357372,103.988836,'CG','bootstrap/img/Transport_Changi Airport.png',47],
                    ['NS27-CE2 Marina Bay',1.276097,103.854675,'NS','bootstrap/img/Transport_Marina Bay.png', 72]
                ];

                var hospital =[
                    ['NE7 Little India', 1.306725, 103.849175,'NE','bootstrap/img/Hospital_Little India.png', 11],
                    ['NE3 Outram Park',1.280225,103.839486,'NE','bootstrap/img/Hospital_Outram Park.png',15],
                    ['EW3 Simei',1.343444,103.953172,'EW','bootstrap/img/Hospital_Simei.png',19],
                    ['EW12 Bugis',1.300194,103.85615,'EW','bootstrap/img/Rock Red.png',28],
                    ['EW19 Queentown',1.294442,103.806114,'EW','bootstrap/img/Hospital_Yishun.png',35],
                    ['CC24 Kent Ridge',1.293383,103.784394,'CC','bootstrap/img/Hospital_Kent Ridge.png', 98],
                    ['NS13 Yishun',1.429464,103.835239,'NS','bootstrap/img/Expo Red.png',58],
                    ['NS20 Novena',1.320394,103.843689,'NS','bootstrap/img/Hospital_Novena.png',65],
                    ['NS22 Orchard',1.304314,103.831939,'NS','bootstrap/img/Expo Red.png',67]
                ];

                var education =[
                    ['EW2 Tampine',1.352528,103.945322,'EW','bootstrap/img/Education_Tampines.png', 18],
                    ['CC24 Kent Ridge',1.293383,103.784394,'CC','bootstrap/img/Education_Kent Ridge.png', 98],
                    ['EW22 Dover',1.311314,103.778658,'EW','bootstrap/img/Education_Dover.png', 38],
                    ['EW23 Clementi',1.315303,103.765244,'EW','bootstrap/img/Education_Clementi.png', 39],
                    ['EW28 Pioneer',1.337578,103.697217,'EW','bootstrap/img/Education_Boon Lay.png', 44],
                    ['NS9 Woodlands',1.437094,103.786483,'NS','bootstrap/img/Education_Woodlands.png', 55],
                    ['NS16 Ang Mo Kio',1.370017,103.84945, 'NS','bootstrap/img/Education_Ang Mo Kio.png', 61],
                    ['CC2 Bras Basah',1.296931,103.850631, 'CC','bootstrap/img/Education_Bras Basah.png', 76]
                ];

                var shopping = [
                    ['NE16 Sengkang', 1.391653, 103.895133,'NE','bootstrap/img/Expo Red.png', 2],
                    ['NE12-CC13 Serangoon', 1.349944, 103.873092,'NE','bootstrap/img/Expo Red.png', 6],
                    ['NE8 Farrer Park', 1.312314, 103.854028,'NE','bootstrap/img/Expo Red.png',10],
                    ['NS24-NE6-CC1 Dohby Ghaut', 1.299156, 103.845736,'NE','bootstrap/img/Expo Red.png',12],
                    ['NE5 Clarke Quay', 1.288708, 103.846606, 'NE','bootstrap/img/Expo Red.png',13],
                    ['NE1-CC29 HarbourFront', 1.265297, 103.839486,'NE','bootstrap/img/Expo Red.png', 16],
                    ['EW5 Bedok',1.324039,103.930036, 'EW','bootstrap/img/Expo Red.png',21],
                    ['EW12 Bugis',1.300194,103.85615,'EW','bootstrap/img/Shopping_Bugis.png', 28],
                    ['EW13-NS25 City Hall',1.293239,103.852219,'EW','bootstrap/img/Expo Red.png', 29],
                    ['EW21-CC20 Buona Vista',1.306817,103.790428,'EW','bootstrap/img/Expo Red.png', 37],
                    ['NS1-EW24 Jurong East',1.333415,103.742119,'EW','bootstrap/img/Shopping_Jurong East.png', 40],
                    ['NS4 Choa Chu Kang',1.385092,103.744322,'NS','bootstrap/img/Expo Red.png', 51],
                    ['NS11 Sembawang ',1.449025,103.820153, 'NS','bootstrap/img/Shopping_Sembawang.png', 57],
                    ['NS17-CC15 Bishan',1.351236,103.848456, 'NS','bootstrap/img/Expo Red.png', 62],
                    ['NS20 Novena',1.320394,103.843689, 'NS','bootstrap/img/Expo Red.png', 65],
                    ['NS22 Orchard',1.304314,103.831939, 'NS','bootstrap/img/Expo Red.png', 67],
                    ['NS23 Somerset',1.300514,103.839028, 'NS','bootstrap/img/Expo Red.png', 68]
                ];

                var garden =[
                    ['EW1 Pasir Ris',1.372411,103.949369,'EW','bootstrap/img/Expo Red.png',17],
                    ['EW25 Chinese Garden',1.342711,103.732467,'EW','bootstrap/img/Garden_Chinese Garden.png', 41],
                    ['EW27 Boon Lay',1.338883,103.706208,'EW','Garden_Boon Lay.png', 43],
                    ['NS2 Bukit Batok',1.349073,103.749664, 'NS','bootstrap/img/Garden_Bukit Batok.png', 49],
                    ['NS7 Kranji',1.425047,103.761853, 'NS','bootstrap/img/Garden_Kranji.png', 53],
                    ['NS14 Khatib',1.417167,103.8329, 'NS','bootstrap/img/Expo Red.png', 59],
                    ['NS16 Ang Mo Kio',1.370017,103.84945, 'NS','bootstrap/img/Garden_Ang Mo Kio.png', 61],
                    ['NS24-NE6-CC1 Dohby Ghaut',1.299156,103.845736, 'NS','bootstrap/img/Garden_Dhoby Ghaut.png', 69],
                    ['CC16 Marymount',1.349078,103.839492, 'CC','bootstrap/img/Garden_Marymount.png', 90],
                    ['CC19 Botanic Gardens ',1.322519,103.815406, 'CC','bootstrap/img/Garden_Botanic Gardens.png', 93],
                    ['CC27 Labrador Park',1.272267,103.802908,'CC','bootstrap/img/Expo Red.png', 101],
                    ['NE1-CC29 HarbourFront',1.265297,103.82225,'CC','bootstrap/img/Expo Red.png', 103]
                ];

                var heritage = [
                    ['NE7 Little India', 1.306725, 103.849175, 'NE','bootstrap/img/Hertiage_Little India.png',11],
                    ['NE5 Clarke Quay', 1.288708, 103.846606, 'NE','bootstrap/img/Expo Red.png',13],
                    ['NE4 Chinatown', 1.280225, 103.844006, 'NE','bootstrap/img/Hertiage_Chinatown.png',14],
                    ['EW11 Lavender',1.307167,103.863008,'EW','bootstrap/img/Hertiage_Lavender.png', 27],
                    ['EW13-NS25 City Hall',1.293239,103.852219,'EW','bootstrap/img/Heritage_CityHall.png', 29],
                    ['EW28 Pioneer',1.337578,103.697217,'EW','bootstrap/img/Expo Red.png', 44],
                    ['NS20 Novena',1.320394,103.843689, 'NS','bootstrap/img/Expo Red.png', 65],
                    ['NS24-NE6-CC1 Dohby Ghaut',1.299156,103.845736, 'NS','bootstrap/img/Expo Red.png', 69],
                    ['CE1 Bayfront',1.282347,103.859317, 'CE','bootstrap/img/Expo Red.png', 73],
                    ['CC2 Bras Basah',1.296931,103.850631, 'CC','bootstrap/img/Hertiage_Bras Basah.png', 76],
                    ['CC26 Pasir Panjang',1.276167,103.791358, 'CC','bootstrap/img/Expo Red.png', 100]
                ];

                var landmark = [
                    ['EW14-NS26 Raffles Place',1.293239,103.852219,'EW','bootstrap/img/LandMark_RafflesPlace.png', 29],
                    ['CG1 Expo',1.335469,103.961767, 'CG','bootstrap/img/MICE_Expo.png', 46],
                    ['NS27-CE2 Marina Bay',1.276097,103.854675,'NS','bootstrap/img/Landmark_Marina Bay.png', 72]
                ];

                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 12,
                    center: new google.maps.LatLng(1.3574978,103.8143458),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });

                var infowindow = new google.maps.InfoWindow();
                var marker, i;

                if (category == "Hospitals") {
                    for (i = 0; i < hospital.length; i++) {
                        var image = new google.maps.MarkerImage(
                            hospital[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(hospital[i][1], hospital[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = hospital[i][0];
                                var infoContent=hospital[i][0]+"<hr><img src='"+hospital[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                } else if (category == "Transportation") {
                    for (i = 0; i < transport.length; i++) {
                        var image = new google.maps.MarkerImage(
                            transport[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(transport[i][1], transport[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = transport[i][0];
                                var infoContent=transport[i][0]+"<hr><img src='"+transport[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                } else if (category == "Institutions") {
                    for (i = 0; i < education.length; i++) {
                        var image = new google.maps.MarkerImage(
                            education[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(education[i][1], education[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = education[i][0];
                                var infoContent=education[i][0]+"<hr><img src='"+education[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                } else if (category == "Shopping") {
                    for (i = 0; i < shopping.length; i++) {
                        var image = new google.maps.MarkerImage(
                            shopping[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(shopping[i][1], shopping[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = shopping[i][0];
                                var infoContent=shopping[i][0]+"<hr><img src='"+shopping[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                } else if (category == "Gardens") {
                    for (i = 0; i < garden.length; i++) {
                        var image = new google.maps.MarkerImage(
                            garden[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(garden[i][1], garden[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = garden[i][0];
                                var infoContent=garden[i][0]+"<hr><img src='"+garden[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                } else if (category == "Heritage Sites") {
                    for (i = 0; i < heritage.length; i++) {
                        var image = new google.maps.MarkerImage(
                            heritage[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(heritage[i][1], heritage[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = heritage[i][0];
                                var infoContent=heritage[i][0]+"<hr><img src='"+heritage[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                } else if (category == "Landmarks") {
                    for (i = 0; i < landmark.length; i++) {
                        var image = new google.maps.MarkerImage(
                            landmark[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(landmark[i][1], landmark[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = landmark[i][0];
                                var infoContent=landmark[i][0]+"<hr><img src='"+landmark[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                }

                var image = new google.maps.MarkerImage(
                    'bootstrap/img/Expo Red.png', 
                    null,
                    null,
                    null,
                    new google.maps.Size(40,40)
                );

                marker = new google.maps.Marker({ 
                    map: map,
                    position: new google.maps.LatLng(1.296931,103.850631),
                    icon: image
                });

                var infoContent2="'You're currently at CC2 Bras Basah'"+"<hr><img src='bootstrap/img/Expo Red.png' width='100px' height='100px'>";

                var infowindow2 = new google.maps.InfoWindow();
                infowindow2.setContent(infoContent2);
                infowindow2.open(map, marker);
            }

            google.maps.event.addDomListener(map, 'load', function() {
                toggle();
            });

            google.maps.event.addDomListener(window, 'resize', function() {
                var currCenter = map.getCenter();
                google.maps.event.trigger(map, 'resize');
                map.setCenter(currCenter);
            });

            function toggle_button(button){
                category = "";

                switch(button) {
                    case 2:
                        category = "Hospitals";
                        break;
                    case 3:
                        category = "Transportation";
                        break;
                    case 4:
                        category = "Institutions";
                        break;
                    case 5:
                        category = "Shopping";
                        break;
                    case 6:
                        category = "Gardens";
                        break;
                    case 7:
                        category = "Heritage Sites";
                        break;
                    case 8:
                        category = "Landmarks";
                        break;
                }

                var transport = [
                    ['NE1-CC29 HarbourFront',1.265297,103.839486,'NE','bootstrap/img/Transport_HarbourFront.png', 16],
                    ['EW4 Tanah Merah',1.327358,103.946344,'EW','bootstrap/img/Tranport_Tanah Merah.png',20],
                    ['CG2 Changi Airport',1.357372,103.988836,'CG','bootstrap/img/Transport_Changi Airport.png',47],
                    ['NS27-CE2 Marina Bay',1.276097,103.854675,'NS','bootstrap/img/Transport_Marina Bay.png', 72]
                ];

                var hospital =[
                    ['NE7 Little India', 1.306725, 103.849175,'NE','bootstrap/img/Hospital_Little India.png', 11],
                    ['NE3 Outram Park',1.280225,103.839486,'NE','bootstrap/img/Hospital_Outram Park.png',15],
                    ['EW3 Simei',1.343444,103.953172,'EW','bootstrap/img/Hospital_Simei.png',19],
                    ['EW12 Bugis',1.300194,103.85615,'EW','bootstrap/img/Rock Red.png',28],
                    ['EW19 Queenstown',1.294442,103.806114,'EW','bootstrap/img/Hospital_Yishun.png',35],
                    ['CC24 Kent Ridge',1.293383,103.784394,'CC','bootstrap/img/Hospital_Kent Ridge.png', 98],
                    ['NS13 Yishun',1.429464,103.835239,'NS','bootstrap/img/Expo Red.png',58],
                    ['NS20 Novena',1.320394,103.843689,'NS','bootstrap/img/Hospital_Novena.png',65],
                    ['NS22 Orchard',1.304314,103.831939,'NS','bootstrap/img/Expo Red.png',67]
                ];

                var education =[
                    ['EW2 Tampines',1.352528,103.945322,'EW','bootstrap/img/Education_Tampines.png', 18],
                    ['CC24 Kent Ridge',1.293383,103.784394,'CC','bootstrap/img/Education_Kent Ridge.png', 98],
                    ['EW22 Dover',1.311314,103.778658,'EW','bootstrap/img/Education_Dover.png', 38],
                    ['EW23 Clementi',1.315303,103.765244,'EW','bootstrap/img/Education_Clementi.png', 39],
                    ['EW28 Pioneer',1.337578,103.697217,'EW','bootstrap/img/Education_Boon Lay.png', 44],
                    ['NS9 Woodlands',1.437094,103.786483,'NS','bootstrap/img/Education_Woodlands.png', 55],
                    ['NS16 Ang Mo Kio',1.370017,103.84945, 'NS','bootstrap/img/Education_Ang Mo Kio.png', 61],
                    ['CC2 Bras Basah',1.296931,103.850631, 'CC','bootstrap/img/Education_Bras Basah.png', 76]
                ];

                var shopping = [
                    ['NE16 Sengkang', 1.391653, 103.895133,'NE','bootstrap/img/Expo Red.png', 2],
                    ['NE12-CC13 Serangoon', 1.349944, 103.873092,'NE','bootstrap/img/Expo Red.png', 6],
                    ['NE8 Farrer Park', 1.312314, 103.854028,'NE','bootstrap/img/Expo Red.png',10],
                    ['NS24-NE6-CC1 Dhoby Ghaut', 1.299156, 103.845736,'NE','bootstrap/img/Expo Red.png',12],
                    ['NE5 Clarke Quay', 1.288708, 103.846606, 'NE','bootstrap/img/Expo Red.png',13],
                    ['NE1-CC29 HarbourFront', 1.265297, 103.839486,'NE','bootstrap/img/Expo Red.png', 16],
                    ['EW5 Bedok',1.324039,103.930036, 'EW','bootstrap/img/Expo Red.png',21],
                    ['EW12 Bugis',1.300194,103.85615,'EW','bootstrap/img/Shopping_Bugis.png', 28],
                    ['EW13-NS25 City Hall',1.293239,103.852219,'EW','bootstrap/img/Expo Red.png', 29],
                    ['EW21-CC20 Buona Vista',1.306817,103.790428,'EW','bootstrap/img/Expo Red.png', 37],
                    ['NS1-EW24 Jurong East',1.333415,103.742119,'EW','bootstrap/img/Shopping_Jurong East.png', 40],
                    ['NS4 Choa Chu Kang',1.385092,103.744322,'NS','bootstrap/img/Expo Red.png', 51],
                    ['NS11 Sembawang ',1.449025,103.820153, 'NS','bootstrap/img/Shopping_Sembawang.png', 57],
                    ['NS17-CC15 Bishan',1.351236,103.848456, 'NS','bootstrap/img/Expo Red.png', 62],
                    ['NS20 Novena',1.320394,103.843689, 'NS','bootstrap/img/Expo Red.png', 65],
                    ['NS22 Orchard',1.304314,103.831939, 'NS','bootstrap/img/Expo Red.png', 67],
                    ['NS23 Somerset',1.300514,103.839028, 'NS','bootstrap/img/Expo Red.png', 68]
                ];

                var garden =[
                    ['EW1 Pasir Ris',1.372411,103.949369,'EW','bootstrap/img/Expo Red.png',17],
                    ['EW25 Chinese Garden',1.342711,103.732467,'EW','bootstrap/img/Garden_Chinese Garden.png', 41],
                    ['EW27 Boon Lay',1.338883,103.706208,'EW','Garden_Boon Lay.png', 43],
                    ['NS2 Bukit Batok',1.349073,103.749664, 'NS','bootstrap/img/Garden_Bukit Batok.png', 49],
                    ['NS7 Kranji',1.425047,103.761853, 'NS','bootstrap/img/Garden_Kranji.png', 53],
                    ['NS14 Khatib',1.417167,103.8329, 'NS','bootstrap/img/Expo Red.png', 59],
                    ['NS16 Ang Mo Kio',1.370017,103.84945, 'NS','bootstrap/img/Garden_Ang Mo Kio.png', 61],
                    ['NS24-NE6-CC1 Dhoby Ghaut',1.299156,103.845736, 'NS','bootstrap/img/Garden_Dhoby Ghaut.png', 69],
                    ['CC16 Marymount',1.349078,103.839492, 'CC','bootstrap/img/Garden_Marymount.png', 90],
                    ['CC19 Botanic Gardens ',1.322519,103.815406, 'CC','bootstrap/img/Garden_Botanic Gardens.png', 93],
                    ['CC27 Labrador Park',1.272267,103.802908,'CC','bootstrap/img/Expo Red.png', 101],
                    ['NE1-CC29 HarbourFront',1.265297,103.82225,'CC','bootstrap/img/Expo Red.png', 103]
                ];

                var heritage = [
                    ['NE7 Little India', 1.306725, 103.849175, 'NE','bootstrap/img/Hertiage_Little India.png',11],
                    ['NE5 Clarke Quay', 1.288708, 103.846606, 'NE','bootstrap/img/Expo Red.png',13],
                    ['NE4 Chinatown', 1.280225, 103.844006, 'NE','bootstrap/img/Hertiage_Chinatown.png',14],
                    ['EW11 Lavender',1.307167,103.863008,'EW','bootstrap/img/Hertiage_Lavender.png', 27],
                    ['EW13-NS25 City Hall',1.293239,103.852219,'EW','bootstrap/img/Heritage_CityHall.png', 29],
                    ['EW28 Pioneer',1.337578,103.697217,'EW','bootstrap/img/Expo Red.png', 44],
                    ['NS20 Novena',1.320394,103.843689, 'NS','bootstrap/img/Expo Red.png', 65],
                    ['NS24-NE6-CC1 Dhoby Ghaut',1.299156,103.845736, 'NS','bootstrap/img/Expo Red.png', 69],
                    ['CE1 Bayfront',1.282347,103.859317, 'CE','bootstrap/img/Expo Red.png', 73],
                    ['CC2 Bras Basah',1.296931,103.850631, 'CC','bootstrap/img/Hertiage_Bras Basah.png', 76],
                    ['CC26 Pasir Panjang',1.276167,103.791358, 'CC','bootstrap/img/Expo Red.png', 100]
                ];

                var landmark = [
                    ['EW14-NS26 Raffles Place',1.293239,103.852219,'EW','bootstrap/img/LandMark_RafflesPlace.png', 29],
                    ['CG1 Expo',1.335469,103.961767, 'CG','bootstrap/img/MICE_Expo.png', 46],
                    ['NS27-CE2 Marina Bay',1.276097,103.854675,'NS','bootstrap/img/Landmark_Marina Bay.png', 72]
                ];

                var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
                center: new google.maps.LatLng(1.3574978,103.8143458),
                mapTypeId: google.maps.MapTypeId.ROADMAP
                });

                var infowindow = new google.maps.InfoWindow();
                var marker, i;

                if (category == "Hospitals") {
                    for (i = 0; i < hospital.length; i++) {
                        var image = new google.maps.MarkerImage(
                            hospital[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(hospital[i][1], hospital[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = hospital[i][0];
                                var infoContent=hospital[i][0]+"<hr><img src='"+hospital[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                } else if (category == "Transportation") {
                    for (i = 0; i < transport.length; i++) {
                        var image = new google.maps.MarkerImage(
                            transport[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(transport[i][1], transport[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = transport[i][0];
                                var infoContent=transport[i][0]+"<hr><img src='"+transport[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                } else if (category == "Institutions") {
                    for (i = 0; i < education.length; i++) {
                        var image = new google.maps.MarkerImage(
                            education[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(education[i][1], education[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = education[i][0];
                                var infoContent=education[i][0]+"<hr><img src='"+education[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                } else if (category == "Shopping") {
                    for (i = 0; i < shopping.length; i++) {
                        var image = new google.maps.MarkerImage(
                            shopping[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(shopping[i][1], shopping[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = shopping[i][0];
                                var infoContent=shopping[i][0]+"<hr><img src='"+shopping[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                } else if (category == "Gardens") {
                    for (i = 0; i < garden.length; i++) {
                        var image = new google.maps.MarkerImage(
                            garden[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(garden[i][1], garden[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = garden[i][0];
                                var infoContent=garden[i][0]+"<hr><img src='"+garden[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                } else if (category == "Heritage Sites") {
                    for (i = 0; i < heritage.length; i++) {
                        var image = new google.maps.MarkerImage(
                            heritage[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(heritage[i][1], heritage[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = heritage[i][0];
                                var infoContent=heritage[i][0]+"<hr><img src='"+heritage[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                } else if (category == "Landmarks") {
                    for (i = 0; i < landmark.length; i++) {
                        var image = new google.maps.MarkerImage(
                            landmark[i][4],
                            null,
                            null,
                            null,
                            new google.maps.Size(40,40)
                        );

                        marker = new google.maps.Marker({ 
                            map: map,
                            position: new google.maps.LatLng(landmark[i][1], landmark[i][2]),
                            icon: image
                        });

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                from = landmark[i][0];
                                var infoContent=landmark[i][0]+"<hr><img src='"+landmark[i][4]+"' width='100px' height='100px'><br>"+
                                "<button onclick='goPayment()'>Payment Details</button>";
                                infowindow.setContent(infoContent);
                                infowindow.open(map, marker);
                            };
                        })(marker, i));
                    }
                }

                var image = new google.maps.MarkerImage(
                    'bootstrap/img/Expo Red.png', 
                    null,
                    null,
                    null,
                    new google.maps.Size(40,40)
                );

                marker = new google.maps.Marker({ 
                    map: map,
                    position: new google.maps.LatLng(1.296931,103.850631),
                    icon: image
                });

                var infoContent2="'You're currently at CC2 Bras Basah'"+"<hr><img src='bootstrap/img/Expo Red.png' width='100px' height='100px'>";

                var infowindow2 = new google.maps.InfoWindow();
                infowindow2.setContent(infoContent2);
                infowindow2.open(map, marker);

            }

            function goPayment() {
            window.location = "paymentDetail.jsp?to="+from+"&category="+category;
            }
        </script>
    </head>
    <body>
        <section class="intro2">
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <table>
                                <tr>
                                    <td>
                                    <img src="bootstrap/img/Hospital_small.png" onclick="toggle_button(2)" />
                                    <img src="bootstrap/img/Transport_small.png" onclick="toggle_button(3)" />
                                    <img src="bootstrap/img/Education_small.png" onclick="toggle_button(4)" />
                                    <img src="bootstrap/img/Shopping_small.png" onclick="toggle_button(5)" />
                                    <img src="bootstrap/img/Garden_small.png" onclick="toggle_button(6)" />
                                    <img src="bootstrap/img/Heritage_small.png" onclick="toggle_button(7)" />
                                    <img src="bootstrap/img/Landmark_small.png" onclick="toggle_button(8)" />
                                    </td>
                                    <td>
                                    <div id="map" style="width: 1050px; height: 550px;"></div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            categoryJs = '<%=catergory%>';
            toggle();
        </script>
    </body>
</html>