package com.ham.spring.test.mybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.spring.test.mybatis.domain.RealEstate;
import com.ham.spring.test.mybatis.repository.RealEstateRepository;

@Service
public class RealEstateService {
	
	@Autowired
	private RealEstateRepository realEstateRepository;
	
	public RealEstate getRealEstate(int id) {
		RealEstate realEstate = realEstateRepository.selectRealEstate(id);
		return realEstate;
	}
	
	
	public List<RealEstate> getRealEstateByRentPrice(int rentPrice) {
		List<RealEstate> realEstateList = realEstateRepository.selectRealEstateByRentPrice(rentPrice);
		
		return realEstateList;
	}
	
	public List<RealEstate> getRealEstateByAreaAndPrice(int area, int price) {
		List<RealEstate> realEstateList = realEstateRepository.selectRealEstateByAreaAndPrice(area, price);
		
		return realEstateList;
	}
	
	public int addRealEstateByObject(RealEstate realEstate) {
		int count = realEstateRepository.insertRealEstateByObject(realEstate);
		return count;
	}
	
	

}