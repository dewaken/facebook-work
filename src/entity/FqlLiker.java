package entity;

import com.restfb.Facebook;

public class FqlLiker {
	@Facebook("user_id")
	public String userId;

	@Override
	public String toString() {
		return userId;
	}
}
