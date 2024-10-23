package com.example.demo.response;

import com.example.demo.model.SanPhamChiTiet;
import lombok.Data;

import java.text.NumberFormat;
import java.util.Locale;

@Data
public class SanPhamChiTietResponse {
    private Integer idSPCT;
    private String maSPCT;
    private String tenSPCT;
    private String loaiSanPham;
    private String chatLieu;
    private String mauSac;
    private String kichCo;
    private String thuongHieu;
    private Integer soLuong;
    private String donGia;
    private String anh;
    private String moTa;
    private String trangThai;

    public SanPhamChiTietResponse(SanPhamChiTiet s){
        this.idSPCT = s.getId();
        this.maSPCT = s.getMaSPCT();
        this.tenSPCT = s.getSanPham().getTenSP();
        this.loaiSanPham = s.getSanPham().getLoaiSanPham().getTenLoai();
        this.chatLieu = s.getChatLieu().getTenCl();
        this.mauSac = s.getMauSac().getTenMS();
        this.kichCo = s.getKichCo().getTenKC();
        this.thuongHieu = s.getThuongHieu().getTenTH();
        this.soLuong = s.getSoLuong();
        this.donGia = NumberFormat.getNumberInstance(new Locale("vi","VN")).format(s.getDonGia());
        this.anh = s.getAnh();
        this.moTa = s.getMoTa();
        this.trangThai = s.getTrangThaiSPCT();
    }
}
