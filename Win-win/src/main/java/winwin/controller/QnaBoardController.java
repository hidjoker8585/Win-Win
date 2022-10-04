package winwin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import winwin.dto.QnaBoard;
import winwin.dto.QnaComment;
import winwin.service.QnaBoardService;
import winwin.util.Paging;

@Controller
public class QnaBoardController {

	private static Logger logger
		= LoggerFactory.getLogger(QnaBoardController.class);
	
	@Autowired QnaBoardService service;
	
	@RequestMapping(value="/qna/list")
	public void list(Model m,HttpServletRequest req) {
		
		int total = service.totalCnt();
		String curr =req.getParameter("curPage");
		
		int curPage = 0;
		if( !"".equals(curr) && curr != null ) {
			curPage = Integer.parseInt(curr);
		}
		
		Paging paging = new Paging(total, curPage);
		List<QnaBoard> list = service.list(paging);
		m.addAttribute("list", list);
		m.addAttribute("paging", paging);
	}
	@RequestMapping(value="/qna/list", method=RequestMethod.POST)
	public void listProc(QnaBoard board) {
		QnaBoard resBoard = service.view(board);
		if(board.getPw().equals(resBoard.getPw())) {
			logger.info("pw 일치");
		}else {
			logger.info("pw 불일치");
			int i = 4/0; //에러 함수 호출시키기
		}
	}
	
	
	@RequestMapping(value="/qna/view", method=RequestMethod.GET)
	public void view(QnaBoard board,Model m) {
		service.hit(board);
		QnaBoard resBoard = service.view(board);
//		List<QnaComment> comments = service.selectCommentByBoardNo(board);
		m.addAttribute("board", resBoard);
//		m.addAttribute("comments", comments);
		
	}
	
	//json-lib
	@RequestMapping(value="/qna/view", method=RequestMethod.POST)
	public ModelAndView viewProc(QnaComment comment,ModelAndView mav,HttpServletResponse resp,@RequestParam("word") String word) {		
		
		//한글 폰트
		resp.setContentType("application/json;charset=utf-8");
		
		logger.info(comment.toString());
		
		if(word.equals("add")) {
			service.insertComment(comment);
		}else if(word.equals("del")) {
			service.deleteComment(comment);
		}		
		QnaBoard board = new QnaBoard();
		board.setQnaNo(comment.getQnaNo());
		List<QnaComment> list = service.selectCommentByBoardNo(board);
		int cnt = service.getCommentCnt(board); 
		
		mav.setViewName("jsonView");
		mav.addObject("comments",list);
		mav.addObject("commentCnt", cnt);
		return mav;
	}
	@RequestMapping(value="/qna/write", method=RequestMethod.GET)
	public void write() {}
	
	@RequestMapping(value="/qna/write", method=RequestMethod.POST)
	public void writeProc(QnaBoard board,HttpServletResponse resp) {
		logger.info(board.toString());
		service.write(board);
		
		resp.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('글쓰기 완료')");
			out.println("location.href='/qna/list'");
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/qna/error", method=RequestMethod.GET)
	public void error(QnaBoard board, Model m) {
		m.addAttribute("board",board);
	}
	
	
	@RequestMapping(value="/qna/delete", method=RequestMethod.GET)
	public void delete(QnaBoard board,HttpServletResponse resp) {
		service.deleteBoard(board);
//		service.deleteCommentsByBoardNo(board);
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = resp.getWriter();
			out.println("<script>");
			out.println("alert('글삭제 완료')");
			out.println("location.href='/qna/list'");
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/qna/update", method=RequestMethod.GET)
	public void update(QnaBoard board,Model m) {
		QnaBoard resBoard = service.view(board);
		m.addAttribute("board",resBoard);
	}
	
	@RequestMapping(value="/qna/update", method=RequestMethod.POST)
	public void updateProc(QnaBoard board,HttpServletResponse resp) {
		service.updateBoard(board);
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = resp.getWriter();
			out.println("<script>");
			out.println("alert('글수정 완료')");
			out.println("location.href='/qna/view?qnaNo="+board.getQnaNo()+"'");
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//json-lib
	@RequestMapping(value="/qna/asw",method=RequestMethod.POST)
	public ModelAndView writeAsw(HttpServletResponse resp,QnaBoard board,@RequestParam("word") String word) {
		//한글폰트 3
		resp.setContentType("application/json;charset=utf-8");
		
		logger.info(word);
		if(word.equals("del")) {
			service.deleteBoardAsw(board);
			logger.info("답변 내용 삭제");
		}else if(word.equals("add")) {
			logger.info(board.toString());
			service.updateBoardAsw(board);
			logger.info("답변 내용 추가");
		}
		QnaBoard resBoard = service.view(board);
		
		//한글 폰트
		resp.setContentType("application/json;charset=utf-8");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("board",resBoard);
		return mav;
	}
	
	
}
