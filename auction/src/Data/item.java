package Data;
import Data.timer;

public class item {
	
	item () {
		
	}
	
	// populates general information from the user
	void createItem (String itemOwner, float startingPrice, int startingTime) {

	}
	
	// populates general information from database for 1 item
	void queryItem () {
		
	}
	
	void bidItem (String user, float value) {
		
	}
	
	
	void addComment (String comment) {
		
	}
	
	void addRating (int rating) {
		
	}
	
	
	
	// User Information populated by getUserInfo
	String numActiveBids;
	String comments [];
	int ratings [];
	int timeLeft;
	float price;
	String itemOwner;
	String currentWinnerBid;
}