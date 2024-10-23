package com.example.demo.service;

import com.example.demo.model.KhachHang;
import com.example.demo.repository.KhachHangRepo;
import com.example.demo.response.KhachHangResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class QuanLyKhachHangService {
    @Autowired
    KhachHangRepo khachHangRepo;

    private static final Logger logger = LoggerFactory.getLogger(QuanLyKhachHangService.class);

    //đổ toàn bộ khách hàng ra table
    public List<KhachHangResponse> getAllKH(){
        List<KhachHangResponse> list = new ArrayList<>();
        for(KhachHang k: khachHangRepo.findAll()){
            list.add(new KhachHangResponse(k));
        }
        return list;
    }

    // tìm kiếm khách hàng theo tên gần đúng
    public List<KhachHang> searchCustomer(String ten){
        List<KhachHang> list = new ArrayList<>();
        try {
            for(KhachHang k : khachHangRepo.findByName(ten.trim())){
                list.add(k);
            }
        } catch (Exception error) {
            logger.error("Error occurred while searching for customers: ", error);
        }
        return list;
    }

    public List<KhachHangResponse> deleteCustomer(Integer idKH){
        List<KhachHangResponse> list = new ArrayList<>();
        for(KhachHang kh: khachHangRepo.findAll()){
            if(kh.getId() == idKH){
                khachHangRepo.deleteById(idKH);
            }
            else list.add(new KhachHangResponse(kh));
        }
        return list;
    }
}
