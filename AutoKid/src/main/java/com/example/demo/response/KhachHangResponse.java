package com.example.demo.response;

import com.example.demo.model.KhachHang;
import lombok.Data;

@Data
public class KhachHangResponse {
    private Integer idKH;
    private String maKH;
    private String tenKH;
    private String emailKH;
    private String sdtKH;
    private String diaChiKH;
    private String diaChiNhan;

    public KhachHangResponse(KhachHang k){
        this.idKH = k.getId();
        this.maKH = k.getMaKH();
        this.tenKH = k.getTenKH();
        this.emailKH = k.getEmail();
        this.sdtKH = k.getSdt();
        this.diaChiKH = k.getDiaChi();
        this.diaChiNhan = k.getThongTinVanChuyen().getDiaChi();
    }
}
