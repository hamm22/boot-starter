package com.ham.spring.test.ajax.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ham.spring.test.ajax.domain.Booking;

@Mapper
public interface BookingRepository {
	
	public List<Booking> selectBookingList();
	
	// 삭제
	public int deleteBooking(@Param("id") int id);
	
	// 입력
	public int insertBooking(@Param("name") String name
				, @Param("headcount") int headcount
				, @Param("day") int day
				, @Param("date") Date date
				, @Param("phoneNumber") String phoneNumber
				, @Param("state") String state); // state 빼도 되고 넣어도됌
	
	// 조회
	// 한행에 대한 조회 -> entity를 통해가져옴
	// 여러행일 때는 list
	public Booking selectBooking(@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);

}
