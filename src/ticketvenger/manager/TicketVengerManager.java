package ticketvenger.manager;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gLin
 */
public class TicketVengerManager {
     @SuppressWarnings("unused")
	private static void handleSQLException(SQLException ex, String sql, String... parameters) {
        String msg = "Unable to access data; SQL=" + sql + "\n";

        for (String parameter : parameters) {
            msg += "," + parameter;
        }

        Logger.getLogger(TicketVengerManager.class.getName()).log(Level.SEVERE, msg, ex);
        throw new RuntimeException(msg, ex);
    }
     
    /*public static ArrayList<Quotation> retrieveAllQuotation() {
    
    }
    
    public static ArrayList<Quotation> retrieveByStatus(String status) {
       
    }
    
    public static ArrayList<Quotation> retrieveStatus() {
       
    }
    
    
    public static String retrieveLastID(String qStatus) {
       
    }    
    
    public static void createQuotation(ArrayList<Quotation> q) {
    }
    
    public static ArrayList<Quotation> retrieveByQuotationID(String qId) {
      
    }
    
    public static void updateQuotation(ArrayList<Quotation> q) {
        
    }*/
}
