package com.ham.spring.test.jpa;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ham.spring.test.jpa.domain.Recruit;
import com.ham.spring.test.jpa.repository.RecruitRepository;

@RequestMapping("/jpa/recruit")
@Controller
public class RecruitController {

	@Autowired
	private RecruitRepository recruitRepository;

	@GetMapping("/1")
	@ResponseBody
	public Recruit jpaTest01() {
		Optional<Recruit> optionalRecruit = recruitRepository.findById(8);
		Recruit recruit = optionalRecruit.orElse(null);
		
		return recruit;
	}
	
	@GetMapping("/2")
	@ResponseBody
	public List<Recruit> jpaTest02(@RequestParam("companyId") int companyId) {
		List<Recruit> recruitList = recruitRepository.findByCompanyId(companyId);
		return recruitList;
	}
	
	@GetMapping("/3")
	@ResponseBody
	public List<Recruit> jpaTest03() {
		// 웹 back-end 개발자 이고 정규직인 공고를 조회
		List<Recruit> recruitList = recruitRepository.findByPositionAndType("웹 back-end 개발자", "정규직");
		
		return recruitList;
	}
	
	@GetMapping("/4")
	@ResponseBody
	public List<Recruit> jpaTest04() {
		List<Recruit> recruitList = null;
		// 정규직이거나 연봉이 9000 이상인 공고를 조회
		recruitList = recruitRepository.findByTypeOrSalaryGreaterThanEqual("정규직", 9000);
		
		return recruitList;
	}
	
//	@GetMapping("/5")
//	@ResponseBody
//	public List<Recruit> jpaTest05() {
//		List<Recruit> recruitList = null;
//		recruitList = recruitRepository.findByTypeOrderBySalaryDesc("계약직", 3);
//		return recruitList;
//	
//	}
	
	@GetMapping("/6")
	@ResponseBody
	public List<Recruit> jpaTest06() {
		return recruitRepository.findByRegionAndSalaryBetween("성남시 분당구", 7000, 8500);
	}
	
	@GetMapping("/7")
	@ResponseBody
	public List<Recruit> jpaTest07() {
		List<Recruit> recruitList = null;
		recruitList =  recruitRepository.findByNativeQuery("정규직", "2026-04-10", 8100);
		return recruitList;
	}
	
}
