package ltweb.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.validation.Valid;
import ltweb.entity.Category;
import ltweb.model.CategoryModel;
import ltweb.service.CategoryService;

@Controller
@RequestMapping("admin/categories")
public class CategoryController {

	@Autowired
	CategoryService categoryService;

	@GetMapping("add")
	public String add(ModelMap model) {
		CategoryModel cateModel = new CategoryModel();
		cateModel.setIsEdit(false);
		
		// chuyển dữ liệu từ model vào biến "category" để đưa lên view
		model.addAttribute("category", cateModel);
		return "admin/categories/addOrEdit";
	}

	@RequestMapping("")
	public String list(ModelMap model) {
		//gọi hàm findAll() trong service
		List<Category> list = categoryService.findAll();

		//chuyển dữ liệu từ list lên biến categories 
		model.addAttribute("categories",list);
		return "admin/categories/list";
	}
	
	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, 
			@Valid @ModelAttribute("category") CategoryModel cateModel, 
			BindingResult result, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return new ModelAndView("admin/categories/addOrEdit");
		}
		
		Category entity = new Category();
		
		// Copy tu model sang entity
		BeanUtils.copyProperties(cateModel, entity);
		
		// goi ham save trong service
		categoryService.save(entity);
		
		// dua thong tin ve cho bien message
		String message = "";
		if (cateModel.getIsEdit() == true) {
			message = "Category is Edited!!!!";
		} else {
			message = "Category is saved!!!!";
		}
		
		redirectAttributes.addFlashAttribute("message", message);
		
		// redirect ve url controller
		return new ModelAndView("redirect:/admin/categories");
	}
	
	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") int id) {
		Optional<Category> otpCategory = categoryService.findById(id);
		CategoryModel cateModel = new CategoryModel();
		
		// kiem tra su ton tai cua category
		if (otpCategory.isPresent()) {
			Category entity = otpCategory.get();
			
			// copy tu entity sang cateModel
			BeanUtils.copyProperties(entity, cateModel);
			
			cateModel.setIsEdit(true);
			model.addAttribute("category", cateModel);
			
			return new ModelAndView("admin/categories/addOrEdit", model);
		}
		
		model.addAttribute("message", "Category is not existed!!");
		
		return new ModelAndView("forward:/admin/categories", model);
	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") int id,
			RedirectAttributes redirectAttributes) {

		categoryService.deleteById(id);

		redirectAttributes.addFlashAttribute("message", "Category is deleted!!!!");
		return new ModelAndView("redirect:/admin/categories", model);
	}

}
