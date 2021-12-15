/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author choap
 */
public class Employee {

    private int eid;
    private String ename;
    private String position;
    private int salary;
    private int pelnaty;
    private int workDayForFullSalary;
    private Department department;
    private TotalWorkDay totalWorkDay;
    private PayRoll payRoll;

    public TotalWorkDay getTotalWorkDay() {
        return totalWorkDay;
    }

    public void setTotalWorkDay(TotalWorkDay totalWorkDay) {
        this.totalWorkDay = totalWorkDay;
    }

    public PayRoll getPayRoll() {
        return payRoll;
    }

    public void setPayRoll(PayRoll payRoll) {
        this.payRoll = payRoll;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public int getPelnaty() {
        return pelnaty;
    }

    public void setPelnaty(int pelnaty) {
        this.pelnaty = pelnaty;
    }

    public int getWorkDayForFullSalary() {
        return workDayForFullSalary;
    }

    public void setWorkDayForFullSalary(int workDayForFullSalary) {
        this.workDayForFullSalary = workDayForFullSalary;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

}
