package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TkawyVO {

	private String t_bno; //수거예약번호
	private String m_num; //회원번호
	private Date t_regdate;	//예약신청일자
	private String t_contact; //연락처
	private int t_plastic; //일반 플라스틱
	private int t_plastic_cap; //플라스틱 뚜껑
	private String t_vstng_cmpny; //수거방문업체
	private String t_date_vist;	//수거방문일자
	private String t_progress; //진행상황
	
}
