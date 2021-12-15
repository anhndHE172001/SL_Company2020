<%-- 
    Document   : PayRoll
    Created on : Dec 15, 2021, 12:15:46 PM
    Author     : choap
--%>

<%@page import="java.util.Map"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.Insurance"%>
<%@page import="model.TotalWorkDay"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PayRoll</title>

        <% ArrayList<Employee> office = (ArrayList<Employee>) request.getAttribute("office"); %>
        <% ArrayList<Employee> sale = (ArrayList<Employee>) request.getAttribute("sale"); %>
        <% ArrayList<Employee> worker = (ArrayList<Employee>) request.getAttribute("worker"); %>
        <% ArrayList<TotalWorkDay> twd = (ArrayList<TotalWorkDay>) request.getAttribute("twd"); %>
        <% ArrayList<Insurance> bhxh = (ArrayList<Insurance>) request.getAttribute("bhxh"); %>
        <% ArrayList<Insurance> bhyt = (ArrayList<Insurance>) request.getAttribute("bhyt"); %>
        <% ArrayList<Insurance> bhtn = (ArrayList<Insurance>) request.getAttribute("bhtn"); %>

    </head>
    <body>
        <h2 style="text-align: center">Bảng lương chi tiết</h2>
        <table border="1px" style="text-align: center">
            <tr style="background-color: #ffb6c1">
                <td>STT</td>
                <td>Họ và tên</td>
                <td>Chức vụ</td>
                <td>Hệ số lương</td>
                <td>Số công</td>
                <td>Số tiền</td>
                <td>Số ngày nghỉ</td>
                <td>Tiền phạt/ ngày</td>
                <td>Tổng phạt</td>
                <td>Thực lương</td>
                <td>Bảo hiểm Xã Hội</td>
                <td>Bảo hiểm Y Tế</td>
                <td>Bảo hiểm Thất Nghiệp</td>
                <td>Tổng bảo hiểm</td>
                <td>Thực lĩnh</td>
            </tr>

            <tr><td style="align-items: center;background-color: #6495ed" ><h4>Khối Văn Phòng</h4></td></tr>


            <%! int payment; %>
            <%! int dayoff = 0; %>
            <%! int pelnaty = 0; %>
            <%! int insuranceCost = 0; %>


            <% for (Employee offices : office) {%>
            <% for (TotalWorkDay twds : twd) {%>
            <% for (Insurance bhxhs : bhxh) {%>
            <% for (Insurance bhyts : bhyt) {%>
            <% for (Insurance bhtns : bhtn) {%>
            <% if (offices.getEid() == twds.getEmployee().getEid() && offices.getEid() == bhxhs.getEmployee().getEid() && offices.getEid() == bhyts.getEmployee().getEid() && offices.getEid() == bhtns.getEmployee().getEid()) {%>
            <tr>
                <%! int a = 1;%>
                <td style="background-color: #87cefa"><%=a%></td>
                <td><%= offices.getEname()%></td>
                <td style="background-color: #87cefa"><%= offices.getPosition()%></td>
                <td><%= offices.getSalary()%></td>
                <td><%=twds.getTotalWorkDay()%></td>
                <% if (twds.getTotalWorkDay() > 20) {
                        payment = offices.getSalary();
                    } else {
                        dayoff = offices.getWorkDayForFullSalary() - twds.getTotalWorkDay();
                        pelnaty = dayoff * offices.getPelnaty();
                        payment = offices.getSalary() - pelnaty;
                    }
                %>
                <td  style="background-color: #87cefa;color: #ff3333"><%= offices.getSalary()%></td>
                <td><%= dayoff%></td>
                <td><%= offices.getPelnaty()%></td>
                <td><%= pelnaty%></td>
                <td><b><%= payment%></b></td>
                <td><%= bhxhs.getCost()%></td>
                <td><%= bhyts.getCost()%></td>
                <td><%= bhtns.getCost()%></td>
                <% insuranceCost = bhxhs.getCost() + bhyts.getCost() + bhtns.getCost();%>
                <td><b><%= insuranceCost%></b></td>
                <td><%=payment - insuranceCost%></td>
                <% a++; %>
                <% if (a > office.size()) {
                        a = 1;
                    }
                %>
            </tr>
            <%}%><%}%><%}%><%}%><%}%><%}%>

            <tr><td style="align-items: center;background-color: #32cd32" ><h4>Khối Bán Hàng</h4></td></tr>
            <% for (Employee sales : sale) {%>
            <% for (TotalWorkDay twds : twd) {%>
            <% for (Insurance bhxhs : bhxh) {%>
            <% for (Insurance bhyts : bhyt) {%>
            <% for (Insurance bhtns : bhtn) {%>
            <% if (sales.getEid() == twds.getEmployee().getEid() && sales.getEid() == bhxhs.getEmployee().getEid() && sales.getEid() == bhyts.getEmployee().getEid() && sales.getEid() == bhtns.getEmployee().getEid()) {%>
            <tr>
                <%! int b = 1;%>
                <td style="background-color: #90ee90"><%=b%></td>
                <td><%= sales.getEname()%></td>
                <td style="background-color: #90ee90"><%= sales.getPosition()%></td>
                <td><%= sales.getSalary()%></td>
                <td><%=twds.getTotalWorkDay()%></td>

                <% if (twds.getTotalWorkDay() > 20) {
                        payment = sales.getSalary();
                    } else {
                        dayoff = sales.getWorkDayForFullSalary() - twds.getTotalWorkDay();
                        pelnaty = dayoff * sales.getPelnaty();
                        payment = sales.getSalary() - pelnaty;
                    }
                %>
                <td style="background-color: #90ee90;color: #ff3333"><%= sales.getSalary()%></td>
                <td><%= dayoff%></td>
                <td><%= sales.getPelnaty()%></td>
                <td><%= pelnaty%></td>
                <td><b><%= payment%></b></td>
                <td><%= bhxhs.getCost()%></td>
                <td><%= bhyts.getCost()%></td>
                <td><%= bhtns.getCost()%></td>
                <% insuranceCost = bhxhs.getCost() + bhyts.getCost() + bhtns.getCost();%>
                <td><b><%= insuranceCost%></b></td>
                <td><%= payment - insuranceCost%></td>
                <% b++; %>
                <% if (b > sale.size()) {
                        b = 1;
                    }
                %>
            </tr>
            <%}%><%}%><%}%><%}%><%}%><%}%>

            <tr><td style="align-items: center;background-color: #ffd700" ><h4>Khối Công Nhân</h4></td></tr>
            <% for (Employee workers : worker) {%>
            <% for (TotalWorkDay twds : twd) {%>
            <% for (Insurance bhxhs : bhxh) {%>
            <% for (Insurance bhyts : bhyt) {%>
            <% for (Insurance bhtns : bhtn) {%>
            <% if (workers.getEid() == twds.getEmployee().getEid() && workers.getEid() == bhxhs.getEmployee().getEid() && workers.getEid() == bhyts.getEmployee().getEid() && workers.getEid() == bhtns.getEmployee().getEid()) {%>
            <tr>
                <%! int c = 1;%>
                <td style="background-color: #fffacd"><%=c%></td>
                <td><%= workers.getEname()%></td>
                <td style="background-color: #fffacd"><%= workers.getPosition()%></td>
                <td><%= workers.getSalary()%></td>
                <td><%=twds.getTotalWorkDay()%></td>
                <td style="background-color: #fffacd;color: #ff3333"><%= workers.getSalary()%></td>
                <td></td>
                <td></td>
                <td></td>
                <% payment = workers.getSalary() * twds.getTotalWorkDay();%>
                <td><b><%= payment%></b></td>
                <td><%= bhxhs.getCost()%></td>
                <td><%= bhyts.getCost()%></td>
                <td><%= bhtns.getCost()%></td>
                <% insuranceCost = bhxhs.getCost() + bhyts.getCost() + bhtns.getCost();%>
                <td><b><%= insuranceCost%></b></td>
                <td><%= payment - insuranceCost%></td>
                <% c++; %>
                <% if (c > worker.size()) {
                        c = 1;
                    }
                %>
            </tr>
            <%}%><%}%><%}%><%}%><%}%><%}%>

        </table>
    </body>
</html>
