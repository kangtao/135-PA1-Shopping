package register;

public class User {
private String uname,urole,ustate,uage;
//private  uage;
private boolean valid;
public String getUname() {
	return uname;
}

public void setUname(String uname) {
	this.uname = uname;
}

public String getUrole() {
	return urole;
}

public void setUrole(String urole) {
	this.urole = urole;
}

public String getUage() {
	return uage;
}

public void setUage(String age) {
	this.uage = age;
}

public String getUstate() {
	return ustate;
}

public void setUstate(String state) {
	this.ustate = state;
}

public boolean isValid() {
    return valid;
}

 public void setValid(boolean newValid) {
    valid = newValid;
}	
}
