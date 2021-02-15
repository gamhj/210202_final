package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.TkawyVO;

public interface TkawyMapper {

	public List<TkawyVO> getList();
	
	public List<TkawyVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);

	public void insert(TkawyVO tkawy);
	
	public TkawyVO read(String t_bno);
	
	public int delete(String t_bno);	
	
	public int update(TkawyVO tkawy);	//관리자 진행상태 수정시 사용, 일반 회원에겐 제공 XX

	public int updateDone(TkawyVO tkawy);	//관리자 진행상태 수정시 사용, 일반 회원에겐 제공 XX

	public int updateCanceled(String t_bno);	//관리자 진행상태 수정시 사용, 일반 회원에겐 제공 XX
	
	
}
