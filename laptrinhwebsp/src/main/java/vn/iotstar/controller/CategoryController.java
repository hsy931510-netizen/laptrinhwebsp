package vn.iotstar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.iotstar.entity.category;
import vn.iotstar.service.ICategoryService;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {

	@Autowired
	private ICategoryService categoryService;

	@GetMapping({"", "/"})
	public String listcategory(@RequestParam(value = "keyword", required = false) String keyword, ModelMap model) {
		List<category> list = categoryService.search(keyword);
		model.addAttribute("category", list);
		model.addAttribute("keyword", keyword);
		return "category/list";
	}

	@GetMapping("/create")
	public String showCreateForm(ModelMap model) {
		model.addAttribute("category", new category());
		return "category/form";
	}

	@PostMapping("/save")
	public String saveCategory(@ModelAttribute("category") category category, ModelMap model) {
		categoryService.save(category);
		model.addAttribute("message", "Lưu danh mục thành công!");
		return "redirect:/admin/categories";
	}

	@GetMapping("/edit/{id}")
	public String showEditForm(@PathVariable Long id, ModelMap model) {
		category category = categoryService.findById(id);
		model.addAttribute("category", category);
		return "category/form";
	}

	@GetMapping("/delete/{id}")
	public String deleteCategory(@PathVariable Long id, ModelMap model) {
		categoryService.deleteById(id);
		model.addAttribute("message", "Xóa danh mục thành công!");
		return "redirect:/admin/categories";
	}

}
