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
import model.TotalWorkDay;

/**
 *
 * @author choap
 */
public class TotalWorkDayDBContext extends DBContext {

    EmployeeDBContext edb = new EmployeeDBContext();
    TimeSheetDBContext tdb = new TimeSheetDBContext();

    public void updateTotalWorkDay() {
        ArrayList<Employee> employees = edb.getAllEmployee();

        for (Employee employee : employees) {
            int eid = employee.getEid();
            try {
                String sql = "UPDATE [totalWorkDay]\n"
                        + "   SET [totalWorkDay] = ? WHERE eid = ?;";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setInt(1, tdb.CalculateTotalWorkDay(eid));
                stm.setInt(2, eid);
                
                stm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(TotalWorkDayDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<TotalWorkDay> getAllTotalWorkDay() {
        ArrayList<TotalWorkDay> totalWorkday = new ArrayList<>();
        try {
            String sql = "SELECT eid,totalWorkDay FROM totalWorkDay";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                TotalWorkDay t = new TotalWorkDay();
                Employee e = new Employee();

                e.setEid(rs.getInt("eid"));
                t.setTotalWorkDay(rs.getInt("totalWorkDay"));
                t.setEmployee(e);
                totalWorkday.add(t);

            }

        } catch (SQLException ex) {
            Logger.getLogger(TotalWorkDayDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalWorkday;
    }

}
