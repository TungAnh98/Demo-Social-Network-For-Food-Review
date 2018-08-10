/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modal.IModal;

/**
 *
 * @author phamtunganh
 */
public abstract class DBContext <T extends IModal> {
    Connection con;
    public DBContext(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String xUrl ="jdbc:sqlserver://localhost:1433;databaseName=AssignmentJavaNet";
            con = DriverManager.getConnection(xUrl, "sa", "sa");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public abstract T get(int id);
}
