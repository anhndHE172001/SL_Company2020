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
import model.TimeSheet;

/**
 *
 * @author choap
 */
public class TimeSheetDBContext extends DBContext {

    public ArrayList<TimeSheet> getOfficeTimeSheetByEiD(int eid) {
        ArrayList<TimeSheet> timeSheet = new ArrayList<>();
        try {
            String sql = "SELECT present FROM TimeSheets WHERE eid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                TimeSheet t = new TimeSheet();
                t.setPresent(rs.getBoolean("present"));
                timeSheet.add(t);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TimeSheetDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return timeSheet;
    }

    public int CalculateTotalWorkDay(int eid) {
//        ArrayList<TimeSheet> timeSheet = new ArrayList<TimeSheet>();
        int a = 0;
        try {
            String sql = "SELECT present FROM TimeSheets WHERE eid = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Boolean isPresent = rs.getBoolean("present");
                if (isPresent) {
                    a++;

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeSheetDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

}
