package com.ham.spring.test.ajax.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.spring.test.ajax.domain.Favorite;
import com.ham.spring.test.ajax.repository.FavoriteRepository;

@Service
public class FavoriteService {
	
	@Autowired
	private FavoriteRepository favoriteRepository;
	
	public List<Favorite> getFavoriteList(){
		List<Favorite> favoriteList = favoriteRepository.selectFavoriteList();
		return favoriteList;
	}
	
	public int addFavorite(
		String name
		, String url){
		
		int count = favoriteRepository.insertFavorite(name, url);
		return count;
	}
	
	// url 중복 여부
	
	public boolean isDuplicateUrl(String url){
		int count = favoriteRepository.selectCountByUrl(url);

//		if(count >= 1) {
//			return true;
//		} else {
//			return false;
//		}
		
		return count >= 1; // 위에꺼를 이렇게 줄일 수 있음
	}
	
	// 삭제
	
	public int deleteFavorite(int id){ // 돌려줄 값이 없기때문에
		int count = favoriteRepository.deleteFavorite(id);
		return count;
	}
}
