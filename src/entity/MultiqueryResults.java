package entity;

import java.util.List;

import com.restfb.Facebook;

public class MultiqueryResults {
	@Facebook
	public List<FqlUser> users;

	@Facebook
	public List<FqlLiker> likers;
}
