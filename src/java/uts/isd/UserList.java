package uts.isd;

import java.io.Serializable;
import java.util.LinkedList;

public class UserList implements Serializable{
    private LinkedList<User> users;
    
    public UserList() {
        users = new LinkedList<User>();
    }
    
    public void addUser(User user) {
        users.add(user);
    }

    public void clearUsers() {
        users.clear();
    }
    
    public User getUser(String name, String password){
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getEmail().equals(name)) {
                if (users.get(i).getPassword().equals(password)) {
                    return users.get(i);
                }
            }
        }
        return null;
    }
    
    public boolean unusedEmail(String email) {
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getEmail().equals(email)) {
                return false;
            }
        }
        return true;
    }
    
    public String allUsers() {
        String allUsers  = "All users are: \n";
        for (int i = 0; i < users.size(); i++) {
            allUsers += users.get(i).getEmail() + "|" + users.get(i).getPassword() + "\n";
        }
        return allUsers;
    }
}
