package entity;

import com.restfb.Facebook;

public class FqlUser {
	@Facebook
	public String uid;

	@Facebook
	public String name;

	@Override
	public String toString() {
		return String.format("%s (%s)", name, uid);
	}
}
