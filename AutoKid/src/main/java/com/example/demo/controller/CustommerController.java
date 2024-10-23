package com.example.demo.controller;


import com.example.demo.repository.GioHangChiTietRepo;
import com.example.demo.repository.LoaiSanPhamRepo;
import com.example.demo.service.QuanLySanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/autokid")
public class CustommerController {

    @Autowired
    GioHangChiTietRepo gioHangChiTietRepo;

    @Autowired
    QuanLySanPhamService quanLySanPhamService;

    @Autowired
    LoaiSanPhamRepo loaiSanPhamRepo;



    @GetMapping("/shoping-cart")
    public String showShoppingCart(Model model){
        model.addAttribute("currentPage","shoping-cart");
        return "/autokid/shoping-cart";
    }

    @GetMapping("/checkout")
    public String showCheckout(Model model){
        model.addAttribute("currentPage","checkout");
        return "/autokid/checkout";
    }

    @GetMapping("/contact")
    public String showContact(Model model){
        model.addAttribute("currentPage","contact");
        return "/autokid/contact";
    }
}