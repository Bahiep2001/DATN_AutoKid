package com.example.demo.controller;

import com.example.demo.model.NhanVien;
import com.example.demo.repository.ChucVuRepo;
import com.example.demo.service.QuanLyNhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/staff")
public class StaffController {
    @Autowired
    private QuanLyNhanVienService nhanVienService;
    @Autowired
    private ChucVuRepo chucVuRepo;

    @GetMapping("/home")
    public String index(Model model) {
        model.addAttribute("danhSachChucVu" , chucVuRepo.findAll());
        model.addAttribute("listStaff", nhanVienService.findAllStaff());
        return "/admin/staff";
    }

    @PostMapping("/save")
    public String addStaff(@ModelAttribute("staff") NhanVien nhanVien, Model model) {
        model.addAttribute("danhSachChucVu", chucVuRepo.findAll());
        nhanVienService.save(nhanVien);
        return "redirect:/admin/staff/home";
    }

    @GetMapping("/edit/{id}")
    public String showStaff(@PathVariable Integer id, Model model) {
        NhanVien nhanVien = nhanVienService.findStaffbyId(id);
        model.addAttribute("danhSachChucVu", chucVuRepo.findAll());
        model.addAttribute("nhanVien", nhanVien);
        return "admin/updateStaff";
    }

    @PostMapping("/update")
    public String updateStaff(@ModelAttribute("nhanVien") NhanVien nhanVien) {
        nhanVienService.save(nhanVien);
        return "redirect:/admin/staff/home";
    }

    @GetMapping("/delete/{id}")
    public String deleteStaff(@PathVariable int id) {
        nhanVienService.delete(id);
        return "redirect:/admin/staff/home";
    }

    @GetMapping("/search")
    public String searchStaff(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        if (keyword == null || keyword.trim().isEmpty()) {
            model.addAttribute("listStaff", nhanVienService.findAllStaff());
        } else {
            model.addAttribute("listStaff", nhanVienService.sreachStaff(keyword));
        }
        return "/admin/staff";
    }

}
