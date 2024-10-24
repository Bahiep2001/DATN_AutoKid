package com.example.demo.controller;

import com.example.demo.repository.LoaiSanPhamRepo;
import com.example.demo.service.QuanLySanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/autokid/home")
public class AutokidHome {
    @Autowired
    QuanLySanPhamService quanLySanPhamService;

    @Autowired
    LoaiSanPhamRepo loaiSanPhamRepo;

    @GetMapping("")
    public String home(Model model){
        model.addAttribute("currentPage","home");
        model.addAttribute("sanpham", quanLySanPhamService.getAll());
        model.addAttribute("loaisp", loaiSanPhamRepo.findAll());
        return "/autokid/index";
    }
}
