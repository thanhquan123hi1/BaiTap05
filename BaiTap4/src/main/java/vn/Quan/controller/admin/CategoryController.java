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

@WebServlet(urlPatterns = "/admin/categories")
@MultipartConfig
public class CategoryController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ICategoryService service = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        String id = req.getParameter("id");

        if ("edit".equals(action) && id != null) {
            CategoryEntity c = service.findById(Integer.parseInt(id));
            req.setAttribute("cateEdit", c);
        }

        req.setAttribute("list", service.findAll());
        req.getRequestDispatcher("/views/admin/category-list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");

        try {
            switch (action) {
                case "create":
                    service.create(extract(req));
                    break;

                case "update":
                    CategoryEntity c = extract(req);
                    c.setCategoryId(Integer.parseInt(req.getParameter("categoryid")));
                    service.update(c);
                    break;

                case "delete":
                    service.delete(Integer.parseInt(req.getParameter("categoryid")));
                    break;
            }

            resp.sendRedirect(req.getContextPath() + "/admin/categories");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("alert", e.getMessage());
            req.getRequestDispatcher("/views/admin/category-list.jsp").forward(req, resp);
        }
    }

    private CategoryEntity extract(HttpServletRequest req) throws IOException, ServletException {

        CategoryEntity c = new CategoryEntity();

        c.setCategoryName(req.getParameter("categoryname"));
        c.setCategoryCode(req.getParameter("categorycode"));
        c.setStatus(req.getParameter("status") != null);

        // Upload ảnh
        Part img = req.getPart("images");
        if (img != null && img.getSize() > 0) {

            String uploadPath = req.getServletContext().getRealPath("/uploads/category");
            Files.createDirectories(Paths.get(uploadPath));

            String fileName = System.currentTimeMillis() + "_" + img.getSubmittedFileName();

            img.write(uploadPath + "/" + fileName);

            c.setImages(fileName);
        }

        return c;
    }
}

