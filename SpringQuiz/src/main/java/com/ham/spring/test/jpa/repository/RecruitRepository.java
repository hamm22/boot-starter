package com.ham.spring.test.jpa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ham.spring.test.jpa.domain.Recruit;

public interface RecruitRepository extends JpaRepository<Recruit, Integer> {
	
	// 2번 Parameter 조건 조회
	// companyId가 일치하는 행 조회
	// WHERE `companyId` = #{}
	public List<Recruit> findByCompanyId(int companyId);

	
	// 3번 복합 조건 조회
	// 웹 back-end 개발자 이고 정규직인 공고를 조회하고 아래와 같이 출력하세요.
	// position 값과 type 값이 일치하는 행 조회
	// WHERE `position` = #{} AND `type` = #{}
	public List<Recruit> findByPositionAndType(String position, String type);
	
	
	// 4번 복합 조건 조회
	// type 값이 일치하거나 salary 값이 특정 값 이상인 조건에 맞는 행 조회
	// WHERE `type` = #{} OR `salary` >= #{}
	public List<Recruit> findByTypeOrSalaryGreaterThanEqual(String type, int salary);

	
	// 5번 계약직 목록을 연봉 기준으로 내림차순 정렬해서 3개만 조회하세요.
	// SELECT * FROM `recruit` WHERE type = '계약직' ORDER BY salary DESC LIMIT 3;
	// public List<Recruit> findByTypeOrderBySalaryDesc(String type, int limit);

	 
	// 6번 성남시 분당구가 지역인 연봉 7000 이상 8500 이하인 공고를 조회하고 아래와 같이 출력하세요.
	public List<Recruit> findByRegionAndSalaryBetween(String region, int start, int end);
	
	
	// 7번 Native query
	// @Qeury(value= "SELECT * FROM `recruit` WHERE `deadline` >= '2026-04-10' AND `salary` >= '8100' AND `type` = '정규직'
	//		+ "ORDER BY `salary` desc", nativeQuery=true )
	@Query(value="SELECT * FROM `recruit` WHERE `type` = :type AND `deadline` > :date AND `salary` >= :salary ORDER BY `salary` DESC", nativeQuery=true)
    public List<Recruit> findByNativeQuery(@Param("type") String type, @Param("date") String date, @Param("salary") int salary);

}
