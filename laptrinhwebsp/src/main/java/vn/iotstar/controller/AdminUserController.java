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

import vn.iotstar.entity.User;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/admin/users")
public class AdminUserController {

    @Autowired
    private IUserService userService;

    @GetMapping({"", "/"})
    public String listUsers(@RequestParam(value = "keyword", required = false) String keyword, ModelMap model) {
        List<User> users = userService.search(keyword);
        model.addAttribute("users", users);
        model.addAttribute("keyword", keyword);
        return "admin/user/list";
    }

    @GetMapping("/create")
    public String showCreateForm(ModelMap model) {
        model.addAttribute("user", new User());
        return "admin/user/form";
    }

    @PostMapping("/save")
    public String saveUser(@ModelAttribute("user") User user, ModelMap model) {
        userService.save(user);
        model.addAttribute("message", "Lưu người dùng thành công!");
        return "redirect:/admin/users";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, ModelMap model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "admin/user/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id, ModelMap model) {
        userService.deleteById(id);
        model.addAttribute("message", "Xóa người dùng thành công!");
        return "redirect:/admin/users";
    }
}
