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

@WebServlet(urlPatterns = "/admin/categories/edit")
@MultipartConfig
public class CategoryEditController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ICategoryService service = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        req.setAttribute("cate", service.findById(Integer.parseInt(id)));

        req.getRequestDispatcher("/views/admin/category-edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(req.getParameter("categoryid"));
            CategoryEntity c = service.findById(id);

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

            service.update(c);
            resp.sendRedirect(req.getContextPath() + "/admin/categories");

        } catch (Exception e) {
            req.setAttribute("alert", e.getMessage());
            req.getRequestDispatcher("/views/admin/category-edit.jsp").forward(req, resp);
        }
    }
}
