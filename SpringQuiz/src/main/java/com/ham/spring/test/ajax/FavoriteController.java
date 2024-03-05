package com.ham.spring.test.ajax;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.spring.test.ajax.domain.Favorite;
import com.ham.spring.test.ajax.service.FavoriteService;

@RequestMapping("/ajax/favorite")
@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteService favoriteService;
	
	@GetMapping("/list")
	public String favoritelist(Model model) {
		
		List<Favorite> fovoriteList = favoriteService.getFavoriteList();
		model.addAttribute("favoriteList", fovoriteList);
		
		return "ajax/favorite/list";
	}
	
	@GetMapping("/input")
	public String inputFavorite(){
		return "ajax/favorite/input";
	}
	
//	@GetMapping("/create")
//	public Map<String, Object> String createFavorite(
//			@RequestParam("name") String name
//			, @RequestParam("url") String url 
//			) {
//		Map<String, Object> resultMap = new HashMap<>();
//		resultMap.put("name", name);
//		resultMap.put("url", url);
//		
//		return resultMap;
//	}
	
}
