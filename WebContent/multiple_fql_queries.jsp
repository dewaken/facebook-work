<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="init_fbClient.jsp" %>
<%@ page import="entity.*" %>

<%
Map<String, String> queries = new HashMap<String, String>();
String usersQuery = "select uid, name from user where uid = me() or uid = 4";
queries.put("users", usersQuery);
String likersQuery = "select user_id from like where user_id = me() limit 10";
queries.put("likers", likersQuery);

MultiqueryResults results = fbClient.executeMultiquery(queries, MultiqueryResults.class);
%>
<html><head><title>Executing FQL Queries</title></head><body>

Users: <%= results.users %><br />
People who likes: <%= results.likers %><br />

</body></html>