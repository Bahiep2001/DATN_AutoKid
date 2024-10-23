package com.example.demo.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "san_pham")
public class SanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_san_pham")
    private Integer id;

    @Column(name = "ma_sp")
    private String maSP;

    @Column(name = "ten_sp")
    private String tenSP;

    @Column(name = "trang_thai_sp")
    private String trangThaiSP;

    @ManyToOne
    @JoinColumn(name = "id_loai_sp")
    private LoaiSanPham loaiSanPham;

}