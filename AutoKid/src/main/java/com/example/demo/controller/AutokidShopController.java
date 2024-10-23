package com.example.demo.controller;

import com.example.demo.repository.LoaiSanPhamRepo;
import com.example.demo.repository.MauSacRepo;
import com.example.demo.repository.SanPhamChiTietRepo;
import com.example.demo.repository.SanPhamRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/autokid/shop")
public class AutokidShopController {
    @Autowired
    SanPhamChiTietRepo spctRepo;

    @Autowired
    SanPhamRepo spRepo;

    @Autowired
    LoaiSanPhamRepo lspRepo;

    @Autowired
    MauSacRepo msRepo;

    @GetMapping("")
    public String showShop(Model model){
        model.addAttribute("currentPage","shop");
        model.addAttribute("sanphamchitiet",spctRepo.findAll());
        model.addAttribute("sanpham",spRepo.findAll());
        model.addAttribute("loaisp",lspRepo.findAll());
        model.addAttribute("mausac", msRepo.findAll());
        model.addAttribute("red","#c82333");
        return "/autokid/shop-grid";
    }
}
