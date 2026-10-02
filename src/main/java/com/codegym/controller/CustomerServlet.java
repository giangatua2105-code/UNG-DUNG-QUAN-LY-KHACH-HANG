package com.codegym.controller;
import com.codegym.model.Customer;
import com.codegym.service.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
@WebServlet(name="CustomerServlet", urlPatterns="/customers")
public class CustomerServlet extends HttpServlet {
    private CustomerService svc = new CustomerServiceImpl();
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String a = req.getParameter("action"); if (a==null) a="";
        if ("create".equals(a)) create(req,res);
        else if ("edit".equals(a)) update(req,res);
        else if ("delete".equals(a)) delete(req,res);
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String a = req.getParameter("action"); if (a==null) a="";
        if ("create".equals(a)) req.getRequestDispatcher("customer/create.jsp").forward(req,res);
        else if ("edit".equals(a)) editForm(req,res);
        else if ("delete".equals(a)) delForm(req,res);
        else if ("view".equals(a)) view(req,res);
        else list(req,res);
    }
    private void list(HttpServletRequest r, HttpServletResponse p) throws ServletException, IOException {
        List<Customer> cs = svc.findAll(); r.setAttribute("customers", cs);
        r.getRequestDispatcher("customer/list.jsp").forward(r,p);
    }
    private void editForm(HttpServletRequest r, HttpServletResponse p) throws ServletException, IOException {
        int id = Integer.parseInt(r.getParameter("id")); Customer c = svc.findById(id);
        if (c==null) r.getRequestDispatcher("error-404.jsp").forward(r,p);
        else { r.setAttribute("customer", c); r.getRequestDispatcher("customer/edit.jsp").forward(r,p); }
    }
    private void delForm(HttpServletRequest r, HttpServletResponse p) throws ServletException, IOException {
        int id = Integer.parseInt(r.getParameter("id")); Customer c = svc.findById(id);
        if (c==null) r.getRequestDispatcher("error-404.jsp").forward(r,p);
        else { r.setAttribute("customer", c); r.getRequestDispatcher("customer/delete.jsp").forward(r,p); }
    }
    private void view(HttpServletRequest r, HttpServletResponse p) throws ServletException, IOException {
        int id = Integer.parseInt(r.getParameter("id")); Customer c = svc.findById(id);
        if (c==null) r.getRequestDispatcher("error-404.jsp").forward(r,p);
        else { r.setAttribute("customer", c); r.getRequestDispatcher("customer/view.jsp").forward(r,p); }
    }
    private void create(HttpServletRequest r, HttpServletResponse p) throws ServletException, IOException {
        int id = (int)(Math.random()*10000);
        Customer c = new Customer(id, r.getParameter("name"), r.getParameter("email"), r.getParameter("address"));
        svc.save(c);
        r.setAttribute("message","New customer was created");
        r.getRequestDispatcher("customer/create.jsp").forward(r,p);
    }
    private void update(HttpServletRequest r, HttpServletResponse p) throws ServletException, IOException {
        int id = Integer.parseInt(r.getParameter("id")); Customer c = svc.findById(id);
        if (c==null) r.getRequestDispatcher("error-404.jsp").forward(r,p);
        else {
            c.setName(r.getParameter("name")); c.setEmail(r.getParameter("email")); c.setAddress(r.getParameter("address"));
            svc.update(id,c);
            r.setAttribute("customer", c); r.setAttribute("message","Customer information was updated");
            r.getRequestDispatcher("customer/edit.jsp").forward(r,p);
        }
    }
    private void delete(HttpServletRequest r, HttpServletResponse p) throws ServletException, IOException {
        int id = Integer.parseInt(r.getParameter("id")); Customer c = svc.findById(id);
        if (c==null) r.getRequestDispatcher("error-404.jsp").forward(r,p);
        else { svc.remove(id); p.sendRedirect(r.getContextPath()+"/customers"); }
    }
}
