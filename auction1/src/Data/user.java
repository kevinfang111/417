package Data;
import Data.item;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Transaction;
import com.google.appengine.api.datastore.Query.FilterOperator;

public class user {
	
	// initialize user object with username provided at login from GUI
	user (String username) {
		//check if user exist
	}
	
	public void createUser (String username) throws EntityNotFoundException {
		// create root entity
		Entity allUsers = new Entity ("allUsers", username);
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		ds.put(allUsers);
		
		this.username = username;
		this.doesUserExist = true;
	}
	
	public String retreiveUserInfo (String username) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("allUsers");
		for (Entity e: ds.prepare(q).asIterable()) {
			if (e.getKey().getName().equals(username)) {
				this.username = e.getKey().getName();
				this.doesUserExist = true;
				return "welcome! " + e.getKey().getName();
			} else {
				return "Please Create Account!";
			}
		}
		
		return "error";
	}
	
	void addBuyHistory(String purchasedItem) {
		if (this.doesUserExist == true) {
			Entity buyHistory = new Entity (this.username, purchasedItem);
			buyHistory.setProperty("buy", purchasedItem);
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
			ds.put(buyHistory);
		}
	}
	
	void addSellHistory (String soldItem) {
		if (this.doesUserExist == true) {
			Entity sellHistory = new Entity (this.username, soldItem);
			sellHistory.setProperty("sell", soldItem);
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
			ds.put(sellHistory);
		}
	}
	
	public Iterable<Entity> getBuyHistory () {
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
			Query q = new Query(this.username).addFilter("buy", FilterOperator.EQUAL, null);
			return ds.prepare(q).asIterable();
	}
	
	public Iterable<Entity> getSellHistory (String username) {
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
			Query q = new Query(this.username).addFilter("sell", FilterOperator.EQUAL, null);
			return ds.prepare(q).asIterable();
	}
	
	public static String username;
	boolean doesUserExist = false;
}
