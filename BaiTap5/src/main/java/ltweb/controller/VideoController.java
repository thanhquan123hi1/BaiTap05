package ltweb.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ltweb.entity.Video;
import ltweb.entity.Category;
import ltweb.service.VideoService;
import ltweb.service.CategoryService;

@Controller
@RequestMapping("admin/videos")
public class VideoController {

    @Autowired
    VideoService videoService;

    @Autowired
    CategoryService categoryService; // gọi service lấy danh sách category

    @GetMapping("")
    public String list(Model model) {
        List<Video> list = videoService.findAll();
        model.addAttribute("videos", list);
        return "admin/videos/list";
    }

    @GetMapping("add")
    public String add(Model model) {
        Video video = new Video();
        video.setPoster("https://placehold.co/600x400"); // mặc định nếu chưa upload
        model.addAttribute("video", video);
        model.addAttribute("isEdit", false);
        
        // Gửi danh sách Category sang View để làm Dropdown
        List<Category> listCate = categoryService.findAll();
        model.addAttribute("categories", listCate);
        
        return "admin/videos/addOrEdit";
    }

    @PostMapping("save")
    public String save(Model model, @ModelAttribute("video") Video video) {
        // Lưu video vào CSDL
        videoService.save(video);
        return "redirect:/admin/videos";
    }

    @GetMapping("edit/{id}")
    public String edit(Model model, @PathVariable("id") int id) {
        Video video = videoService.findById(id);
        if (video != null) {
            model.addAttribute("video", video);
            model.addAttribute("isEdit", true);
            
            // gửi danh sách Category khi Edit
            model.addAttribute("categories", categoryService.findAll());
            
            return "admin/videos/addOrEdit";
        }
        return "redirect:/admin/videos";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") int id) {
        videoService.deleteById(id);
        return "redirect:/admin/videos";
    }
}