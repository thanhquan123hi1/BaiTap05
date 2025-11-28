package vn.Quan.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.Quan.entity.VideoEntity;
import vn.Quan.entity.CategoryEntity;
import vn.Quan.service.IVideoService;
import vn.Quan.service.ICategoryService;
import vn.Quan.service.impl.VideoService;
import vn.Quan.service.impl.CategoryService;

@WebServlet(urlPatterns = "/admin/videos/add")
@MultipartConfig
public class VideoAddController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private IVideoService videoService = new VideoService();
    private ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("categories", categoryService.findAll());

        req.getRequestDispatcher("/views/admin/video-add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try {
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            int categoryId = Integer.parseInt(req.getParameter("categoryid"));
            int views = Integer.parseInt(req.getParameter("views"));
            boolean active = req.getParameter("active") != null;

            Part poster = req.getPart("posterFile");

            String uploadDir = req.getServletContext().getRealPath("/uploads/video");
            Files.createDirectories(Paths.get(uploadDir));

            String posterName = null;
            if (poster != null && poster.getSize() > 0) {
                posterName = System.currentTimeMillis() + "_" + poster.getSubmittedFileName();
                poster.write(uploadDir + File.separator + posterName);
            }

            VideoEntity v = new VideoEntity();
            v.setTitle(title);
            v.setDescription(description);
            v.setViews(views);
            v.setActive(active);
            v.setPoster(posterName);

            CategoryEntity cate = categoryService.findById(categoryId);
            v.setCategory(cate);

            videoService.create(v);

            resp.sendRedirect(req.getContextPath() + "/admin/videos");

        } catch (Exception e) {
            req.setAttribute("alert", e.getMessage());
            doGet(req, resp);
        }
    }
}
