package src;

import java.util.ArrayList;

public class Tenant extends User {

	//contains the flat ids.
	private ArrayList<Integer> iflats;
	
	public Tenant(String first_name, String last_name, String email,
			String password, String address, String phone,ArrayList<Integer> fl) {
		super(first_name, last_name, email, password, address, phone);
		this.iflats=fl;
	}

	public Tenant(){
		super();
		this.iflats=new ArrayList<Integer>();
	}
	
	public Tenant(Tenant u) {
		super(u);
		this.iflats=u.getInterestingFlats();
	}

	public ArrayList<Integer> getInterestingFlats() {
		return this.iflats;
	}

}
