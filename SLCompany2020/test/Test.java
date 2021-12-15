
import dal.DepartmentDBContext;
import dal.TimeSheetDBContext;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author choap
 */
public class Test {
    public static void main(String[] args) {
        TimeSheetDBContext tdb = new TimeSheetDBContext();
//        System.out.println(tdb.CalculateTotalWorkDay(16));
        DepartmentDBContext ddb = new DepartmentDBContext();
        ArrayList a = ddb.getDepartmentID();
        System.out.println(a);
    }
}