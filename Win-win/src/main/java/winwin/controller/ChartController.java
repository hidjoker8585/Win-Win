package winwin.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import winwin.service.ChartService;

@Controller
public class ChartController {

	private static Logger logger;
	
	@Autowired ChartService service;
	
	@RequestMapping(value="/admin/chart")
	public void chart(Model m,Map<String,Integer> map) {
		map.put("age20e", service.ages20Cho());
		map.put("age20l", service.ages20Hu());
		map.put("age30s", service.ages30s());
		map.put("age40s", service.ages40s());
		map.put("eduno", service.eduno());
		map.put("eduhigh", service.eduHigh());
		map.put("educoll", service.eduColl());
		map.put("eduuniv", service.eduUniv());
		map.put("edumd", service.eduMD());
		map.put("sec18", service.second_18());
		
		m.addAttribute("map",map);
	}
}
