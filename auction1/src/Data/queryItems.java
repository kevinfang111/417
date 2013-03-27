package Data;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Query;

public class queryItems {
	
	public queryItems () {
		
	}
	
	// run this function multiple times in GUI for multiple results
	public static Iterable<Entity> queryAll () {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("item");
		Iterable<Entity> itemList = (Iterable<Entity>) ds.prepare(q).asIterable();
		
		return itemList;
	}
}
