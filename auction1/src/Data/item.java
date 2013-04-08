package Data;
import Data.timer;
import java.io.*;
import java.lang.*;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Transaction;

public class item {
	
	public item () {
		
	}
	
	// populates general information from the user
	public void createItem (String itemName, String itemOwner, String itemID, String description, String price) {
		Entity e = new Entity("item", itemID);
		e.setProperty("item name", itemName);
		e.setProperty("itemOwner", itemOwner);
		e.setProperty("description", description);
		e.setProperty("price", price);
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		ds.put(e);
		
		this.itemID = itemID;
		this.itemName = itemName;
		this.itemOwner = itemOwner;
	}
	
	public void createAuction (String itemID, int startTime, int endTime, String AuctionID) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		// associate item with auction
		Entity auction = new Entity (itemID, AuctionID);
		auction.setProperty("startTime", startTime);
		auction.setProperty("end time", endTime);
		
		ds.put(auction);
		
		this.auctionID = AuctionID;
	}
	
	public Iterable<Entity> getAuctionList () {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query(this.getItemID());
		
		Iterable<Entity> auctionList = (Iterable<Entity>) ds.prepare(q).asIterable();
		return auctionList;
	}
	
	public void deleteAuction () {
		
	}
	
	public void createBid (String auctionID, String user, float price, String bidID) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		// associate auction with bid
		Entity bid = new Entity (auctionID, bidID);
		bid.setProperty("user", user);
		bid.setProperty("price", price);
		
		ds.put(bid);
		
		this.bidID = bidID;
	}
	
	public String getItemID () {
		return this.itemID;
	}
	
	public String getAuctionID () {
		return this.auctionID;
	}
	
	public String getBidID () {
		return this.bidID;
	}
	
	// populates general information from database for 1 item
	public String queryItem (String itemID) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("item");
		
		Iterable<Entity> itemList = (Iterable<Entity>) ds.prepare(q).asIterable();
		
		for (Entity e: itemList) {
			if (e.getKey().getName().equals(itemID)){
				this.itemID = e.getKey().getName();
				this.itemOwner = (String) e.getProperty("itemOwner");
				this.startingBid = Float.parseFloat(e.getProperty("startingPrice").toString());
				this.timeLeft = Integer.parseInt(e.getProperty("startingTime").toString());
				this.itemName = e.getProperty("item name").toString();
				return e.getKey().getName();
			}
		}
		return "no items found";
	}
	
	public String getItemOwner () {
		if (!this.itemOwner.equals(null)) {
			return this.itemOwner;
		} else {
			return "item owner not found";
		}
	}
	
	public void addCommentRatings (String item, String comment, String rating, String commentKey) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		Entity comments = new Entity ("comments", commentKey);
		comments.setProperty("comment", comment);
		comments.setProperty("item", this.itemName);
		if (rating != null) {
			comments.setProperty("rating", rating);
		} else {
			comments.setProperty("rating", "no rating");
		}
		
		ds.put(comments);
	}
	
	public Iterable <Entity> getCommentRatings (String item) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("comments").addFilter("item", FilterOperator.EQUAL, this.itemName);
		return ds.prepare(q).asIterable();
	}
	
	//TO DO: DELETE SOME OF THESE
	// User Information populated by getUserInfo
	String numActiveBids;
	String comments [];
	int ratings [];
	int timeLeft;
	float price;
	String itemOwner;
	String itemName;
	float currentBid;
	float startingBid;
	//
	
	String auctionID;
	String itemID;
	String bidID;
}
