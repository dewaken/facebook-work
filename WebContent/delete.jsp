<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ include file="init_fbClient.jsp" %>
<%
String objectId = request.getParameter("objectId");
fbClient.deleteObject(objectId);
%>
<html><head><title>publishing</title></head><body>

<%= objectId %>のオブジェクトを削除しました。

</body></html>