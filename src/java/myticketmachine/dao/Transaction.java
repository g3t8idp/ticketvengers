package myticketmachine.dao;

public class Transaction {
    private String ptID;
    private String ptDescription;
    private String ptAmount;
    private String ptRemarks;
    private String uID;
    private String ptFrom;
    private String ptTo;
    private String status;
    private String ptCategory;
    private String ptUsed;
    
    public Transaction(String ptID, String ptDescription, String ptFrom, String ptTo, String ptAmount, String ptRemarks, String status, String ptCategory, String ptUsed, String uID) {
        this.ptID = ptID;
        this.ptDescription = ptDescription;
        this.ptAmount = ptAmount;
        this.ptRemarks = ptRemarks;
        this.uID = uID;
        this.ptFrom = ptFrom;
        this.ptTo = ptTo;
        this.status = status;
        this.ptCategory = ptCategory;
        this.ptUsed = ptUsed;
    }

    public Transaction(String ptDescription, String ptFrom, String ptTo, String ptAmount, String ptRemarks, String status, String ptCategory, String ptUsed, String uID) {
        this.ptDescription = ptDescription;
        this.ptAmount = ptAmount;
        this.ptRemarks = ptRemarks;
        this.uID = uID;
        this.ptFrom = ptFrom;
        this.ptTo = ptTo;
        this.status = status;
        this.ptCategory = ptCategory;
        this.ptUsed = ptUsed;
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
    
    public String getPTto() {
        return ptTo;
    }
    
    public String getPTfrom() {
        return ptFrom;
    }
    
    public String getRefundStatus() {
        return status;
    }
    
    public String getPTCategory() {
        return ptCategory;
    }
    
    public String getPTUsed() {
        return ptUsed;
    }
}
