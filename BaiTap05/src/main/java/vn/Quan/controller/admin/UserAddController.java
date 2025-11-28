package vn.Quan.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.Quan.entity.UserEntity;
import vn.Quan.service.IUserService;
import vn.Quan.service.impl.UserService;

@WebServlet(urlPatterns = "/admin/users/add")
@MultipartConfig
public class UserAddController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private IUserService service = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/views/admin/user-add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try {
            UserEntity u = new UserEntity();
            u.setUsername(req.getParameter("username"));
            u.setPassword(req.getParameter("password"));
            u.setFullname(req.getParameter("fullname"));
            u.setPhone(req.getParameter("phone"));
            u.setEmail(req.getParameter("email"));
            u.setAdmin(req.getParameter("admin") != null);
            u.setActive(req.getParameter("active") != null);

            Part avatar = req.getPart("avatar");

            String uploadDir = req.getServletContext().getRealPath("/uploads/user");
            Files.createDirectories(Paths.get(uploadDir));

            if (avatar != null && avatar.getSize() > 0) {
                String fileName = System.currentTimeMillis() + "_" + avatar.getSubmittedFileName();
                avatar.write(uploadDir + File.separator + fileName);
                u.setImages(fileName);
            }

            service.create(u);
            resp.sendRedirect(req.getContextPath() + "/admin/users");

        } catch (Exception e) {
            req.setAttribute("alert", e.getMessage());
            req.getRequestDispatcher("/views/admin/user-add.jsp").forward(req, resp);
        }
    }
}
