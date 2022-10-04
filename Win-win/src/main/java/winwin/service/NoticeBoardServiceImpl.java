package winwin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import winwin.dao.NoticeBoardDao;
import winwin.dto.Material;
import winwin.dto.NoticeBoard;
import winwin.util.Paging;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{

	@Autowired NoticeBoardDao dao;
	
	@Override
	public int totalCnt() {
		return dao.totalCnt();
	}
	@Override
	public List<NoticeBoard> list(Paging paging) {
		return dao.list(paging);
	}
	@Override
	public NoticeBoard view(NoticeBoard board) {
		return dao.view(board);
	}
	@Override
	public void write(NoticeBoard board) {
		dao.write(board);
	}
	@Override
	public void updateBoard(NoticeBoard board) {
		dao.updateBoard(board);
	}
	@Override
	public void deleteBoard(NoticeBoard board) {
		dao.deleteBoard(board);
	}
	@Override
	public void insertFile(Material file) {
		dao.insertFile(file);
	}
	@Override
	public void deleteFile(Material file) {
		dao.deleteFile(file);
	}
	@Override
	public List<Material> filesByBoardNo(NoticeBoard board) {
		return dao.filesByBoardNo(board);
	}
	@Override
	public Material selectFile(Material file) {
		return dao.selectFile(file);
	}
	@Override
	public void deleteFilesByBoardNo(NoticeBoard board) {
		dao.deleteFilesByBoardNo(board);
	}
	@Override
	public int getNoticeNo() {
		return dao.getNoticeNo();
	}
	@Override
	public int getFilesCnt(NoticeBoard board) {
		return dao.getFilesCnt(board);
	}
	@Override
	public void hit(NoticeBoard board) {
		dao.hit(board);
	}
}
