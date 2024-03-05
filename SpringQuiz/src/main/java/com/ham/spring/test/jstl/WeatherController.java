package com.ham.spring.test.jstl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.spring.test.jstl.domain.Weather;
import com.ham.spring.test.jstl.service.WeatherService;

@RequestMapping("/jstl/weather")
@Controller
public class WeatherController {
	
	@Autowired
	private WeatherService weatherService;
	
	@GetMapping("/list")
	public String weatherHistory( Model model) {

		List<Weather> weatherHistroy = weatherService.getWeatherHistory();
		
		model.addAttribute("weatherHistory", weatherHistroy);
		
		return "jstl/weather/list";
	}
	
	@GetMapping("/input")
	public String inputWeather() {
		
		return "jstl/weather/input";
		
	}
	
	@GetMapping("/create")
	public String createWeather(
//			Model model
//			,@DateTimeFormat(pattern="yyyy년 M월 d일") @RequestParam("date") Date date
//			 ,@RequestParam("weather") String weather
//			 ,@RequestParam("temperatures") double temperatures
//			 ,@RequestParam("precipitation") double precipitation
//			 ,@RequestParam("microDust") String microDust
//			 ,@RequestParam("windSpeed") double windSpeed
			 // 위에꺼를 한번에 표현할 수 있는것
			 @ModelAttribute Weather weather){
	
		// int count = weatherService.addWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
		
		int count = weatherService.addWeatherByObject(weather);
		return "redirect:/jstl/weather/list";
	}

}