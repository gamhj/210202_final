package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.TkawyVO;
import org.zerock.mapper.TkawyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class TkawyServiceImpl implements TkawyService {

	// spring 4.3 이상에서 자동 처리
	private TkawyMapper tkawy_mapper;

	@Override
	public void register(TkawyVO tkawy) {
		log.info("register......" + tkawy);

		tkawy_mapper.insert(tkawy);

	}

	@Override
	public boolean remove(String t_bno) {

		log.info("remove...." + t_bno);

		return tkawy_mapper.delete(t_bno) == 1;
	}

//	@Override
//	public List<TkawyVO> getList() {
//
//		log.info("getList.........");
//
//		return tkawy_mapper.getList();
//	}
	

	@Override
	public boolean modify(TkawyVO tkawy) {

		log.info("modify........." + tkawy);

		return tkawy_mapper.update(tkawy) == 1;
	}

	@Override
	public TkawyVO get(String t_bno) {

		log.info("get........" + t_bno);

		return tkawy_mapper.read(t_bno);
	}

	@Override
	public boolean modifyDone(TkawyVO tkawy) {

		log.info("modifyDone...." + tkawy);

		return tkawy_mapper.updateDone(tkawy) == 1;
	}

	@Override
	public boolean modifyCanceled(String t_bno) {
		log.info("modifyCanceled...." + t_bno);

		return tkawy_mapper.updateCanceled(t_bno) == 1;
	}

	@Override
	public List<TkawyVO> getList(Criteria cri) {

		log.info("get List with criteria: " + cri);
		
		return tkawy_mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return tkawy_mapper.getTotalCount(cri);
	}


}
