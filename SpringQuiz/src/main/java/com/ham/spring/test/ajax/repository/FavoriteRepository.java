package com.ham.spring.test.ajax.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ham.spring.test.ajax.domain.Favorite;

@Mapper
public interface FavoriteRepository {

	public List<Favorite> selectFavoriteList();

	public int insertFavorite(
			@Param("name")String name
			,@Param("url") String url);
	
	// url 중복 여부
	// count 함수를 조회할거여서 int
	public int selectCountByUrl(@Param("url") String url);

	// 삭제
	public int deleteFavorite(@Param("id") int id);
}
