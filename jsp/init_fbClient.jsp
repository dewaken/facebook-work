<%@ page import="com.restfb.*" %>
<%@ page import="com.restfb.types.*" %>
<%@ page import="org.apache.commons.httpclient.*" %>
<%@ page import="org.apache.commons.httpclient.methods.*" %>
<%@ page import="java.util.*" %>
<%
/* こちらのパートは適宜書き換えてください。 */
// アプリID
//String APP_ID = "126246400846491"; // hello-dewa	
// アプリの秘密キー
//String APP_SECRET = "d87dfdf4848fa38022ac47beb4016973";		
// アプリのURL
//String REDIRECT_URL = "http://localhost:8080/fbwork/";	
// アプリのパーミッション(カンマ区切り)
//String PERMISSION = "ads_management,create_event,create_note,email,export_stream,friends_about_me,friends_activities,friends_birthday,friends_checkins,friends_education_history,friends_events,friends_games_activity,friends_groups,friends_hometown,friends_interests,friends_likes,friends_location,friends_notes,friends_online_presence,friends_photo_video_tags,friends_photos,friends_questions,friends_relationship_details,friends_relationships,friends_religion_politics,friends_status,friends_subscriptions,friends_videos,friends_website,friends_work_history,manage_friendlists,manage_notifications,manage_pages,offline_access,photo_upload,publish_actions,publish_checkins,publish_stream,read_friendlists,read_insights,read_mailbox,read_requests,read_stream,rsvp_event,share_item,sms,status_update,user_about_me,user_activities,user_birthday,user_checkins,user_education_history,user_events,user_games_activity,user_groups,user_hometown,user_interests,user_likes,user_location,user_notes,user_online_presence,user_photo_video_tags,user_photos,user_questions,user_relationship_details,user_relationships,user_religion_politics,user_status,user_subscriptions,user_videos,user_website,user_work_history,video_upload,xmpp_login";		

//アプリID
String APP_ID = "252351721541595"; // my-first-fb
//アプリの秘密キー
String APP_SECRET = "07371bd6dc837368d0c60e806b4df396";		
//アプリのURL
String REDIRECT_URL = "http://localhost:8080/fbwork/";	
//アプリのパーミッション(カンマ区切り)
String PERMISSION = "ads_management,create_event,create_note,email,export_stream,friends_about_me,friends_activities,friends_birthday,friends_checkins,friends_education_history,friends_events,friends_games_activity,friends_groups,friends_hometown,friends_interests,friends_likes,friends_location,friends_notes,friends_online_presence,friends_photo_video_tags,friends_photos,friends_questions,friends_relationship_details,friends_relationships,friends_religion_politics,friends_status,friends_subscriptions,friends_videos,friends_website,friends_work_history,manage_friendlists,manage_notifications,manage_pages,offline_access,photo_upload,publish_actions,publish_checkins,publish_stream,read_friendlists,read_insights,read_mailbox,read_requests,read_stream,rsvp_event,share_item,sms,status_update,user_about_me,user_activities,user_birthday,user_checkins,user_education_history,user_events,user_games_activity,user_groups,user_hometown,user_interests,user_likes,user_location,user_notes,user_online_presence,user_photo_video_tags,user_photos,user_questions,user_relationship_details,user_relationships,user_religion_politics,user_status,user_subscriptions,user_videos,user_website,user_work_history,video_upload,xmpp_login";		



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