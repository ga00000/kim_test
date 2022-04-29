package com.open.ma.require.service;

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
@Alias("requireVO")
public class RequireVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private String reSeq;
	private String reTitle;
	private String reCont;
	private String reRgstDt;
	private String reRgstId;
	private String maCont;
	private String maRgstDt;
	private String maRgstId;
	private String reRvseDt;
	private String reRvseId;
	private String reUseYn;
	private String reAtchFileId;
	private String reAtchFileYn;
	private String reSelect;
	private String reSecretYn;
	private String reSecretPw;



	public String getReSeq() {
		return reSeq;
	}
	public void setReSeq(String reSeq) {
		this.reSeq = reSeq;
	}
	public String getReTitle() {
		return reTitle;
	}
	public void setReTitle(String reTitle) {
		this.reTitle = reTitle;
	}
	public String getReCont() {
		return reCont;
	}
	public void setReCont(String reCont) {
		this.reCont = reCont;
	}
	public String getReRgstDt() {
		return reRgstDt;
	}
	public void setReRgstDt(String reRgstDt) {
		this.reRgstDt = reRgstDt;
	}
	public String getReRgstId() {
		return reRgstId;
	}
	public void setReRgstId(String reRgstId) {
		this.reRgstId = reRgstId;
	}
	public String getMaCont() {
		return maCont;
	}
	public void setMaCont(String maCont) {
		this.maCont = maCont;
	}
	public String getMaRgstDt() {
		return maRgstDt;
	}
	public void setMaRgstDt(String maRgstDt) {
		this.maRgstDt = maRgstDt;
	}
	public String getMaRgstId() {
		return maRgstId;
	}
	public void setMaRgstId(String maRgstId) {
		this.maRgstId = maRgstId;
	}
	public String getReRvseDt() {
		return reRvseDt;
	}
	public void setReRvseDt(String reRvseDt) {
		this.reRvseDt = reRvseDt;
	}
	public String getReRvseId() {
		return reRvseId;
	}
	public void setReRvseId(String reRvseId) {
		this.reRvseId = reRvseId;
	}
	public String getReUseYn() {
		return reUseYn;
	}
	public void setReUseYn(String reUseYn) {
		this.reUseYn = reUseYn;
	}
	public String getReAtchFileId() {
		return reAtchFileId;
	}
	public void setReAtchFileId(String reAtchFileId) {
		this.reAtchFileId = reAtchFileId;
	}
	public String getReAtchFileYn() {
		return reAtchFileYn;
	}
	public void setReAtchFileYn(String reAtchFileYn) {
		this.reAtchFileYn = reAtchFileYn;
	}
	public String getReSelect() {
		return reSelect;
	}
	public void setReSelect(String reSelect) {
		this.reSelect = reSelect;
	}
	public String getReSecretYn() {
		return reSecretYn;
	}
	public void setReSecretYn(String reSecretYn) {
		this.reSecretYn = reSecretYn;
	}
	public String getReSecretPw() {
		return reSecretPw;
	}
	public void setReSecretPw(String reSecretPw) {
		this.reSecretPw = reSecretPw;
	}
	
	
	
	
	
	
	
	
}