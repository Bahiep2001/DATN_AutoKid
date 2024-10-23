package com.example.demo.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Entity
@Data
@Table(name = "khuyen_mai")
public class KhuyenMai {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_khuyen_mai")
    private Long id;

    @Column(name = "ma_km")
    private String maKM;

    @Column(name = "ten_km")
    private String tenKM;

    @Column(name = "muc_giam_gia")
    private Double mucGiamGia;

    @Column(name = "dieu_kien")
    private String dieuKien;

    @Column(name = "ngay_bat_dau")
    private LocalDate ngayBatDau;

    @Column(name = "ngay_ket_thuc")
    private LocalDate ngayKetThuc;

    @Column(name = "kieu_giam_gia")
    private String kieuGiamGia;

    @Column(name = "so_luong")
    private int soLuong;

    @Column(name = "trang_thai_km")
    private String trangThaiKM;

    @ManyToOne
    @JoinColumn(name = "id_hd")
    private HoaDon hoaDon;

}