package winwin.service;

import java.util.List;

import winwin.dto.QnaBoard;
import winwin.dto.QnaComment;
import winwin.util.Paging;

public interface QnaBoardService{

	public int totalCnt();
	
	public int getCommentCnt(QnaBoard board);
	
	public void hit(QnaBoard board);
	
	public List<QnaBoard> list(Paging paging);
	
	public QnaBoard view(QnaBoard board);
	
	public void write(QnaBoard board);
	
	public void updateBoard(QnaBoard board);
	
	public void deleteBoard(QnaBoard board);
	
	public List<QnaComment> selectCommentByBoardNo(QnaBoard board);	
	
	public void insertComment(QnaComment comment);
	
	public void deleteComment(QnaComment comment);
	
	public void deleteCommentsByBoardNo(QnaBoard board);
	
	public QnaComment getComment(QnaComment comment);
	
	public void updateBoardAsw(QnaBoard board);
	
	public void deleteBoardAsw(QnaBoard board);	
}
