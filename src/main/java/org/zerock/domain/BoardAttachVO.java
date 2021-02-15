package org.zerock.domain;

import lombok.Data;

@Data
public class BoardAttachVO {

	private String qa_uuid;
	private String qa_upload_path;
	private String qa_file_name;
	private boolean qa_file_type;
	
	private Long q_bno;
}
