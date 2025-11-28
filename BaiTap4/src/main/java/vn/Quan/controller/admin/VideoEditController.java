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

@WebServlet(urlPatterns = "/admin/videos/edit")
@MultipartConfig
public class VideoEditController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private IVideoService videoService = new VideoService();
    private ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");

        req.setAttribute("video", videoService.findById(Integer.parseInt(id)));
        req.setAttribute("categories", categoryService.findAll());

        req.getRequestDispatcher("/views/admin/video-edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try {
            int videoId = Integer.parseInt(req.getParameter("videoid"));

            VideoEntity v = videoService.findById(videoId);

            v.setTitle(req.getParameter("title"));
            v.setDescription(req.getParameter("description"));
            v.setViews(Integer.parseInt(req.getParameter("views")));
            v.setActive(req.getParameter("active") != null);

            int categoryId = Integer.parseInt(req.getParameter("categoryid"));
            v.setCategory(categoryService.findById(categoryId));

            String oldPoster = req.getParameter("posterOld");
            Part posterFile = req.getPart("posterFile");

            String uploadDir = req.getServletContext().getRealPath("/uploads/video");
            Files.createDirectories(Paths.get(uploadDir));

            if (posterFile != null && posterFile.getSize() > 0) {
                String fileName = System.currentTimeMillis() + "_" + posterFile.getSubmittedFileName();
                posterFile.write(uploadDir + File.separator + fileName);
                v.setPoster(fileName);
            } else {
                v.setPoster(oldPoster);
            }

            videoService.update(v);

            resp.sendRedirect(req.getContextPath() + "/admin/videos");

        } catch (Exception e) {
            req.setAttribute("alert", e.getMessage());
            doGet(req, resp);
        }
    }
}
