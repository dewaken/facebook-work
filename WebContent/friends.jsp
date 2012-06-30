<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="init_fbClient.jsp" %>
<%
Connection<User> myFriends = fbClient.fetchConnection("me/friends", User.class);
%>
<html><head><title>友達一覧</title></head><body>

 友達数：<%= myFriends.getData().size() %><br />
<% for (User user : myFriends.getData()) { %> 
	<img src="https://graph.facebook.com/<%= user.getId() %>/picture" />
	<%= user.getName() %>
	<br />
<% } %>

</body></html>