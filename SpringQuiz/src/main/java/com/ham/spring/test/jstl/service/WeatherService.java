package com.ham.spring.test.jstl.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.spring.test.jstl.domain.Weather;
import com.ham.spring.test.jstl.repository.WeatherRepository;

@Service
public class WeatherService {
	
	@Autowired
	private WeatherRepository weatherRepository;
	
	// 모든 날씨정보를 가져오는 기능
	public List<Weather> getWeatherHistory() {
		
		List<Weather> weatherHistroy =  weatherRepository.selectWeatherHistory();
		return weatherHistroy;
	}
	
	public int addWeather(
			Date date
			 , String weather
			 , double temperatures
			 , double precipitation
			 , String microDust
			 ,double windSpeed){
		int count = weatherRepository.insertWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
		return count;
	}
	public int addWeatherByObject(Weather weather) {
		int count = weatherRepository.insertWeatherByObject(weather);
		return count;
	};
		
}
