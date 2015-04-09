package register;




public class User {
private String uname,urole,ustate;
private int uage;
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

public int getUage() {
	return uage;
}

public void setUage(int age) {
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
