<%-- 
    Document   : editRecord
    Created on : Jan 7, 2017, 9:44:42 PM
    Author     : Lungelo
--%>
<%@page import="com.stressmeasurement.service.UserService"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.stressmeasurement.service.StressMeasurementService"%>
<%@page import="com.stressmeasurement.entity.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.autocomplete.js"></script>
        <script src="js/jquery-editable-select.js"></script>
        <link rel="stylesheet" type="text/css" href="css/style.css" /> 
        <link rel="stylesheet" type="text/css" href="css/jquery-editable-select.css" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />


        <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
              rel = "stylesheet">

        <script type="text/javascript">
            function showTd(elem) {
                if (elem.value == "South Africa") {
                    document.getElementById('hide_province').style.display = "table-row";

                } else {
                    document.getElementById('hide_province').style.display = "none";

                }
                element.style.visiblity = 'inherit';
            }
        </script>
        <script type="text/javascript">
            jQuery(function () {

                $("#location").autocomplete("autocomplete/getLocations.jsp");
                $("#method").autocomplete("autocomplete/getMethods.jsp");
                $("#rock").autocomplete("autocomplete/getRocks.jsp");
                $("#seq").autocomplete("autocomplete/getSeqs.jsp");
                $("#reff").autocomplete("autocomplete/getReffs.jsp");
                $("#site").autocomplete("autocomplete/getSites.jsp");
                $("#locality").autocomplete("autocomplete/getLocalities.jsp");
                $("#gg").autocomplete("autocomplete/getGroupGrades.jsp");

            });
        </script>
        <script type="text/javascript">
//            $(document).ready(function () {
//                $('#country').editableSelect({effects: 'default'});
//            });

        </script>
        <!-- Javascript -->
        <script>
            $(function () {
                $("#date").datepicker({
                    dateFormat: 'yy-mm-dd'
                });

            });
        </script>

        <script>
            $(document).ready(function () {
                $('#Calculate').click(function (event) { 
                    event.preventDefault();
                    $.ajax({
                        url: 'CalculateStress',
                        type: 'post',
                        dataType: 'json',
                        data: {
                            sx: $('#sx').val(),
                            sy: $('#sy').val(),
                            sz: $('#sz').val(),
                            sxy: $('#sxy').val(),
                            syz: $('#syz').val(),
                            szx: $('#szx').val()
                        },
                        success: function (responseText) {

                            $('#s1').val(responseText.s1);
                            $('#s2').val(responseText.s2);
                            $('#s3').val(responseText.s3);
                            $('#bs1').val(responseText.bs1);
                            $('#bs2').val(responseText.bs2);
                            $('#bs3').val(responseText.bs3);
                            $('#dips1').val(responseText.dips1);
                            $('#dips2').val(responseText.dips2);
                            $('#dips3').val(responseText.dips3);
                            $('#bsh1').val(responseText.bsh1);
                            $('#sh1').val(responseText.sh1);
                            $('#sh3').val(responseText.sh3);
                            $('#k1').val(responseText.k1);
                            $('#k3').val(responseText.k3);
                            $('#kx').val(responseText.kx);
                            $('#kz').val(responseText.kz);

                        },
                        error: function (responseText) {

                             alert("Something went wrong " + "Please make sure that Normal stress(Syy) in Y (Up) is not equal to zero "+"Then try again ");
                            // Somehow process the validation messages,
                            // like you seem to be doing already.
                        }
                    });
                });
            });</script> 
        <title>New Record</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/main.css" type="text/css" media="all" />
    <style>
         label{
                color: #555555;
                font-weight: bold;
                font-size:12px;
                font:  HelveticaNeue, Verdana, Arial,bold, Helvetica, sans-serif;
                display: block;
                /*                width: 60px;*/

            }
            .label1 {
                color: #B4886B;
                font-weight: bold;
                font-size:13px;
                font:  HelveticaNeue, Verdana, Arial,bold, Helvetica, sans-serif;
                display: block;
                width: 150px;

            }
            .label2 {
                color: #B4886B;
                font-weight: bold;
                font-size:13px;
                font:  HelveticaNeue, Verdana, Arial,bold, Helvetica, sans-serif;
                display: block;
                width: 150px;

            }
            .label3 {
                color: #B4886B;
                font-weight: bold;
                font-size:13px;
                font:  HelveticaNeue, Verdana, Arial,bold, Helvetica, sans-serif;
                display: block;
                width: 150px;

            }
            input, textarea, select{ float: left;
                                     width:150px;
                                     -moz-border-radius: 4px; border-radius: 4px;
                                     border: 1px solid #555555 }
            .button2 { float: left;
                       width:150px;
                       -moz-border-radius: 4px; border-radius: 4px;
                       border: 1px solid #fff }
            .floatedTable {
                float:left;
            }
            .inlineTable {
                display: inline-block;
            }
            .formLegend { 

                background-color: #2e6e9e;
                font-weight: bold;
                font-size:12px;
                color: white; -webkit-border-radius: 4px; 
                -moz-border-radius: 4px; border-radius: 4px;
                box-shadow: 2px 2px 4px #888; 
                -moz-box-shadow: 2px 2px 4px #888;
                -webkit-box-shadow: 2px 2px 4px #888 }
            .dashed_fieldset {
                border: 1px dashed #555555;

            }
            fieldset.inline {
                display: inline;
                margin-right:40px;
                margin-left:40px;
                -webkit-border-radius: 8px; 
                -moz-border-radius: 8px; 
                border-radius:8px;
                box-shadow: 3px 3px 10px #ccc;
                -moz-box-shadow: 3px 3px 10px #ccc; 
                -webkit-box-shadow: 3px 3px 10px #ccc
            }

            fieldset.inline2 {
                -webkit-border-radius: 8px; 
                -moz-border-radius: 8px; 
                border-radius:8px;
                box-shadow: 3px 3px 10px #ccc;
                -moz-box-shadow: 3px 3px 10px #ccc; 
                -webkit-box-shadow: 3px 3px 10px #ccc;

                top: 0px;
                padding-bottom: -75px;

                display: inline-block;/* leave a space to position for the labels */
            }
            .tooltip {

                display: inline;

            }

            .tooltip .tooltiptext {
                visibility: hidden;
                width: 120px;
                background-color: #2e6e9e;
                color: #fff;
                font-weight: bold;
                text-align: center;
                border-radius: 6px;
                padding: 5px 0;

                /* Position the tooltip */
                position: absolute;
                z-index: 1;
            }

            .tooltip:hover .tooltiptext {
                visibility: visible;
            }
            </style>

    </head>
    <body>
        <%
            
            StressMeasurementService stressMeasurementService = new StressMeasurementService();
            UserService userService = new UserService();
            List<String> list = stressMeasurementService.getAllCountries();
            List<StressMeasurement> StressMeasurements = stressMeasurementService.getAllStressMeasurements();
            int new_record_Id = StressMeasurements.size() + 1;
            int new_record_Index = stressMeasurementService.getMaxIndexOfRecord() + 1;
            Integer smId = Integer.parseInt(request.getParameter("smId"));
            String username = request.getParameter("username");
            StressMeasurement stressMeasurement = stressMeasurementService.getStressMeasurementById(smId);
            User user = userService.getUserByUsername(username);
            
            String firstname = user.getFirstname();
            String lastname = user.getLastname();

            request.setAttribute("firstname", firstname);
            request.setAttribute("lastname", lastname);
            request.setAttribute("stressMeasurement", stressMeasurement);
            request.setAttribute("countries", list);
            request.setAttribute("new_record_Id", new_record_Id);
            request.setAttribute("new_record_Index", new_record_Index);

            request.setAttribute("user", user);

      


        %>
             
 <!-- Header -->
        <div id="header">
            <div class="shell">
                <!-- Logo + Top Nav -->
                <div id="top">
                    <h1 id="logo" style="font-family: sans-serif; font-weight:bold ">Stress Measurements Record</h1>

                    <div id="top-navigation"> <a href="#"><strong>${firstname} ${lastname}</strong></a> <span><b>|</b></span> <a href="#">Help</a> <span><b>|</b></span> <a href="#">Profile Settings</a> <span><b>|</b></span> <a href="logout.jsp">Log out</a> </div>
                </div>
                <!-- End Logo + Top Nav -->
                <!-- Main Nav -->
                <div id="navigation">
                    <ul>
                        <li><a href="measurementList_us.jsp" ><span>Home</span></a></li>
                        <li><a href="us_notifications.jsp" class="active"><span>Notifications</span></a></li>
                        <li><a href="#"><span>Publications</span></a></li>
                        <li><a href="#"><span>Conferences</span></a></li>
                        <li><a href="#"><span>FAQs</span></a></li>
                    </ul>
                </div>
                <!-- End Main Nav -->
            </div>
        </div>
                <hr style="height:3px;border:none;color:#5c9ccc;background-color:#5c9ccc; " />
        <!-- End Header -->
        <!-- Container -->

        <div id="container">
            <div class="shell">
                <!-- Small Nav -->
                <div class="small-nav"> <a href="measurementList_us.jsp">Home</a> <span>&gt;</span> Resend Record</div>
                <!-- End Small Nav -->
            </div>
            <!-- Content -->
            <center>
                <div id="login" style="width: 1000px;height: 800px; ">

                    <!-- Box -->
                    <div class="box">
                        <!-- Box Head -->
                        <div class="box-head">
                            <h2 class="left"><strong>Resend Record #${stressMeasurement.smId}</strong></h2>

                        </div>
                        <!-- End Box Head-->
                        <div class="box-content"> 
                            <div class="cl">&nbsp;</div>

                           <form action="StressMeasurementController"  method="POST" autocomplete="on">
                                    <input type="hidden" id="smId" name="smId" value="${stressMeasurement.smId}"/>
                                    <input type="hidden" id="username" name="username" value="${user.username}"/>
                                
                                <fieldset class="dashed_fieldset">
                                    <br />
                                    <div style="display:block; width:100%">
                                        <div style="margin:0 auto;">
                                            <center>
                                                <center>

                                                    <table border="0" cellpadding = "2" cellspacing="7" style="float:left; margin-right:25px;margin-left:30px;">
                                                        <tbody>
                                                            <tr>
                                                                <td ><label class="tooltip">Country<span class="tooltiptext">Country within which the measurement was done</span></label></td><td><select  id="country" name="country"onchange="showTd(this)">
                                                                            <option value="<c:out value="${stressMeasurement.country}"/>"><c:out value="${stressMeasurement.country}"/></option>
                                                                        <c:forEach items="${countries}" var="list">
                                                                            <option value="<c:out value="${list}"/>"><c:out value="${list}"/></option>
                                                                        </c:forEach>
                                                                    </select>  </td>
                                                            </tr>
                                                            <tr id="hide_province" style="display: none;">
                                                                <td><label class="tooltip">Province <span class="tooltiptext">Province within which the measurement was done</span></label></td><td><select id="province"  name="province">
                                                                        <option value="<c:out value="${stressMeasurement.province}"/>"><c:out value="${stressMeasurement.province}"/></option>
                                                                        <option value="G"/>Gauteng</option>
                                                                        <option value="KZN"/>KwaZulu-Natal</option>
                                                                        <option value="WC"/>Western Cape</option>
                                                                        <option value="EC"/>Eastern Cape</option>
                                                                        <option value="NC"/>Northern Cape</option>
                                                                        <option value="FS"/>Free State</option>
                                                                        <option value="MP"/>Mpumalanga</option>
                                                                        <option value="NP"/>Limpopo (Northern Province)</option>
                                                                        <option value="NW"/>North West</option>
                                                                    </select>  </td>
                                                            </tr>
                                                            <tr>                            
                                                                <td><label class="tooltip">Locality<span class="tooltiptext">Mine or project where the measurement was done </span></label></td><td><input type="text" id="locality"  name="locality" value="${stressMeasurement.locality}"/> </td>
                                                            </tr>
                                                            <tr> 
                                                                <td><label class="tooltip">Site<span class="tooltiptext">Location on the mine or project where the measurement was done (e.g. 112 level, haulage east).</span></label></td><td><input type="text" id="site"  name="site" value="${stressMeasurement.site}"/></td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Location<span class="tooltiptext">Location of the measurement (e.g. Borehole 2 at 4.5m)</span></label></td><td><input type="text" id="location"  name="location" value="${stressMeasurement.location}"/> </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </center>
                                                <center>
                                                    <table border="0" cellpadding = "2" cellspacing="7" style="float:left; margin-right:25px;">
                                                        <tbody>
                                                            <tr>
                                                                <td><label class="tooltip">Method<span class="tooltiptext">Stress measurement method</span></label></td><td><input type="text" id="method" name="method" value="${stressMeasurement.depth}"/></td>

                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Grade<span class="tooltiptext">Individual measurement grading</span></label></td><td><select id="ig"  name="ig">
                                                                         <option value="<c:out value="${stressMeasurement.ig}"/>"><c:out value="${stressMeasurement.ig}"/></option>
                                                                        <option value="A"/>A</option>
                                                                        <option value="B"/>B</option>
                                                                        <option value="C"/>C</option>
                                                                        <option value="D"/>D</option>
                                                                        <option value="E"/>E</option>

                                                                    </select>  </td>

                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Group grade<span class="tooltiptext">Group measurement grading</span></label></td><td><input type="text" id="gg"  name="gg" value="${stressMeasurement.gg}"> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Average grade<span class="tooltiptext">Average of the individual and group grading</span></label></td><td><input type="text" id="avg"  name="avg" value="${stressMeasurement.avg}"/> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip"></label></td><td><input type="hidden" id="hidden"  name="hidden"/></td>
                                                            </tr>

                                                        </tbody>
                                                    </table>
                                                </center>
                                                <center>
                                                    <table border="0" cellpadding = "2" cellspacing="7" style="float:left; margin-right:25px;">
                                                        <tbody>
                                                            <tr>
                                                                <td><label class="tooltip">Longitude<span class="tooltiptext">Longitude of the stress measurement location </span></label></td><td><input type="text" id="longitude"  name="longitude" value="${stressMeasurement.latitude}"></input><span style="margin-left:-35px; color: #bdbdbd;">deg</span> </td>

                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Latitude<span class="tooltiptext">Latitude of the stress measurement location</span></label></td><td><input type="text" id="latitude"  name="latitude" value="${stressMeasurement.latitude}"></input><span style="margin-left:-35px; color: #bdbdbd;">deg</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Depth<span class="tooltiptext">Depth below surface at which the measurement was done</span></label></td><td><input type="text" id="depth"  name="depth" value="${stressMeasurement.depth}"></input><span style="margin-left:-35px; color: #bdbdbd;">(m)</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Expected vertical stress<span class="tooltiptext">Expected vertical stress at the measurement horizon (ρgH or estimated from numerical models)</span></label></td><td><input type="text" id="sob"  name="sob" value="${stressMeasurement.depth}"></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Date<span class="tooltiptext">Date when the stress measurement was done</span></label></td><td><input type="text" id="date"  name="date" value="${stressMeasurement.date}"/></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </center>
                                            </center>
                                        </div>
                                    </div> 
                                </fieldset>
                                <br/>
                                <fieldset class="dashed_fieldset">
                                    <br />
                                    <center>

                                        <div style="display:block; width:100%">
                                            <div style="margin:0 auto;">
                                                <fieldset class="inline" style="height: 300px;">
                                                    <legend class="formLegend"><b>Cartesian stresses</b></legend>
                                                    <table border="0" cellpadding = "2" cellspacing="7" style="float:left; margin-right:25px;">
                                                        <tbody>
                                                            <tr>
                                                                <td><label class="tooltip">Sxx<span class="tooltiptext">Normal stress in X (East - MPa))</span></label></td><td><input type="text" id="sx"  name="sx" value="${stressMeasurement.sx}"></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>

                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Syy<span class="tooltiptext">Normal stress in Y (Up - MPa)</span></label></td><td><input type="text" id="sy"  name="sy" value="${stressMeasurement.sy}"></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>

                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Szz<span class="tooltiptext">Normal stress in Z (North – MPa)</span></label></td><td><input type="text" id="sz"  name="sz" value="${stressMeasurement.sz}"></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Sxy<span class="tooltiptext">Shear stress XY (EU - MPa)</span></label></td><td><input type="text" id="sxy"  name="sxy" value="${stressMeasurement.sxy}"></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Syz<span class="tooltiptext">Shear stress YZ (UN - MPa)</span></label></td><td><input type="text" id="syz"  name="syz" value="${stressMeasurement.syz}"></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Sxz<span class="tooltiptext">Shear stress ZX (NE - MPa)</span></label></td><td><input type="text" id="szx"  name="szx" value="${stressMeasurement.szx}"></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>
                                                            </tr>
                                                            <tr>                           
                                                                <td><label class="tooltip"></label></td><td></td> 

                                                            </tr>
                                                            <tr>                           
                                                                <td><label></label></td><td></td> 

                                                            </tr>
                                                            <tr>                           
                                                                <td><label></label></td><td><button  class="button button2"  value="Calculate" id="Calculate" >Calculate principal stresses and k ratios</button></td>

                                                            </tr>

                                                        </tbody>
                                                    </table>
                                                </fieldset>
                                                <fieldset class="inline" style="height: 300px;">
                                                    <legend class="formLegend"><b>Principal stresses</b></legend>
                                                    <table border="0" cellpadding = "2" cellspacing="7" style="float:left">
                                                        <tbody>
                                                            <tr>
                                                                <td><label class="tooltip">S<sub>1</sub><span class="tooltiptext">Major principal stress</span></label></td><td><input type="text" id="s1"  name="s1" value="${stressMeasurement.s1}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">S<sub>2</sub><span class="tooltiptext">Intermediate principal stress</span></label></td><td><input type="text" id="s2"  name="s2" value="${stressMeasurement.s2}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">S<sub>3</sub><span class="tooltiptext">Minor principal stress</span></label></td><td><input type="text" id="s3"  name="s3" value="${stressMeasurement.s3}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Ɵ<sub>1</sub><span class="tooltiptext">Bearing angle/azimuth of the major principal stress (clockwise from North - degrees)</span></label></td><td><input type="text" id="bs1"  name="bs1" value="${stressMeasurement.bs1}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">deg</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Ɵ<sub>2</sub><span class="tooltiptext">Bearing angle/azimuth of the intermediate principal stress (anticlockwise from East - degrees)</span></label></td><td><input type="text" id="bs2"  name="bs2" value="${stressMeasurement.bs2}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">deg</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Ɵ<sub>3</sub><span class="tooltiptext">Bearing angle/azimuth of the minor principal stress (clockwise from North - degrees)</span></label></td><td><input type="text" id="bs3"  name="bs3" value="${stressMeasurement.bs3}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">deg</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">ψ<sub>1</sub><span class="tooltiptext">Dip/plunge of the major principal stress (down from horizontal - degrees)</span></label></td><td><input type="text" id="dips1"  name="dips1" value="${stressMeasurement.dips1}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">deg</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">ψ<sub>2</sub><span class="tooltiptext">Dip/plunge of the intermediate principal stress (down from horizontal - degrees)</span></label></td><td><input type="text" id="dips2"  name="dips2" value="${stressMeasurement.dips2}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">deg</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">ψ<sub>3</sub><span class="tooltiptext">Dip/plunge of the minor principal stress (down from horizontal - degrees)</span></label></td><td><input type="text" id="dips3"  name="dips3" value="${stressMeasurement.dips3}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">deg</span> </td>
                                                            </tr>

                                                        </tbody>
                                                    </table>
                                                </fieldset>
                                                <fieldset class="inline" style="height: 300px;">
                                                    <legend class="formLegend"><b>____</b></legend>
                                                    <table border="0" cellpadding = "2" cellspacing="7" style="float:left">
                                                        <tbody>
                                                            <tr>
                                                                <td></td><td><legend class="formLegend"><b>Horizontal plane stresses</b></legend></td>
                                                        </tr>
                                                        <tr>
                                                            <td><label class="tooltip">S<sub>H</sub><span class="tooltiptext">Major stress in the horizontal plane</span></label></td><td><input type="text" id="sh1"  name="sh1" value="${stressMeasurement.sh1}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>

                                                        </tr>
                                                        <tr>
                                                            <td><label class="tooltip">S<sub>h</sub><span class="tooltiptext">Minor stress in the horizontal plane</span></label></td><td><input type="text" id="sh3"  name="sh3" value="${stressMeasurement.sh3}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>

                                                        </tr>
                                                        <tr>
                                                            <td><label class="tooltip">Ɵ<sub>h</sub><span class="tooltiptext">Bearing/azimuth of the major stress in the horizontal plane (anticlockwise from East)</span></label></td><td><input type="text" id="bsh1"  name="bsh1" value="${stressMeasurement.bsh1}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">MPa</span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td><td><legend class="formLegend"><b>k ratios</b></legend></td>
                                                        </tr>
                                                        <tr>
                                                            <td><label class="tooltip">k<sub>H</sub><span class="tooltiptext">Ratio of the major horizontal-plane stress (SH) to the measured vertical stress (σy)</span></label></td><td><input type="text" id="k1"  name="k1" value="${stressMeasurement.k1}" readonly/> </td>

                                                        </tr>
                                                        <tr>
                                                            <td><label class="tooltip">k<sub>h</sub><span class="tooltiptext">Ratio of the minor horizontal-plane stress (Sh) to the measured vertical stress (σy)</span></label></td><td><input type="text" id="k3"  name="k3" value="${stressMeasurement.k3}" readonly/></td>

                                                        </tr>

                                                        <tr>
                                                            <td><label class="tooltip">k<sub>x</sub><span class="tooltiptext">Ratio of east-west horizontal stress (σx) to measured vertical stress (σy)</span></label></td><td><input type="text" id="kx"  name="kx" value="${stressMeasurement.kx}" readonly> </input><span style="margin-left:-35px; color: #bdbdbd;">deg</span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td><label class="tooltip">k<sub>z</sub><span class="tooltiptext">Ratio of north-south horizontal stress (σz) to expected vertical stress (σy)</span></label></td><td><input type="text" id="kz"  name="kz" value="${stressMeasurement.kz}" readonly></input><span style="margin-left:-35px; color: #bdbdbd;">deg</span> </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </fieldset>

                                            </div>
                                        </div> 

                                    </center>
                                    <br/>
                                </fieldset>
                                <br/>
                                <fieldset class="dashed_fieldset">
                                    <br />
                                    <div style="display:block; width:100%">
                                        <div style="margin:0 auto;">
                                            <center>
                                                <center>
                                                    <table border="0" cellpadding = "2" cellspacing="7" style="float:left; margin-right:20px;">
                                                        <tbody>
                                                            <tr>
                                                                <td><label class="tooltip">Geological sequence<span class="tooltiptext">The geological sequence relevant to the record</span></label></td><td><input type="text" id="seq"  name="seq" value="${stressMeasurement.seq}"/> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Rock type<span class="tooltiptext">The rock type in which the measurement was done</span></label></td><td><input type="text" id="rock"  name="rock" value="${stressMeasurement.rock}"/></td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Comments<span class="tooltiptext">Any additional comments</span></label></td><td><textarea type="text" id="notes"  name="notes"/> ${stressMeasurement.depth}</textarea></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </center>
                                                <center>
                                                    <table border="0" cellpadding = "2" cellspacing="7" style="float:left; margin-right:20px;">
                                                        <tbody>

                                                            <tr>
                                                                <td><label class="tooltip">Young's modulus<span class="tooltiptext">Modulus of elasticity of the rock at the measuring point(GPa)</span></label></td><td><input type="text" id="e"  name="e" value="${stressMeasurement.e}"></input><span style="margin-left:-35px; color: #bdbdbd;">GPa</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Poisson's ratio<span class="tooltiptext">Value of the Poisson’s ratio at the measuring point</span></label></td><td><input type="text" id="pr"  name="pr" value="${stressMeasurement.pr}"></input><span style="margin-left:-35px; color: #bdbdbd;">deg</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Number of Measurements<span class="tooltiptext">For averaged records, the number of measurements making up the record</span></label></td><td><input type="text" id="no"  name="no" value="${stressMeasurement.no}"/> </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </center>
                                                <center>
                                                    <table border="0" cellpadding = "2" cellspacing="7" style="margin-right: 5px;;">
                                                        <tbody>
                                                            <tr>
                                                                <td><label class="tooltip">Borehole bearing<span class="tooltiptext">Bearing/azimuth of the borehole in which the measurement was done</span></label></td><td><input type="text" id="bhb"  name="bhb" value="${stressMeasurement.bhb}"/></td>

                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Borehole dip<span class="tooltiptext">Dip/plunge of the borehole in which the measurement was done</span></label></td><td><input type="text" id="bhd"  name="bhd" value="${stressMeasurement.bhd}"/> </td>

                                                            </tr>
                                                            <tr>
                                                                <td><label class="tooltip">Source reference<span class="tooltiptext">Reference to the source of the record (document name if the document has been uploaded)</span></label></td><td><input type="text" id="reff"  name="reff" value="${stressMeasurement.reff}"/> </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </center>
                                            </center>
                                        </div>
                                    </div> 
                                </fieldset>
                                <br/>
                                <center>
                                    <button type="submit"  class="button" name="action" value="resend" ><b>Resend</b></button>
                                     <button  name="action" class="button" value="us_cancel"/><b>Cancel</b></button>
                                </center>
                            </form>
                        </div>
                    </div>
                </div>
            </center>
            <!-- End Box -->
        </div>
        <!-- End Container -->
        <!-- Footer -->
        <div id="footer">
            <div class="" style="text-align: center;"> <span class="center">Copyright &copy; CSIR 2017. All Rights Reserved.</span> <span class="right"></span> </div>
        </div>
        <!-- End Footer -->
    </body>
</html>
