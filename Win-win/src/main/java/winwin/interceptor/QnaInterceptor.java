package winwin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import winwin.dto.QnaBoard;
import winwin.dto.QnaComment;
import winwin.service.QnaBoardService;

public class QnaInterceptor extends HandlerInterceptorAdapter{

	private static Logger logger
		= LoggerFactory.getLogger(QnaInterceptor.class);
	
	private @Autowired QnaBoardService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
				
		logger.info(" + + + 인터셉터 시작 + + + ");
		logger.info(request.getRequestURI());
		String uri = request.getRequestURI();
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		QnaBoard board = new QnaBoard();
		board.setQnaNo(qnaNo);

		HttpSession session = request.getSession();
		if(uri.equals("/qna/update")) {
			logger.info("update!");
			QnaBoard resBoard = service.view(board);
			if(session.getAttribute("id")!=null && session.getAttribute("id").equals(resBoard.getUserId())) {
				logger.info("update 정상");
				return true;
			}
		}
		if(uri.equals("/qna/delete")) {
			logger.info("delete!");			
			QnaBoard resBoard = service.view(board);
			if(session.getAttribute("id")!=null && session.getAttribute("id").equals(resBoard.getUserId())) {
				logger.info("delete 정상");
				return true;
			}
			if(session.getAttribute("adminLogin")!=null) {
				logger.info("delete 정상");
				return true;
			}
		}
		if(uri.equals("/qna/view")) {
			logger.info("view");
			logger.info(request.getMethod());
			if(request.getMethod().equals("GET")) {
				return true;
			}
			String word = request.getParameter("word");
			QnaBoard resBoard = service.view(board);
			
			if(word.equals("add")) {
				if(session.getAttribute("login")!=null&&String.valueOf(session.getAttribute("id")).equals(resBoard.getUserId())) 
						return true;
				if(session.getAttribute("adminLogin")!=null) return true;
			}
			if(word.equals("del")) {
				int commentNo = Integer.parseInt(request.getParameter("commentNo"));
				QnaComment comment = new QnaComment();
				comment.setCommentNo(commentNo);
				QnaComment resComment = service.getComment(comment);
				if(session.getAttribute("login")!=null&&String.valueOf(session.getAttribute("id")).equals(resComment.getId())) 
						return true;
				if(session.getAttribute("adminLogin")!=null) {
					String arr[] = resComment.getId().split("_");
					if(arr[1].equals(String.valueOf(session.getAttribute("admincode")))) return true;
				}
			}
			if(word.equals("get")) {
				return true;
			}	
		}
        response.sendRedirect("/qna/error?qnaNo="+qnaNo);
		return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
				
		logger.info(" + + + 인터셉터 종료 + + + ");
	}
}
