package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String m_num;	//회원번호
	private Date m_regdate; //가입일
	private String m_email; //이메일(ID)
	private String m_password;
	private String m_name;
	private String m_ncnm;	//닉네임
	private String m_contact;	//연락처
	private String m_birth;	//생년월일
	private String m_type;	//회원가입유형
	private int m_point;	//포인트 (default 0)
}
