package com.ham.spring.test.ajax;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ham.spring.test.ajax.domain.Booking;
import com.ham.spring.test.ajax.service.BookingService;

@RequestMapping("/ajax/booking")
@Controller
public class BookingController {
	
	@Autowired
	private BookingService bookingService;
	
	@GetMapping("/main")
	public String main(Model model) {
		
		return "ajax/booking/main";
	} 
	
	// 리스트 페이지
	@GetMapping("/list")
	public String bookinglist(Model model) {
	
		List<Booking> bookingList = bookingService.getBookingList();
		model.addAttribute("bookingList", bookingList);
		return "ajax/booking/list";
	}
	
	// 삭제 API
	@GetMapping("/delete")
	@ResponseBody
	public Map<String, String> deleteBooking(@RequestParam("id") int id){
		int count = bookingService.deleteBooking(id);
		
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
		
	}
	
	// 입력 페이지
	@GetMapping("/input")
	public String inputBooking() {
		return "ajax/booking/input";
	}
	
	// 사용자 입력 API
	@GetMapping("/create")
	@ResponseBody // 없으면 jsp로 감, api로 가려면 있어야함
	public Map<String, String> createBooking(@RequestParam("name") String name
			, @RequestParam("headcount") int headcount
			, @RequestParam("day") int day
			, @DateTimeFormat(pattern="yyyy년 M월 d일") @RequestParam("date") Date date
			, @RequestParam("phoneNumber") String phoneNumber){
		
		int count = bookingService.addBooking(name, headcount, day, date, phoneNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	// 이름과 전화번호를 전달받고, 대응되는 예약 정보를 Response에 담는다.
	// API는 jsp와 상관없이 예약정보만 가져옴
	
//	@GetMapping("/search")
//	@ResponseBody
//	public Map<String, Object> searchBooking(@RequestParam("name") String name
//			, @RequestParam("phoneNumber") String phoneNumber) {
//		
//		Booking booking = bookingService.searchBooking(name, phoneNumber);
//	// 조회 결과가 있는 경우 : {"result" : "successs" , "booking":(엔터티 객체 불러옴)}
//	// 조회 결과가 없는 경우 : {"result" : "fail"}
//		// value 차입 정확하지 않으면 object
//		Map<String, Object> resultMap = new HashMap<>();
//		if(booking != null) {
//			resultMap.put("result", "success");
//			resultMap.put("booking", booking);
//		} else {
//			resultMap.put("result", "fail");
//		}
//		
//		// return booking; // 이렇게 하면  booking 키를 사용할 수 있음 엔터티 객체가 리턴
//		return resultMap;
//		
//	}
	
	
	// 예약조회 API
	// 이름과 전화번호를 전달받고, 대응되는 예약 정보를 Response에 담는다.
	@GetMapping("/search")
	@ResponseBody
	public Map<String, Object> searchBooking(@RequestParam("name") String name
					, @RequestParam("phoneNumber") String phoneNumber){
		
		Booking booking = bookingService.searchBooking(name, phoneNumber);

		// 조회 결과가 있는경우 : {"result" : "success", booking : {"id":2,"name":"김종국","headcount":4,"day":1,"date":"2025-08-03T15:00:00.000+00:00","phoneNumber":"010-1212-2121","state":"확정","createdAt":"2024-02-20T07:40:09.000+00:00","updatedAt":"2024-02-20T07:40:09.000+00:00"}	
		
		// 조회 결과가 없는 경우 : {"result" : "fail"} 
		// {"id":2,"name":"김종국","headcount":4,"day":1,"date":"2025-08-03T15:00:00.000+00:00","phoneNumber":"010-1212-2121","state":"확정","createdAt":"2024-02-20T07:40:09.000+00:00","updatedAt":"2024-02-20T07:40:09.000+00:00"}	
		
		Map<String, Object> resultMap = new HashMap<>();
		if(booking != null) {
			resultMap.put("result", "successs");
			resultMap.put("booking", booking);
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
}
