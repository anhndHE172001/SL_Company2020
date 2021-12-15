<%-- 
    Document   : TimeSheet
    Created on : Dec 15, 2021, 12:15:57 PM
    Author     : choap
--%>

<%@page import="model.TimeSheet"%>
<%@page import="dal.TimeSheetDBContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Time Sheet</title>
        <% ArrayList<Employee> office = (ArrayList<Employee>) request.getAttribute("office"); %>
        <% ArrayList<Employee> sale = (ArrayList<Employee>) request.getAttribute("sale"); %>
        <% ArrayList<Employee> worker = (ArrayList<Employee>) request.getAttribute("worker"); %>
        <%! TimeSheetDBContext tdb = new TimeSheetDBContext(); %>

    </head>
    <body>
        <h1 style="text-align: center;color: #752fbc">Bảng chấm công</h1>
        <table border="1px" style="text-align: center">
            <tr>
                <td rowspan="2">STT</td>
                <td rowspan="2">Tên CBCNVC</td>
                <td rowspan="2">Bậc</br>Lương</td>
                <td colspan="31">Ngày trong tháng</td>
                <td colspan="31">Quy</br>ra</br>công</td>
            <tr>
                <% for (int i = 1; i < 32; i++) {%>
                <td style="background-color: #f798e9; text-align: left"><b>&ensp;&ensp;<%=i%></b></td>
                <%}%>
                <td>Công </br>thời</br>gian</td>
            </tr>
            
        </tr>
        <tr>
            <td style="background-color: #6495ed" colspan="2">Khối Văn Phòng</td>
        </tr>

        <% for (Employee offices : office) {%>
        <tr>
            <%! int a = 1;%>
            <td style="background-color: #87cefa"><%= a%></td>
            <td><%= offices.getEname()%></td>
            <td></td>


            <% ArrayList<TimeSheet> timesheet = (ArrayList<TimeSheet>) tdb.getOfficeTimeSheetByEiD(offices.getEid());%>
            <% for (TimeSheet t : timesheet) {%>

            <% Boolean isPresent = t.isPresent();
                String present = "";
                if (isPresent) {
                    present = " x ";
                }
            %>
            <td><%= present%></td>
            <%}%>
            <td style="background-color: #87cefa"> <%= tdb.CalculateTotalWorkDay(offices.getEid()) %></td>
            
            <%a++;
                if (a > office.size()) {
                    a = 1;
                }
            %>
        </tr>
        <%}%>

        <tr><td colspan="35"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</tr>
        <tr>
            <td style="background-color: #32cd32" colspan="2">Khối Bán Hàng</td>
        </tr>

        <% for (Employee sales : sale) {%>
        <tr>
            <%! int b = 1;%>
            <td style="background-color: #90ee90"><%= b%></td>
            <td><%= sales.getEname()%></td>
            <td></td>


            <% ArrayList<TimeSheet> timesheet = (ArrayList<TimeSheet>) tdb.getOfficeTimeSheetByEiD(sales.getEid());%>
            <% for (TimeSheet t : timesheet) {%>

            <% Boolean isPresent = t.isPresent();
                String present = "";
                if (isPresent) {
                    present = " x ";
                }
            %>
            <td><%= present%></td>
            <%}%>
            <td style="background-color: #90ee90"> <%= tdb.CalculateTotalWorkDay(sales.getEid()) %></td>
            
            <%b++;
                if (b > sale.size()) {
                    b = 1;
                }
            %>
        </tr>
        <%}%>

        <tr><td colspan="35"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</tr>
        <tr>
            <td style="background-color: #ffd700" colspan="2">Khối Công Nhân</td>
        </tr>

        <% for (Employee workers : worker) {%>
        <tr>
            <%! int c = 1;%>
            <td style="background-color: #fffacd"><%= c%></td>
            <td><%= workers.getEname()%></td>
            <td></td>


            <% ArrayList<TimeSheet> timesheet = (ArrayList<TimeSheet>) tdb.getOfficeTimeSheetByEiD(workers.getEid());%>
            <% for (TimeSheet t : timesheet) {%>

            <% Boolean isPresent = t.isPresent();
                String present = "";
                if (isPresent) {
                    present = " x ";
                }
            %>
            <td><%= present%></td>
            <%}%>
            <td style="background-color: #fffacd"> <%= tdb.CalculateTotalWorkDay(workers.getEid()) %></td>

            <%c++;
                if (c > worker.size()) {
                    c = 1;
                }
            %>
        </tr>
        <%}%>

    </table>
</body>
</html>
