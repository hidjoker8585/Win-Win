package winwin.service;

import java.util.List;

import winwin.dto.Material;
import winwin.dto.NoticeBoard;
import winwin.util.Paging;

public interface NoticeBoardService {

	public int totalCnt();
		
	public List<NoticeBoard> list(Paging paging);
	
	public void hit(NoticeBoard board);
	
	public NoticeBoard view(NoticeBoard board);
	
	public int getNoticeNo();
	
	public int getFilesCnt(NoticeBoard board);
	
	public void write(NoticeBoard board);
	
	public void updateBoard(NoticeBoard board);
	
	public void deleteBoard(NoticeBoard board);
	
	public void insertFile(Material file);
	
	public void deleteFile(Material file);
	
	public void deleteFilesByBoardNo(NoticeBoard board);
	
	public Material selectFile(Material file);
	
	public List<Material> filesByBoardNo(NoticeBoard board);
	
}
