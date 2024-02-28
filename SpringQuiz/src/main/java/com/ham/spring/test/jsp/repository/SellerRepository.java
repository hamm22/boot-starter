package com.ham.spring.test.jsp.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ham.spring.test.jsp.domain.Seller;

@Mapper
public interface SellerRepository {
	
	public int insertSeller(
			@Param("nickname") String nickname
			, @Param("temperature") double temperature
			, @Param("profileImage") String profileImage);
	
	public Seller selectLastSeller();
	
	public Seller selectSeller(@Param("id") int id);
}