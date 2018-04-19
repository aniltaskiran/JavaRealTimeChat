package model;

import java.util.HashMap;

public class ReturnHashMap {
    HashMap<String, String> iDToName = new HashMap<>();
    HashMap<String, String> idToLoginTime = new HashMap<>();

    public HashMap<String, String> getIdToLoginTime() {
        return idToLoginTime;
    }

    public HashMap<String, String> getiDToName() {
        return iDToName;
    }

    public void setIdToLoginTime(HashMap<String, String> idToLoginTime) {
        this.idToLoginTime = idToLoginTime;
    }

    public void setiDToName(HashMap<String, String> iDToName) {
        this.iDToName = iDToName;
    }
}
