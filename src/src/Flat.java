package src;

import java.util.*;

public class Flat {
	
	public static final String INCLUDES_BILLS = "Includes bills";
	public static final String INCLUDES_WASHER_DRYER = "Includes w/d";
	public static final String ALLOWS_PETS = "Allows pets";
	public static final String ALLOWS_CHILDREN = "Allows children";
	public static final String ALLOWS_SMOKING = "Allows smoking";
	public static int flatIdCount = 0;
	
	public static final String UNDEFINED = "undefined";
	public static final String YES = "yes";
	public static final String NO = "no";
	
	private int price;
	private String address;
	private Landlord owner;
	private String description;
	private HashMap<String, String> amenities;
	private String imageLink;
	private int flatId;
	
	public Flat(Landlord own){
		flatId = flatIdCount;
		price = -1;
		address = "";
		owner = own;
		description = "";
		amenities = new HashMap<String, String>();
		imageLink = "";
		
		flatIdCount++;
	}
	
	public Flat(Landlord own, int p, String addr){
		flatId = flatIdCount;
		price = p;
		address = addr;
		owner = own;
		description = "";
		amenities = new HashMap<String, String>();
		imageLink = "";
		
		flatIdCount++;
	}
	public int getId(){
		return flatId;
	}
	
	public int getPrice(){
		return price;
	}
	
	public void setPrice(int p){
		price = p;
	}
	
	public String getAddress(){
		return address;
	}
	
	public void setAddress(String addr){
		address = addr;
	}
	
	public Landlord getOwner(){
		return owner;
	}
	
	public void setOwner(Landlord own){
		owner = own;
	}
	
	public String getDescription(){
		return description;
	}
	
	public void setDescription(String desc){
		description = desc;
	}
	
	public String getAmenity(String a){
		return amenities.get(a);
	}
	
	public HashMap<String, String> getAmenityList(){
		return amenities;
	}
	
	public void setAmenity(String k, String v){
		amenities.put(k, v);
	}
	
	public String getImageLink(){
		return imageLink;
	}
	
	public void setImageLink(String il){
		imageLink = il;
	}
	
	public String toHTML(){
		String str=new String();
		
		str= "<table width=\"100%\" border=\"0\"><tr><td>";
		str+="<h3>Flat #"+this.getId()+"</h3><br />";
		str+=this.getAddress()+"<br />";//£"+this.getPrice()+"<br />";
		str+="</td><td>";
		str+="<img align=\"left\" src="+this.getImageLink()+" class=\"img-rounded\">";
		str+="</td></tr></table>";
		return str;
	}
}
