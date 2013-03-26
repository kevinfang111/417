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
	public void createItem (String itemName, String itemOwner, float startingPrice, int startingTime) {
		Entity e = new Entity("item", itemName);
		e.setProperty("itemOwner", itemOwner);
		e.setProperty("startingPrice", startingPrice);
		e.setProperty("currentBid", 0);
		e.setProperty("startingTime", startingTime);
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		ds.put(e);
		
		this.itemName = itemName;
		this.itemOwner = itemOwner;
		this.startingBid = startingPrice;
		this.currentBid = 0;
		this.timeLeft = startingTime;
	}
	
	// populates general information from database for 1 item
	public String queryItem (String itemName) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("item");
		
		Iterable<Entity> itemList = (Iterable<Entity>) ds.prepare(q).asIterable();
		
		for (Entity e: itemList) {
			if (e.getKey().getName().equals(itemName)){
				this.itemName = e.getKey().getName();
				this.itemOwner = (String) e.getProperty("itemOwner");
				//this.startingBid = Float.parseFloat((String) e.getProperty("startingPrice"));
				//this.currentBid = Float.parseFloat((String) e.getProperty("currentBid"));
				//this.timeLeft = Integer.parseInt((String) e.getProperty("startingTime"));
				
				this.startingBid = Float.parseFloat(e.getProperty("startingPrice").toString());
				this.currentBid = Float.parseFloat(e.getProperty("currentBid").toString());
				this.timeLeft = Integer.parseInt(e.getProperty("startingTime").toString());
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
	
	public float getstartingBid () {
		return this.startingBid;
	}
	
	public float getCurrentBid () {
		return this.currentBid;
	}
	
	public int getTimeLeft () {
		return this.timeLeft;
	}
	
	public void bidItem (String user, float value) {
		
	}
	
	public void addComment (String comment) {
		
	}
	
	public void addRating (int rating) {
		
	}
	
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
}
