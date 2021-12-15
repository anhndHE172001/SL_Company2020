/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Department;

/**
 *
 * @author choap
 */
public class DepartmentDBContext extends DBContext {

    public ArrayList<Department> getDepartment() {
        ArrayList<Department> departments = new ArrayList<>();
        try {
            String sql = "SELECT did,dname FROM Department";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Department d = new Department();
                d.setDid(rs.getInt("did"));
                d.setDname(rs.getString("dname"));
                departments.add(d);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return departments;
    }

    
    public ArrayList<Integer> getDepartmentID() {
        
        ArrayList<Department> dept = getDepartment();
        ArrayList a = new ArrayList();
        
        for(Department depts: dept){
            a.add(depts.getDid());
        }
        return a;
    }
}
