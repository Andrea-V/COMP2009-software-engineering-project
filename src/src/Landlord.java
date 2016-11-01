package src;

import java.util.ArrayList;

public class Landlord extends User {

	//contains the flat ids.
	private ArrayList<Integer> flats;
	
	public Landlord(String first_name, String last_name, String email,
			String password, String address, String phone,ArrayList<Integer> flats) {
		super(first_name, last_name, email, password, address, phone);
		this.flats=new ArrayList<Integer>(flats);
	}

	public Landlord(){
		super();
		this.flats=new ArrayList<Integer>();
	}
	
	public Landlord(Landlord l) {
		super(l);
		this.flats=l.getFlatList();
	}

	public ArrayList<Integer> getFlatList() {
		return this.flats;
	}
}
