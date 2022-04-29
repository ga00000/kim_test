package com.open.ma.port.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

/**
 * Content VO 클래스
 * @author 공통서비스 개발팀 yd.go
 * @since 2016.09.08
 * @version 1.0
 * @see
 *  
 
 */
@Alias("portVO")
public class PortVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private String ptSeq;
	private String ptTitle;
	private String ptCont;
	private String ptRgstDt;
	private String ptRgstId;
	private String ptRvseDt;
	private String ptRvseId;
	private String ptUseYn;
	private String ptAtchFileId;
	private String ptAtchFileYn;
	private String ptSelect;



	public String getPtSeq() {
		return ptSeq;
	}
	public void setPtSeq(String ptSeq) {
		this.ptSeq = ptSeq;
	}
	public String getPtTitle() {
		return ptTitle;
	}
	public void setPtTitle(String ptTitle) {
		this.ptTitle = ptTitle;
	}
	public String getPtCont() {
		return ptCont;
	}
	public void setPtCont(String ptCont) {
		this.ptCont = ptCont;
	}
	public String getPtRgstDt() {
		return ptRgstDt;
	}
	public void setPtRgstDt(String ptRgstDt) {
		this.ptRgstDt = ptRgstDt;
	}
	public String getPtRgstId() {
		return ptRgstId;
	}
	public void setPtRgstId(String ptRgstId) {
		this.ptRgstId = ptRgstId;
	}
	public String getPtRvseDt() {
		return ptRvseDt;
	}
	public void setPtRvseDt(String ptRvseDt) {
		this.ptRvseDt = ptRvseDt;
	}
	public String getPtRvseId() {
		return ptRvseId;
	}
	public void setPtRvseId(String ptRvseId) {
		this.ptRvseId = ptRvseId;
	}
	public String getPtUseYn() {
		return ptUseYn;
	}
	public void setPtUseYn(String ptUseYn) {
		this.ptUseYn = ptUseYn;
	}
	public String getPtAtchFileId() {
		return ptAtchFileId;
	}
	public void setPtAtchFileId(String ptAtchFileId) {
		this.ptAtchFileId = ptAtchFileId;
	}
	public String getPtAtchFileYn() {
		return ptAtchFileYn;
	}
	public void setPtAtchFileYn(String ptAtchFileYn) {
		this.ptAtchFileYn = ptAtchFileYn;
	}
	public String getPtSelect() {
		return ptSelect;
	}
	public void setPtSelect(String ptSelect) {
		this.ptSelect = ptSelect;
	}
	
	
	
	
	
	
	
	
}