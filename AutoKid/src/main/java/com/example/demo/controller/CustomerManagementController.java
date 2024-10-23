package com.example.demo.controller;

import com.example.demo.model.KhachHang;
import com.example.demo.repository.KhachHangRepo;
import com.example.demo.response.KhachHangResponse;
import com.example.demo.service.QuanLyKhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;

@Controller
@RequestMapping("/admin/customer-management")
public class CustomerManagementController {
    @Autowired
    QuanLyKhachHangService serviceQLKH;

    @Autowired
    KhachHangRepo khachHangRepo;

    @GetMapping("/")
    public String getKhachHangPage(@RequestParam(defaultValue = "0") Integer page, Model model){
        Page<KhachHang> kh = khachHangRepo.findAll(PageRequest.of(page, 6));

        int totalCustomers = (int) khachHangRepo.count();
        int pageSize = 6;
        int totalPages;
        if(totalCustomers % pageSize != 0){
            totalPages = (int) Math.ceil(totalCustomers/pageSize) + 1;
        }
        else {
            totalPages = (int) Math.ceil(totalCustomers/pageSize);
        }
        model.addAttribute("alone",0);
        model.addAttribute("totalPage", totalPages);
        model.addAttribute("currentPage",page);
        model.addAttribute("khachhang",kh);
        return "/admin/customerManagement";
    }

    @GetMapping("/search-customer")
    public String searchCustomer(@RequestParam("ten") String ten, Model model){
        model.addAttribute("khachhang",serviceQLKH.searchCustomer(ten));
        return "/admin/customerManagement";
    }

    @DeleteMapping("/delete-customer")
    public String deleteCustomer(@RequestParam Integer idKH, Model model){
        model.addAttribute("khachhang", serviceQLKH.deleteCustomer(idKH));
        return "redirect:/admin/customer-management/";
    }

//    @GetMapping("/detail-customer")
//    public void detailCustomer(@RequestParam Integer idKH, Model model){
//        model.addAttribute("khd", serviceQLKH.khachHangDetail(idKH));
//    }
}
