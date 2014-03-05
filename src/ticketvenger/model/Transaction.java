/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ticketvenger.model;

/**
 *
 * @author gLin
 */
public class Transaction {
    private String ptID;
    private String ptDescription;
    private String ptAmount;
    private String ptRemarks;
    private String uID;

    public Transaction(String ptID, String ptDescription, String ptAmount, String ptRemarks, String uID) {
        this.ptID = ptID;
        this.ptDescription = ptDescription;
        this.ptAmount = ptAmount;
        this.ptRemarks = ptRemarks;
        this.uID = uID;
    }

    public String getPTId() {
        return ptID;
    }
    
    public String getPTDescription() {
        return ptDescription;
    }
    
    public String getPTAmount() {
        return ptAmount;
    }
    
    public String getPTRemarks() {
        return ptRemarks;
    }
    
    public String getUID() {
        return uID;
    }
}
