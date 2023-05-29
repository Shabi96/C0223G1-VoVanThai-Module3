package com;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculatorServlet", value = "/CalculatorServlet")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("/calculator.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double listPrice = Double.parseDouble(request.getParameter("List Price"));
        double discountPercent = Double.parseDouble(request.getParameter("Discount Percent"));
        double discountAmount = listPrice * discountPercent * 0.01;
        double total = listPrice - discountAmount;
        request.setAttribute("result", discountAmount);
        request.setAttribute("total", total);
        RequestDispatcher r = request.getRequestDispatcher("/calculator.jsp");
        r.forward(request, response);
    }
}
