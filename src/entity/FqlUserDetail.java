package entity;

import com.restfb.Facebook;

public class FqlUserDetail extends FqlUser {

	@Facebook("friend_count")
	public Integer friendCount;

}
