/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Payroll;

import dal.DepartmentDBContext;
import dal.EmployeeDBContext;
import dal.InsuranceDBContext;
import dal.TotalWorkDayDBContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Employee;
import model.Insurance;
import model.TotalWorkDay;

/**
 *
 * @author choap
 */
public class PayRollController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        EmployeeDBContext edb = new EmployeeDBContext();
        TotalWorkDayDBContext twdb = new TotalWorkDayDBContext();
        InsuranceDBContext idb = new InsuranceDBContext();
        DepartmentDBContext ddb = new DepartmentDBContext();
        twdb.updateTotalWorkDay();

        ArrayList<Integer> dids = ddb.getDepartmentID();  
        
        HashMap<Integer,ArrayList<Employee>> hashMapEmployee = new HashMap<>(dids.size());
        for (Integer did : dids) {
            hashMapEmployee.put(did, edb.getAllEmployeeByDid(did));
        }
        
        
        ArrayList<Employee> office = edb.getAllEmployeeByDid(1);
        ArrayList<Employee> sale = edb.getAllEmployeeByDid(2);
        ArrayList<Employee> worker = edb.getAllEmployeeByDid(3);
        
        ArrayList<TotalWorkDay> twd = twdb.getAllTotalWorkDay();
        ArrayList<Insurance> bhxh = idb.getInsuranceByName("BH XH");
        ArrayList<Insurance> bhyt = idb.getInsuranceByName("BH YT");
        ArrayList<Insurance> bhtn = idb.getInsuranceByName("BH TN");

        request.setAttribute("office", office);
        request.setAttribute("sale", sale);
        request.setAttribute("worker", worker);
        
        request.setAttribute("twd", twd);
        request.setAttribute("bhxh", bhxh);
        request.setAttribute("bhyt", bhyt);
        request.setAttribute("bhtn", bhtn);

        request.getRequestDispatcher("view/PayRoll.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
