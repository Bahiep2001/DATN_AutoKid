package com.example.demo.repository;

import com.example.demo.model.KhachHang;
import com.example.demo.response.KhachHangResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KhachHangRepo extends JpaRepository<KhachHang,Integer> {
    // search
    @Query("SELECT k  FROM KhachHang k " +
            "WHERE k.tenKH LIKE %:ten% ")
    List<KhachHang> findByName(@Param("ten") String ten);

    //phân trang
    @Query("SELECT new com.example.demo.response.KhachHangResponse(k) FROM KhachHang k")
    Page<KhachHangResponse> findAllKHResponse(Pageable pageable);

    Page<KhachHang> findAllByTenKH(Pageable pageable, String tenKH);
}
