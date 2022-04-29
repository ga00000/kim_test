package com.open.ma.banner.service;

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
@Alias("bannerVO")
public class BannerVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	private String baSeq;
	private String baTitle;
	private String baCont;
	private String baRgstDt;
	private String baRgstId;
	private String baRvseDt;
	private String baRvseId;
	private String baUseYn;
	private String baAtchFileId;
	private String baAtchFileYn;
	private String baWindowYn;


	public String getBaSeq() {
		return baSeq;
	}
	public void setBaSeq(String baSeq) {
		this.baSeq = baSeq;
	}
	public String getBaTitle() {
		return baTitle;
	}
	public void setBaTitle(String baTitle) {
		this.baTitle = baTitle;
	}
	public String getBaCont() {
		return baCont;
	}
	public void setBaCont(String baCont) {
		this.baCont = baCont;
	}
	public String getBaRgstDt() {
		return baRgstDt;
	}
	public void setBaRgstDt(String baRgstDt) {
		this.baRgstDt = baRgstDt;
	}
	public String getBaRgstId() {
		return baRgstId;
	}
	public void setBaRgstId(String baRgstId) {
		this.baRgstId = baRgstId;
	}
	public String getBaRvseDt() {
		return baRvseDt;
	}
	public void setBaRvseDt(String baRvseDt) {
		this.baRvseDt = baRvseDt;
	}
	public String getBaRvseId() {
		return baRvseId;
	}
	public void setBaRvseId(String baRvseId) {
		this.baRvseId = baRvseId;
	}
	public String getBaUseYn() {
		return baUseYn;
	}
	public void setBaUseYn(String baUseYn) {
		this.baUseYn = baUseYn;
	}
	public String getBaAtchFileId() {
		return baAtchFileId;
	}
	public void setBaAtchFileId(String baAtchFileId) {
		this.baAtchFileId = baAtchFileId;
	}
	public String getBaAtchFileYn() {
		return baAtchFileYn;
	}
	public void setBaAtchFileYn(String baAtchFileYn) {
		this.baAtchFileYn = baAtchFileYn;
	}
	public String getBaWindowYn() {
		return baWindowYn;
	}
	public void setBaWindowYn(String baWindowYn) {
		this.baWindowYn = baWindowYn;
	}
	
	
	
	
	
	
}