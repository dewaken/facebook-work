<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>

<%@ include file="init_fbClient.jsp" %>
<%
User user = fbClient.fetchObject("me", User.class);
%>
<html><head><title>Insert title here</title></head><body>
  <%= user.getEmail() %><br />
  <%= user.getName() %><br />  
  
<a href="/">/</a><br />
<a href="friends.jsp">friends.jsp</a><br />
<a href="fql_queries.jsp">fql_queries.jsp</a><br />
<a href="multiple_fql_queries.jsp">multiple_fql_queries.jsp</a><br />
<a href="publishing.jsp">publishing.jsp</a><br />
</body></html>