package com.ham.spring.test.jpa.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.spring.test.jpa.domain.Company;
import com.ham.spring.test.jpa.repository.CompanyRepository;

@Service
public class CompanyService {
	
	@Autowired
	private CompanyRepository companyRepository;
	
	public Company addCompany(String name, String business, String scale, Integer headcount) {
		Company company = Company.builder()
							.name(name)
							.business(business)
							.scale(scale)
							.headcount(headcount)
							.build();
		
		company = companyRepository.save(company);
		
		return company;
	}
	
	// id와 일치하는 회사정보의 규모와 사원수를 수정하는 기능
	public Company updateCompany(int id, String scale, int headcount) {
		
		Optional<Company> optinalCompany = companyRepository.findById(id);
		Company company = optinalCompany.orElse(null);
		
		if(company != null) {
			company = company.toBuilder()
					.scale(scale)
					.headcount(headcount)
					.build();
		
			company = companyRepository.save(company);
		}
		
		return company;
	}
	
	public void deleteCompany(int id) {
		
// 		companyRepository.deleteById(id);
		Optional<Company> optionalCompany = companyRepository.findById(id);
		
//		Company company = optionalCompany.orElse(null);
//		
//		if(company != null) {
//		companyRepository.delete(company);
//		}
//  53번~56번까지 줄여서 이것을 사용할수 있음 : optionalCompany.ifPresent(company -> companyRepository.delete(company));		
		
		// 람다식
		optionalCompany.ifPresent(company -> companyRepository.delete(company)); // null일때만 companyRepository.delete(company)수행됨
	}
}
