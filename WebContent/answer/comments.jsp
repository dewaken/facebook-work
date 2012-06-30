<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ include file="init_fbClient.jsp" %>
<%
// 参考 http://developers.facebook.com/docs/reference/api/post/
String objectId = request.getParameter("objectId");
String message = request.getParameter("message");
FacebookType publishCommentsResponse = fbClient.publish(objectId + "/comments" , 
		FacebookType.class, Parameter.with("message", message));
%>
<html><head><title>likes</title></head><body>

新しいコメントのＩＤ ： <%= publishCommentsResponse.getId() %>


</body></html>