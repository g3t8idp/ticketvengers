/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ticketvenger.model;

/**
 *
 * @author gLin
 */
public class Path {
    private String spID;
    private String spFrom;
    private String spTo;
    private String spCost;

    public Path(String spID, String spFrom, String spTo, String spCost) {
        this.spID = spID;
        this.spFrom = spFrom;
        this.spTo = spTo;
        this.spCost = spCost;
    }
    
    public String getSPId() {
        return spID;
    }
    
    public String getSPFrom() {
        return spFrom;
    }
    
    public String getSPTo() {
        return spTo;
    }
    
    public String getSPCost() {
        return spCost;
    }
}
