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
	public user () {
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
			//if (e.getKey().getName().equals(username)) {
				this.username = e.getKey().getName();
				this.doesUserExist = true;
				return "welcome! " + e.getKey().getName();
			//} else {
				//return "Please Create Account!";
			//}
		}
		
		return "error";
	}
	
	public void addBuyHistory(String purchasedItem, String buyHistoryKey) {
		//if (this.doesUserExist == true) {
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
			
			Entity buyHistory = new Entity ("buy history", buyHistoryKey);
			buyHistory.setProperty("buy user", this.username);
			buyHistory.setProperty("buy item", purchasedItem);

			ds.put(buyHistory);
		//}
	}
	
	public void addSellHistory (String soldItem, String sellHistoryKey) {
		//if (this.doesUserExist == true) {
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
			
			Entity sellHistory = new Entity ("sell history", sellHistoryKey);
			sellHistory.setProperty("sell user", this.username);
			sellHistory.setProperty("sell item", soldItem);

			ds.put(sellHistory);
		//}
	}
	
	public Iterable<Entity> getBuyHistory (String username) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("buy history").addFilter("buy user", FilterOperator.EQUAL, this.username);
		return ds.prepare(q).asIterable();
	}
	
	public Iterable<Entity> getSellHistory (String username) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("sell history").addFilter("sell user", FilterOperator.EQUAL, this.username);
		return ds.prepare(q).asIterable();
	}
	
	public void deleteUser () {
		
	}
	
	public static String username;
	boolean doesUserExist = false;	
}
