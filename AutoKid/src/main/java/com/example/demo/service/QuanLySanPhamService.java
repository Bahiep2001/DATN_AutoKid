package com.example.demo.service;

import com.example.demo.model.*;
import com.example.demo.repository.*;
import com.example.demo.repository.SanPhamRepo;
import com.example.demo.response.SanPhamChiTietResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class QuanLySanPhamService {
    @Autowired
    SanPhamChiTietRepo spctRepo;

    @Autowired
    SanPhamRepo sanPhamRepo;

    @Autowired
    SanPhamChiTietRepo sanPhamChiTietRepo;

    @Autowired
    ThuongHieuRepo thuongHieuRepo;

    @Autowired
    MauSacRepo mauSacRepo;

    @Autowired
    KichCoRepo kichCoRepo;

    @Autowired
    ChatLieuRepo chatLieuRepo;

    @Autowired
    LoaiSanPhamRepo loaiSanPhamRepo;

    public Page<SanPhamChiTiet> getAllSanPhamChiTiets(Pageable pageable) {
        return sanPhamChiTietRepo.findAll(pageable);
    }

    public List<SanPhamChiTiet> getAllSanPham(){
        return sanPhamChiTietRepo.findAll();
    }

    public List<ThuongHieu> getAllThuongHieu(){
        return thuongHieuRepo.findAll();
    }

    public void AddThuongHieu(ThuongHieu thuongHieu){
        thuongHieuRepo.save(thuongHieu);
    }


    public void DeleteThuongHieu(Integer id){
        thuongHieuRepo.deleteById(id);
    }

    public void DetailThuongHieu(Integer id){
        thuongHieuRepo.findById(id);
    }

    public List<ThuongHieu> searchTH(String tenTH){
        return  thuongHieuRepo.searchThuongHieu("%" + tenTH + "%");
    }

    public List<MauSac> getAllMauSac(){
        return mauSacRepo.findAll();
    }

    public void addMauSac(MauSac mauSac){
        mauSacRepo.save(mauSac);
    }

    public void deleteMauSac(Integer id){
        mauSacRepo.deleteById(id);
    }

    public void detailMauSac(Integer id){
        mauSacRepo.findById(id);
    }

    public List<KichCo> getAllKichCo(){
        return kichCoRepo.findAll();
    }

    public void addKichCo(KichCo kichCo){
        kichCoRepo.save(kichCo);
    }

    public void deleteKichCo(Integer id){
        kichCoRepo.deleteById(id);
    }

    public List<ChatLieu> getAllChatLieu(){
        return chatLieuRepo.findAll();
    }

    public void addChatLieu(ChatLieu chatLieu){
        chatLieuRepo.save(chatLieu);
    }

    public void deleteChatLieu(Integer id){
        chatLieuRepo.deleteById(id);
    }

    public void addLoaiSanPham(LoaiSanPham loaiSanPham){
        loaiSanPhamRepo.save(loaiSanPham);
    }

    public Page<LoaiSanPham> getAllLoaiSanPham(Pageable pageable) {
        return loaiSanPhamRepo.findAll(pageable);
    }

    public void deleteLoaiSanPham(Integer id){
        loaiSanPhamRepo.deleteById(id);
    }

    public List<SanPhamChiTietResponse> getAll(){
        List<SanPhamChiTietResponse> list = new ArrayList<>();
        for(SanPhamChiTiet spct: spctRepo.findAll()){
            list.add(new SanPhamChiTietResponse(spct));
        }
        return list;
    }

    public SanPhamChiTietResponse getById(Integer idSPCT){
        SanPhamChiTietResponse spct = null;
        for(SanPhamChiTiet s: spctRepo.findAll()){
            if(s.getId().equals(idSPCT)){
                spct = new SanPhamChiTietResponse(s);
                break;
            }
        }
        System.out.println(spct.getMaSPCT());
        return spct;
    }

    public List<SanPhamChiTietResponse> getAllRelatedProduct(Integer idSPCT){
        SanPhamChiTiet spct = null;
        for(SanPhamChiTiet s: spctRepo.findAll()){
            if(s.getId().equals(idSPCT)){
                spct = s;
                break;
            }
        }
        Integer idSP = spct.getSanPham().getId();
        List<SanPhamChiTietResponse> list = new ArrayList<>();
        for (SanPhamChiTiet s: spctRepo.findAll()){
            if(s.getSanPham().getId() == idSP){
                list.add(new SanPhamChiTietResponse(s));
            }
        }
        return list;
    }
}
