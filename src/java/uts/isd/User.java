package uts.isd;
import java.io.Serializable;

public class User implements Serializable {
    private String email;
    private String password;
    private String name;
    private String accountType;

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public User() {
        
    }

    public User(String email, String password, String name, String accountType) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.accountType = accountType;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
