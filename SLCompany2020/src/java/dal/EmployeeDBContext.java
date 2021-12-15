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
import model.Employee;

/**
 *
 * @author choap
 */
public class EmployeeDBContext extends DBContext{
    public ArrayList<Employee> getAllEmployee()
    {
        ArrayList<Employee> employee = new ArrayList<>();
        try {
            String sql = "SELECT e.eid FROM Employee";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Employee e = new Employee();
                e.setEid(rs.getInt("eid"));
                e.setEname(rs.getString("ename"));
                e.setPosition(rs.getString("position"));
                e.setSalary(rs.getInt("salary"));
                e.setPelnaty(rs.getInt("pelnaty"));
                e.setWorkDayForFullSalary(rs.getInt("workDayForFullSalary"));
                
                Department d = new Department();
                d.setDid(rs.getInt("did"));
                d.setDname(rs.getString("dname"));
                e.setDepartment(d);
                employee.add(e);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employee;
    }  
    
    public ArrayList<Employee> getAllEmployeeByDid(int i)
    {
        ArrayList<Employee> employee = new ArrayList<>();
        try {
            String sql = "SELECT e.eid,e.ename,e.position,e.salary,e.pelnaty,e.workDayForFullSalary,e.did,d.dname FROM Employee e INNER JOIN Department d ON e.did = d.did WHERE d.did = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, i);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Employee e = new Employee();
                e.setEid(rs.getInt("eid"));
                e.setEname(rs.getString("ename"));
                e.setPosition(rs.getString("position"));
                e.setSalary(rs.getInt("salary"));
                e.setPelnaty(rs.getInt("pelnaty"));
                e.setWorkDayForFullSalary(rs.getInt("workDayForFullSalary"));
                
                Department d = new Department();
                d.setDid(rs.getInt("did"));
                d.setDname(rs.getString("dname"));
                e.setDepartment(d);
                employee.add(e);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employee;
    } 
}
