package winwin.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import winwin.dto.Material;

public class DownloadView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Material file = (Material)model.get("downFile");
		
		//이진데이터를 표현하는 MIME-TYPE
		response.setContentType("application/octet-stream");
		
		//파일크기 지정(스트림 전송량 지정)
		response.setContentLength((int)file.getFilesize());
		
		//UTF-8 인코딩해서 문자열 저장
		String filename
			= URLEncoder.encode(file.getOriginName(), "utf-8");
		
		//UTF-8의 오류 수정
		filename = filename.replace("+", "%20");
		filename = filename.replace("%5B", "[");
		filename = filename.replace("%5D", "]");
		
		filename = filename.replace("%21", "!");
		filename = filename.replace("%23", "#");
		filename = filename.replace("%24", "$");
		filename = filename.replace("%25", "%");
		filename = filename.replace("%26", "&");
		filename = filename.replace("%27", "'");
		filename = filename.replace("%28", "(");
		filename = filename.replace("%29", ")");
		filename = filename.replace("%2B", "+");
		filename = filename.replace("%5C", ",");
		
		filename = filename.replace("%40", "@");
		filename = filename.replace("%5E", "^");
			
		//헤더 설정
		// 저장위치 설정
		response.setHeader("Content-Disposition"
				, "attachment; filename=\""+filename+"\"");
		
		// 서버의 File -> FileInputStream
		// FileInputStream -> response OutputStream
		FileInputStream fis = null;
		
		// 서버 저장 path 찾기
		ServletContext context = request.getSession().getServletContext();
		String path = context.getRealPath("upload");
		
		// 서버에 저장된 파일 객체 생성
		File origin = new File(path, file.getStoredName());
		
		System.out.println(origin);
		
		// 서버의 파일 스트림
		fis = new FileInputStream(origin);
		
		// 서버의 출력 스트림(클라이언트)
		OutputStream out = response.getOutputStream();
		
		// 서버파일 -> 클라이언트 복사
		FileCopyUtils.copy(fis, out);
		
		// 출력스트림 버퍼 비우기
		out.flush();
		out.close();
		fis.close();
	
	}
}
