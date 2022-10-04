package winwin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import winwin.dao.QnaBoardDao;
import winwin.dto.QnaBoard;
import winwin.dto.QnaComment;
import winwin.util.Paging;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{

	@Autowired QnaBoardDao dao;
	
	@Override
	public int totalCnt() {
		return dao.totalCnt();
	}
	@Override
	public List<QnaBoard> list(Paging paging) {
		return dao.list(paging);
	}
	@Override
	public void hit(QnaBoard board) {
		dao.hit(board);		
	}
	@Override
	public QnaBoard view(QnaBoard board) {
		return dao.view(board);
	}

	@Override
	public void write(QnaBoard board) {
		dao.write(board);
	}

	@Override
	public void updateBoard(QnaBoard board) {
		dao.updateBoard(board);
	}
	@Override
	public void deleteBoard(QnaBoard board) {
		dao.deleteBoard(board);
	}
	@Override
	public List<QnaComment> selectCommentByBoardNo(QnaBoard board) {
		return dao.selectCommentByBoardNo(board);
	}
	@Override
	public void insertComment(QnaComment comment) {
		dao.insertComment(comment);
	}
	@Override
	public void deleteComment(QnaComment comment) {
		dao.deleteComment(comment);
	}
	@Override
	public void deleteCommentsByBoardNo(QnaBoard board) {
		dao.deleteCommentsByBoardNo(board);
	}
	@Override
	public void updateBoardAsw(QnaBoard board) {
		dao.updateBoardAsw(board);
	}
	@Override
	public void deleteBoardAsw(QnaBoard board) {
		dao.deleteBoardAsw(board);		
	}
	@Override
	public int getCommentCnt(QnaBoard board) {
		return dao.getCommentCnt(board);
	}
	@Override
	public QnaComment getComment(QnaComment comment) {
		return dao.getComment(comment);
	}
}
