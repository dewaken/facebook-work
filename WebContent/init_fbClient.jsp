<%@ page import="com.restfb.*" %>
<%@ page import="com.restfb.types.*" %>
<%@ page import="com.restfb.json.*" %>
<%@ page import="org.apache.commons.httpclient.*" %>
<%@ page import="org.apache.commons.httpclient.methods.*" %>
<%@ page import="java.util.*" %>
<%
//アプリID
String APP_ID = "**********";
//アプリの秘密キー
String APP_SECRET = "******************************";		
//アプリのURL
String REDIRECT_URL = "http://localhost:8080/fbseminar/";	
//アプリのパーミッション(カンマ区切り)
String PERMISSION = "";		
%>

<%
// アクセストークン
String accessToken = null;	
// Facebookクライアント
DefaultFacebookClient fbClient = null;

fbClient = (DefaultFacebookClient)session.getAttribute("fbClient");
if (fbClient == null) {
	String code = request.getParameter("code");
	if (code == null || code.length() == 0) {
		// Constructing a URL to the OAuth Dialog
		String url = "https://www.facebook.com/dialog/oauth"
			+ "?client_id=" + APP_ID
			+ "&redirect_uri=" + REDIRECT_URL	
			+ "&scope=" + PERMISSION; 			
		response.sendRedirect(url);
		return;
	} else {
		//アクセストークンの取得
		String url = "https://graph.facebook.com/oauth/access_token"
			+ "?client_id=" + APP_ID	
			+ "&redirect_uri=" + REDIRECT_URL	
			+ "&client_secret=" + APP_SECRET 
			+ "&code=" + code; 
		
		HttpClient client = new HttpClient();
		GetMethod get = new GetMethod(url);
		int responseCode = client.executeMethod(get);
		if (responseCode == 200) {
		    String body = get.getResponseBodyAsString();
		    accessToken = extractAccessToken(body);
			if (accessToken != null) {
				fbClient = new DefaultFacebookClient(accessToken);
				session.setAttribute("fbClient", fbClient);
			}
		}
	}
}
%>
<%!
String extractAccessToken(String body) {
    String[] keyAndValues = body.split("&");
    for ( int i = 0; i < keyAndValues.length; i ++ ) {
      String[] keyAndValue = keyAndValues[i].split("=");
      if ( keyAndValue[0].equals("access_token")) {
    	  return keyAndValue[1];
      }
    }	
	return null;
}
%>