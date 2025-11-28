package vn.Quan.controller.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.Quan.entity.CategoryEntity;
import vn.Quan.service.ICategoryService;
import vn.Quan.service.impl.CategoryService;
import vn.Quan.utils.Constant;

@WebServlet(urlPatterns = "/admin/categories/add")
@MultipartConfig
public class CategoryAddController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ICategoryService service = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/views/admin/category-add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try {
            CategoryEntity c = new CategoryEntity();
            c.setCategoryName(req.getParameter("categoryname"));
            c.setCategoryCode(req.getParameter("categorycode"));
            c.setStatus(req.getParameter("status") != null);

            Part img = req.getPart("images");
            if (img != null && img.getSize() > 0) {
                Files.createDirectories(Paths.get(Constant.DIR));
                String name = System.currentTimeMillis() + "_" + img.getSubmittedFileName();
                img.write(Constant.DIR + "/" + name);
                c.setImages(name);
            }

            service.create(c);
            resp.sendRedirect(req.getContextPath() + "/admin/categories");

        } catch (Exception e) {
            req.setAttribute("alert", e.getMessage());
            req.getRequestDispatcher("/views/admin/category-add.jsp").forward(req, resp);
        }
    }
}
