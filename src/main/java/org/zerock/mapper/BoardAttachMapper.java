package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);
	
	public void delete(String qa_uuid);
	
	public List<BoardAttachVO> findByBno(Long q_bno);
	
	public void deleteAll(Long q_bno);
	
}
