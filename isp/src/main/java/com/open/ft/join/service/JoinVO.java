package com.open.ft.join.service;

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
@Alias("joinVO")
public class JoinVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	private String ftSeq;
	private String ftId;
	private String ftPwd;
	private String ftName;
	private String ftUseYn;
	private String ftRgstId;
	private String ftRgstDt;
	private String ftModId;
	private String ftModDate;
	private String ftEmail;
	private String ftHp;
	private String ftAtchFileId;



	public String getFtSeq() {
		return ftSeq;
	}
	public void setFtSeq(String ftSeq) {
		this.ftSeq = ftSeq;
	}
	public String getFtId() {
		return ftId;
	}
	public void setFtId(String ftId) {
		this.ftId = ftId;
	}
	public String getFtPwd() {
		return ftPwd;
	}
	public void setFtPwd(String ftPwd) {
		this.ftPwd = ftPwd;
	}
	public String getFtName() {
		return ftName;
	}
	public void setFtName(String ftName) {
		this.ftName = ftName;
	}
	public String getFtUseYn() {
		return ftUseYn;
	}
	public void setFtUseYn(String ftUseYn) {
		this.ftUseYn = ftUseYn;
	}
	public String getFtRgstId() {
		return ftRgstId;
	}
	public void setFtRgstId(String ftRgstId) {
		this.ftRgstId = ftRgstId;
	}
	public String getFtRgstDt() {
		return ftRgstDt;
	}
	public void setFtRgstDt(String ftRgstDt) {
		this.ftRgstDt = ftRgstDt;
	}
	public String getFtModId() {
		return ftModId;
	}
	public void setFtModId(String ftModId) {
		this.ftModId = ftModId;
	}
	public String getFtModDate() {
		return ftModDate;
	}
	public void setFtModDate(String ftModDate) {
		this.ftModDate = ftModDate;
	}
	public String getFtEmail() {
		return ftEmail;
	}
	public void setFtEmail(String ftEmail) {
		this.ftEmail = ftEmail;
	}
	public String getFtHp() {
		return ftHp;
	}
	public void setFtHp(String ftHp) {
		this.ftHp = ftHp;
	}
	public String getFtAtchFileId() {
		return ftAtchFileId;
	}
	public void setFtAtchFileId(String ftAtchFileId) {
		this.ftAtchFileId = ftAtchFileId;
	}
	
	
	
	
	
	
	
}