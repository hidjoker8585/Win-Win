package winwin.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/apply")
public class LicenseAPIController {

	private static final Logger logger = LoggerFactory.getLogger(LicenseAPIController.class);
	
	@RequestMapping(value="/licenseAPI", method=RequestMethod.GET)
	public void apitest() {
		
	}
	
	@RequestMapping(value="/licenseAPI", method=RequestMethod.POST)
	public ModelAndView apitestResult(HttpServletResponse resp)  throws IOException {
		resp.setContentType("application/json; charset=utf-8");
		
        StringBuilder urlBuilder = new StringBuilder("http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=0jXve%2F38vR4EJRJ6fcfcacZRqDvh6LLpptc0s1qxI2kfOv1OYhKQtOC3nDvADDTUq4Ru05GgRXmZzQUTxvAaqQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&_type=json");
        URL url = new URL(urlBuilder.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        conn.disconnect();
        
        String result = sb.toString();
     
        ModelAndView mav = new ModelAndView();
        mav.setViewName("jsonView");
        mav.addObject("data", result);

		return mav;
	}
}
