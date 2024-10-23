package com.example.demo.model;

import jakarta.persistence.*;
import lombok.Data;

import java.sql.Date;
@Data
@Entity
@Table(name = "hoa_don")
public class HoaDon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_hd")
    private Integer id;

    @Column(name = "ma_hd")
    private String maHD;

    @ManyToOne
    @JoinColumn(name = "id_kh")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "id_nv")
    private NhanVien nhanVien;

    @ManyToOne
    @JoinColumn(name = "id_pttt")
    private PhuongThucThanhToan phuongThucThanhToan;

    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "phi_ship")
    private Float phiShip;

    @Column(name = "hinh_thuc_thanh_toan")
    private String hinhThucThanhToan;

    @Column(name = "tong_tien")
    private Float tongTien;

    @Column(name = "trang_thai_hd")
    private String trangThaiHD;
}