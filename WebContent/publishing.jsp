<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ include file="init_fbClient.jsp" %>
<%
String message = request.getParameter("message");
String messageId = "";
if (message != null) {
	FacebookType publishMessageResponse = fbClient.publish("me/feed", 
			FacebookType.class, Parameter.with("message", message));	
	messageId = publishMessageResponse.getId();
}
%>
<html><head><title>publishing</title></head><body>

<form>
<input type="text" name="message" />
<input type="submit" />
</form>
Published message ID : <%= messageId %><br />
<a href="delete.jsp?objectId=<%= messageId %>">削除</a>
<a href="likes.jsp?objectId=<%= messageId %>">いいね！</a><br />
<form action="comments.jsp">
<input type="text" name="message" />
<input type="hidden" name="objectId" value="<%= messageId %>" />
<input type="submit" value="コメント"/>
</form>

</body></html>