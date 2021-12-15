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
import model.Employee;
import model.Insurance;

/**
 *
 * @author choap
 */
public class InsuranceDBContext extends DBContext{
    public ArrayList<Insurance> getInsuranceByName(String insurancesName) {
        ArrayList<Insurance> insurances = new ArrayList<>();
        try {
            String sql = "SELECT iid,iname,cost,eid FROM Insurance WHERE iname = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, insurancesName);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Insurance i = new Insurance();
                Employee e  = new Employee();
                
                e.setEid(rs.getInt("eid"));
                i.setIid(rs.getInt("iid"));
                i.setIname(rs.getString("iname"));
                i.setCost(rs.getInt("cost"));
                i.setEmployee(e);
                insurances.add(i);
            }

        } catch (SQLException ex) {
            Logger.getLogger(InsuranceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return insurances;
    }
}
