package com.ham.spring.test.ajax.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.spring.test.ajax.domain.Booking;
import com.ham.spring.test.ajax.repository.BookingRepository;

@Service
public class BookingService {
	
	@Autowired
	private BookingRepository bookingRepository; 
	
	public List<Booking> getBookingList() {

		List<Booking> bookingList = bookingRepository.selectBookingList();
		return bookingList;
	}
	
	// 삭제
	public int deleteBooking(int id) {
		int count = bookingRepository.deleteBooking(id);
		return count;
	}
	
	// 입력
	public int addBooking(String name
			, int headcount
			, int day
			, Date date
			, String phoneNumber){
		int count = bookingRepository.insertBooking(name, headcount, day, date, phoneNumber, "대기중");
		// 여기서 직접 대기중 처리
		return count;
	}

	// 이름과 전화번호를 전달받고 일치하는 예약정보를 돌려주는 기능
	public Booking searchBooking(String nam, String phoneNumber) {
		Booking booking = bookingRepository.selectBooking(nam, phoneNumber);
		return booking;
	}

}
