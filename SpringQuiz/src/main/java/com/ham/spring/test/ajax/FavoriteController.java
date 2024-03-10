package com.ham.spring.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ham.spring.test.ajax.domain.Favorite;
import com.ham.spring.test.ajax.service.FavoriteService;

@RequestMapping("/ajax/favorite")
@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteService favoriteService;
	
	@GetMapping("/list")
	public String favoritelist(Model model) {
		
		List<Favorite> favoriteList = favoriteService.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		
		return "ajax/favorite/list";
	}
	
	@GetMapping("/input")
	public String inputFavorite(){
		return "ajax/favorite/input";
	}
	
	// 사용자 저장 API
	@PostMapping("/create") // 주소는 POST Mapping으로 해야함
	@ResponseBody
	public Map<String, String> createFavorite(
			@RequestParam("name") String name
			, @RequestParam("url") String url 
			) {
		int count = favoriteService.addFavorite(name, url);
		
		// 성공시 : {"result", "success"}
		// 실패시 : {"result", "fail"}
		
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {	// 성공
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// url 중복 확인
	@PostMapping("/duplicate-url") // 주소 PostMapping
	@ResponseBody // json문자열로 받을 수 있도록 넣어줌
	public Map<String, Boolean> isDuplicateUrl(@RequestParam("url") String url){
	
	//		boolean isDuplicate = favoriteService.isDuplicateUrl(url);
		
		Map<String, Boolean> resultMap = new HashMap<>();
	//		if(isDuplicate) {
	//			resultMap.put("isDuplicate", true);
	//		} else {
	//			resultMap.put("isDuplicate", false);
	//		}
	//		-> 이거를  resultMap.put("isDuplicate", isDuplicate);
	// 		resultMap.put("isDuplicate", favoriteService.isDuplicateUrl(url)); 이렇게 줄이면 boolean isDuplicate = favoriteService.isDuplicateUrl(url);도 안써도됌
	
			
	//		resultMap.put("isDuplicate", isDuplicate);
		resultMap.put("isDuplicate", favoriteService.isDuplicateUrl(url));
		return resultMap;
	}
	
	// 삭제 API
	@GetMapping("/delete")
	@ResponseBody
	public Map<String, String> deleteFavorite(@RequestParam("id") int id){
		int count = favoriteService.deleteFavorite(id);
		
		// response의 형태
		// 성공 : {"result" : "success"}
		// 실패 : {"result" : "fail"}
		
		Map<String, String> resultMap = new HashMap<>(); // String, String은 "result" : "success"
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
