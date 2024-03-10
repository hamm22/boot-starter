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
import org.springframework.web.bind.annotation.PostMapping;
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
	@ResponseBody
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
	

	@GetMapping("/select")
	@ResponseBody
	public Map<String, String> selectBookingList(@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		int count = bookingService.inquiryBooking(name, phoneNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
		
	}

	
	
	
	
}
