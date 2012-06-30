<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ include file="init_fbClient.jsp" %>

<%
String orderBy = request.getParameter("orderBy");
if (orderBy == null) {
	orderBy = "friend_count";
}
String query = ""; 
query += "select uid, name, friend_count, wall_count, likes_count from user "; 
query += "where uid in (select uid2 from friend where uid1 = me()) ";
query += "order by " + orderBy + " desc limit 10";
List<FqlUserDetail> users = fbClient.executeQuery(query, FqlUserDetail.class);
%>

<html><head><title>友達ランキング</title></head><body>
<table border="1">
	<tr>
		<th>名前</th>
		<th>友達</th>
		<th>投稿</th>
		<th>いいね！</th>
	</tr>
<% for (FqlUserDetail user : users) { %>
	<tr>
	<td> 
		<img src="https://graph.facebook.com/<%= user.uid %>/picture" />
		<%= user.name %>
	</td>
	<td><%= user.friendCount %></td>
	<td><%= user.wallCount %></td>
	<td><%= user.likesCount %></td>
	</tr>
<% } %>
</table>

並べ替え ： [
<a href="friends_ranking.jsp?orderBy=friend_count">友達</a> |
<a href="friends_ranking.jsp?orderBy=wall_count">投稿</a> |
<a href="friends_ranking.jsp?orderBy=likes_count">友達</a>
]


</body></html>