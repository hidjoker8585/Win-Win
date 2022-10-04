package winwin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import winwin.dto.Material;
import winwin.dto.NoticeBoard;
import winwin.service.NoticeBoardService;
import winwin.util.Paging;

@Controller
public class NoticeBoardController {
	
	private static Logger logger
		=LoggerFactory.getLogger(NoticeBoardController.class);
	
	@Autowired ServletContext context;
	@Autowired NoticeBoardService service;

	@RequestMapping(value="/notice/list")
	public void list(Model m,HttpServletRequest req) {		
	
		int total = service.totalCnt();
		String curr =req.getParameter("curPage");
		
		int curPage = 0;
		if( !"".equals(curr) && curr != null ) {
			curPage = Integer.parseInt(curr);
		}
		Paging paging = new Paging(total, curPage);
		List<NoticeBoard> list = service.list(paging);
		m.addAttribute("list", list);
		m.addAttribute("paging", paging);
	}
	
	@RequestMapping(value="/notice/view", method=RequestMethod.GET)
	public void view(NoticeBoard board,Model m) {
		service.hit(board);
		NoticeBoard resBoard = service.view(board);
		List<Material> files = service.filesByBoardNo(board);
		resBoard.setFilesCnt(service.getFilesCnt(board));
		m.addAttribute("board", resBoard);
		m.addAttribute("files", files);
	}
	
	@RequestMapping(value="/notice/download", method=RequestMethod.GET)
	public ModelAndView download(ModelAndView m,Material file) {
		Material downfile = service.selectFile(file);
		m.setViewName("download");
		m.addObject("downFile",downfile);
		return m;
	}
	
	@RequestMapping(value="/notice/error", method=RequestMethod.GET)
	public void error(NoticeBoard board,Model m){
		m.addAttribute("board",board);
	}
	
	@RequestMapping(value="/notice/write", method=RequestMethod.GET)
	public void write() {}
	
	@RequestMapping(value="/notice/write", method=RequestMethod.POST)
	public void writeProc(@ModelAttribute("board") NoticeBoard board,HttpServletResponse resp) {
		
		List<MultipartFile> up = board.getFiles();
		
		int noticeNo = service.getNoticeNo();
		board.setNoticeno(noticeNo);
		
		if(up.size()==1 && up.get(0).getOriginalFilename().equals("") ) {
			
			logger.info("첨부된 파일이 없을 경우");
			
			service.write(board);
		
		}else {
			
			logger.info("파일을 첨부할 경우");
			
			for (MultipartFile data : up) {
															
				String realpath = context.getRealPath("upload");				
				String uid = UUID.randomUUID().toString().split("-")[4];				
				String stored = data.getOriginalFilename()+"_"+uid;
				File dest = new File(realpath, stored);

				//파일 업로드
				try {
					data.transferTo(dest);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				//DB 업로드
				Material file = new Material();
				
				file.setFilesize(data.getSize());
				file.setNoticeNo(noticeNo);
				file.setAdminCode(board.getCode());
				file.setStoredName(stored);
				file.setOriginName(data.getOriginalFilename());
				
				service.insertFile(file);
			}
			service.write(board);
			
		}
		
		resp.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('글쓰기 완료')");
			out.println("location.href='/notice/list'");
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/notice/delete", method=RequestMethod.GET)
	public void delete(NoticeBoard board, HttpServletResponse resp) {
		//첨부파일 삭제	
		List<Material> list = service.filesByBoardNo(board);
		String path = context.getRealPath("upload");
		logger.info(path);	
		for (Material material : list) {
			String filename = material.getStoredName();
			File delFile = new File(path, filename);
			boolean res = delFile.delete();
			if(res) {
				logger.info("파일 삭제!");
			}else {
				logger.info("파일 삭제 실패!");
			}
		}
		service.deleteFilesByBoardNo(board);
		service.deleteBoard(board);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = resp.getWriter();
			out.println("<script>");
			out.println("alert('글삭제 완료')");
			out.println("location.href='/notice/list'");
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/notice/update", method=RequestMethod.GET)
	public void update(NoticeBoard board,Model m) {
		NoticeBoard resBoard = service.view(board);
		resBoard.setFilesCnt(service.getFilesCnt(board));
		List<Material> files = service.filesByBoardNo(board);
		long size=0;
		for (Material material : files) {
			size += material.getFilesize();
		}
		m.addAttribute("board", resBoard);
		m.addAttribute("size", size);
		m.addAttribute("files", files);
	}
	
	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
	public void updateProc(@ModelAttribute("board") NoticeBoard board, HttpServletResponse resp) {

		List<MultipartFile> up = board.getFiles();
		
		if(up.size()==1 && up.get(0).getOriginalFilename().equals("") ) {
			
			logger.info("첨부된 파일이 없을 경우");
			service.updateBoard(board);
		
		}else {
			
			logger.info("파일을 첨부할 경우");

			for (MultipartFile data : up) {
															
				String realpath = context.getRealPath("upload");				
				String uid = UUID.randomUUID().toString().split("-")[4];				
				String stored = data.getOriginalFilename()+"_"+uid;
				File dest = new File(realpath, stored);

				//파일 업로드
				try {
					data.transferTo(dest);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				
				//DB 업로드
				Material file = new Material();
				
				file.setFilesize(data.getSize());
				file.setNoticeNo(board.getNoticeno());
				file.setAdminCode(board.getCode());
				file.setStoredName(stored);
				file.setOriginName(data.getOriginalFilename());
				
				service.insertFile(file);
			}
			service.updateBoard(board);
		}
		resp.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('글수정 완료')");
			out.println("location.href='/notice/view?noticeno="+board.getNoticeno()+"'");
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	@RequestMapping(value="/notice/updateFile", method=RequestMethod.POST)
	public void updateFile(Material file) {
		//파일 삭제
		Material delFile = service.selectFile(file);
		String path = context.getRealPath("upload");
		String filename = delFile.getStoredName();
		File f = new File(path,filename);
		boolean res = f.delete();
		if(res) {
			logger.info("파일 삭제 완료!");
		}else {
			logger.info("파일 삭제 실패!");
		}
		//db데이터 삭제
		service.deleteFile(file);
		}
}
