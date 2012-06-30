<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="init_fbClient.jsp" %>
<%@ page import="entity.*" %>

<%
String query = "select uid, name from user where uid = me() or uid = 4";
List<FqlUser> fqlUsers = fbClient.executeQuery(query, FqlUser.class);
%>
<html><head><title>Executing FQL Queries</title></head><body>

<% for (FqlUser fqlUser : fqlUsers) { %> 
	<img src="https://graph.facebook.com/<%= fqlUser.uid %>/picture" />
	<%= fqlUser.name %>
	<br />
<% } %>

</body></html>