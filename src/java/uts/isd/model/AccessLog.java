package uts.isd.model;

import java.io.Serializable;
import java.util.Date;

public class AccessLog implements Serializable {
    int accessLogID;
    int customerID;
    Date loginTime;
    Date logoutTime;

    public AccessLog() {
    }

    public AccessLog(int accessLogID, int customerID, Date loginTime, Date logoutTime) {
        this.accessLogID = accessLogID;
        this.customerID = customerID;
        this.loginTime = loginTime;
        this.logoutTime = logoutTime;
    }

    public int getAccessLogID() {
        return accessLogID;
    }

    public void setAccessLogID(int accessLogID) {
        this.accessLogID = accessLogID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public Date getLogoutTime() {
        return logoutTime;
    }

    public void setLogoutTime(Date logoutTime) {
        this.logoutTime = logoutTime;
    }
}
