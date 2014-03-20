package myticketmachine.dao;

public class Path {
	private String spID;
	private String spFrom;
	private String spTo;
	private String spCost;
	private String spExchange;

	public Path(String spID, String spFrom, String spTo, String spCost, String spExchange) {
		this.spID = spID;
		this.spFrom = spFrom;
		this.spTo = spTo;
		this.spCost = spCost;
		this.spExchange = spExchange;
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
	
	public String getSPExchange() {
		return spExchange;
	}

}
