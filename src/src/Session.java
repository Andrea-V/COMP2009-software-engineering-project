package src;

public class Session{
  private static Session instance;

  private User user;
  
  private Session(){
	  user=null;
  }

  public static Session getInstance(){
    if (instance == null)
    	instance=new Session();
    return instance;
  }
  
  public void setUser(User u){
	  this.user=u;
  }
  
  public User getUser(){
	  if(instance==null)
		  return null;
	  return this.user;
  }
}
