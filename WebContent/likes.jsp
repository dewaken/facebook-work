<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ include file="init_fbClient.jsp" %>
<%
String objectId = request.getParameter("objectId");
String result = fbClient.publish(objectId + "/likes", String.class);
%>
<html><head><title>likes</title></head><body>

「いいね！」しました。<br />
<%= result %>


</body></html>