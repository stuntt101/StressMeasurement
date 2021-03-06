<%-- 
    Document   : ad_notifications
    Created on : 23 Jan 2017, 1:11:58 PM
    Author     : LQwabe
--%>

<%@page import="com.stressmeasurement.entity.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.stressmeasurement.service.UserService"%>
<%@page import="com.stressmeasurement.service.NotificationService"%>
<%@page import="com.stressmeasurement.service.StressMeasurementService"%>
<%@page import="com.stressmeasurement.entity.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Notification</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    </head>
    <body>


        <%
            StressMeasurementService stressMeasurementService = new StressMeasurementService();
            NotificationService notificationService = new NotificationService();
            UserService userServise = new UserService();
            User recipient = userServise.getUserByUsername("admin");
            User sender = userServise.getUserByUsername("admin");
            int flagRDeleted = 0;
            int flagSDeleted = 0;
            int unReadMessages = 0;
            int ReadMessage = 1;

            List<Message> newMessages = notificationService.getMessages(recipient, flagRDeleted, unReadMessages);
            List<Message> oldMessages = notificationService.getMessages(recipient, flagRDeleted, ReadMessage);

            List<Message> sentMessages = notificationService.getMessageBySenderId(sender, flagSDeleted);

            int noOfUnReadMessages = newMessages.size();
            int noOfSentMessages = sentMessages.size();

            request.setAttribute("newMessages", newMessages);
            request.setAttribute("oldMessages", oldMessages);
            request.setAttribute("noOfUnReadMessages", noOfUnReadMessages);
            request.setAttribute("noOfUnReadMessages", noOfUnReadMessages);
            request.setAttribute("noOfSentMessages", noOfSentMessages);
            

               if (session.getAttribute("admin")!= null) {
                User user = (User) session.getAttribute("admin");
                String firstname = user.getFirstname();
                String lastname = user.getLastname();
                request.setAttribute("firstname", firstname);
                request.setAttribute("lastname", lastname);
                request.setAttribute("user", user);
            } else {

                request.setAttribute("session_expired", "session_expired");
            }


        %>
        <c:if test="${not empty session_expired}">
            <script type="text/javascript" >

                alert('Your session has expired. please login again.');
                location = 'measurementList.jsp';
            </script>
        </c:if>

        <c:if test="${not empty sent}">
            <script type="text/javascript" >

                alert('New message successfully sent');
                location = 'ad_notifications.jsp';
            </script>
        </c:if>
         <c:if test="${not empty messsage_deleted}">
            <script type="text/javascript" >

                alert('Message successfully deleted');
                location = 'ad_notifications.jsp';
            </script>
        </c:if>
         <c:if test="${not empty verified}">
            <script type="text/javascript" >

                alert('New stress Measurement record successfully verified');
                location = 'ad_notifications.jsp';
            </script>
        </c:if>
        <c:if test="${not empty already_verified}">
            <script type="text/javascript" >

                alert('Record already verified ');
                location = 'ad_notifications.jsp';
            </script>
        </c:if>

        <!-- Header -->
        <div id="header">
            <div class="shell">
                <!-- Logo + Top Nav -->
                <div id="top">
                    <h1 id="logo" style="font-family: sans-serif; font-weight:bold ">Stress Measurements Record</h1>

                    <div id="top-navigation"> <a href="#"><strong>Administrator</strong></a> <span>|</span> <a href="#">Help</a> <span>|</span> <a href="#">Profile Settings</a> <span>|</span> <a href="logout.jsp">Log out</a> </div>
                </div>
                <!-- End Logo + Top Nav -->
                <!-- Main Nav -->
                <div id="navigation">
                    <ul>
                        <li><a href="measurementList_ad.jsp" ><span>Home</span></a></li>
                        <li><a href="ad_notifications.jsp" class="active"><span>Notifications</span></a></li>
                        <li><a href="list_users.jsp"><span>User Management</span></a></li>
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
                <div class="small-nav"> <a href="ad_notifications.jsp">Notifications</a> <span>&gt;</span>Notifications list</div>
                <!-- End Small Nav -->


                <br />
                <!-- Main -->
                <div id="main">
                    <div class="cl">&nbsp;</div>
                    <!-- Content -->
                    <div id="content2">
                        <!-- Box -->
                        <div class="box">
                            <!-- Box Head -->
                            <div class="box-head">
                                <h2 ><center>Notifications</center></h2>

                            </div>
                            <!-- End Box Head -->
                            <!-- Table -->
                            <div class="table" >
                                <table width="100%" class="divHeight" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        
                                        <th>From</th>
                                        <th>Subject</th>
                                        <th>Date</th>
                                        <th width="110" class="ac">Content Control</th>
                                    </tr>
                                    <c:forEach items="${newMessages}" var="list">
                                        <fmt:formatDate value='${list.sentDate}' pattern='yyyy-MM-dd HH:mm' var="date" />
                                        <tr>
                                            
                                            <td class="unreadMessage"><a  href="StressMeasurementController?action=view_and_verify&smId=<c:out value="${list.dataReffId.getSmId()}"/>&senderId=<c:out value="${list.senderId.getUsername()}"></c:out>&messageId=<c:out value="${list.messageId}"></c:out>"class="unreadMessage" href="#"><c:out value="${list.senderId.getFirstname()} ${list.senderId.getLastname()}" /></a></td>
                                            <td class="unreadMessage"><h3><a  href="StressMeasurementController?action=view_and_verify&smId=<c:out value="${list.dataReffId.getSmId()}"/>&senderId=<c:out value="${list.senderId.getUsername()}"></c:out>&messageId=<c:out value="${list.messageId}"></c:out>"class="unreadMessage" href="#"><c:out value="${list.subject}" />.</a></h3></td>
                                            <td class="unreadMessage"><c:out value="${date}" /></td>
                                            <td class="unreadMessage"><a href="StressMeasurementController?action=deleteMessage&smId=<c:out value="${list.dataReffId.getSmId()}"/>&senderId=<c:out value="${list.senderId.getUsername()}"></c:out>&messageId=<c:out value="${list.messageId}"></c:out>" class="ico del" onclick="return confirm('Are you sure that you want to delete this message?');">Delete</a><a href="StressMeasurementController?action=view_and_verify&smId=<c:out value="${list.dataReffId.getSmId()}"/>&senderId=<c:out value="${list.senderId.getUsername()}"></c:out>&messageId=<c:out value="${list.messageId}"></c:out>" class="ico edit">View</a></td>
                                            </tr>
                                    </c:forEach>
                                     <c:forEach items="${oldMessages}" var="list">
                                        <fmt:formatDate value='${list.sentDate}' pattern='yyyy-MM-dd HH:mm' var="date" />
                                        <tr>
                                            
                                            <td class="readMessage"><a   href="StressMeasurementController?action=view_and_verify&smId=<c:out value="${list.dataReffId.getSmId()}"/>&senderId=<c:out value="${list.senderId.getUsername()}"></c:out>&messageId=<c:out value="${list.messageId}"></c:out>"class="readMessage" href="#"><c:out value="${list.senderId.getFirstname()} ${list.senderId.getLastname()}" /></a></td>
                                            <td class="readMessage"><h3><a  href="StressMeasurementController?action=view_and_verify&smId=<c:out value="${list.dataReffId.getSmId()}"/>&senderId=<c:out value="${list.senderId.getUsername()}"></c:out>&messageId=<c:out value="${list.messageId}"></c:out>" class="readMessage" href="#"><c:out value="${list.subject}" />.</a></h3></td>
                                            <td class="readMessage"><c:out value="${date}" /></td>
                                            <td class="readMessage"><a href="StressMeasurementController?action=deleteMessage&smId=<c:out value="${list.dataReffId.getSmId()}"/>&senderId=<c:out value="${list.senderId.getUsername()}"></c:out>&messageId=<c:out value="${list.messageId}"></c:out>" class="ico del" onclick="return confirm('Are you sure that you want to delete this message?');">Delete</a><a href="StressMeasurementController?action=view_and_verify&smId=<c:out value="${list.dataReffId.getSmId()}"/>&senderId=<c:out value="${list.senderId.getUsername()}"></c:out>&messageId=<c:out value="${list.messageId}"></c:out>" class="ico edit">View</a></td>
                                            </tr>
                                    </c:forEach>
                                </table>
                               
                            </div>
                            <!-- Table -->
                        </div>
                        <!-- End Box -->

                    </div>
                    <!-- End Content -->
                    <!-- Sidebar -->
                    <div id="sidebar">
                        <!-- Box -->
                        <div class="box ">
                            <!-- Box Head -->
                            <div class="box-head">
                                <h2>Management</h2>
                            </div>
                            <!-- End Box Head-->
                            <div class="box-content"> 
                                <div class="cl">&nbsp;</div>

                                <p><a href="ad_notifications.jsp">New messages(${noOfUnReadMessages})</a></p>
                                <p><a href="ad_sent.jsp">Sent messages(${noOfSentMessages})</a></p>
                                <!-- Sort -->

                                <!-- End Sort -->
                            </div>
                        </div>
                        <!-- End Box -->
                    </div>
                    <!-- End Sidebar -->
                    <div class="cl">&nbsp;</div>
                </div>
                <!-- Main -->
            </div>
        </div>
        <!-- End Container -->
        <!-- Footer -->
        <div id="footer">
            <div class="shell" style="text-align: center;"> <span class="center">Copyright &copy; CSIR 2017. All Rights Reserved.</span> <span class="right"></span> </div>
        </div>
        <!-- End Footer --
        <!-- End Footer -->
    </body>
</html>
