package com.open.ma.mainMa.service;

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
@Alias("mainMaVO")
public class MainMaVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	private String mmSeq;
	private String mmTitle;
	private String mmCont;
	private String mmRgstDt;
	private String mmRgstId;
	private String mmRvseDt;
	private String mmRvseId;
	private String mmUseYn;
	private String mmAtchFileId;
	private String mmAtchFileYn;
	private String mmRepresent;
	private String mmAddress;
	private String mmHpNum;
	private String mmHp;
	private String mmMail;
	private String mmFax;



	public String getMmSeq() {
		return mmSeq;
	}
	public void setMmSeq(String mmSeq) {
		this.mmSeq = mmSeq;
	}
	public String getMmTitle() {
		return mmTitle;
	}
	public void setMmTitle(String mmTitle) {
		this.mmTitle = mmTitle;
	}
	public String getMmCont() {
		return mmCont;
	}
	public void setMmCont(String mmCont) {
		this.mmCont = mmCont;
	}
	public String getMmRgstDt() {
		return mmRgstDt;
	}
	public void setMmRgstDt(String mmRgstDt) {
		this.mmRgstDt = mmRgstDt;
	}
	public String getMmRgstId() {
		return mmRgstId;
	}
	public void setMmRgstId(String mmRgstId) {
		this.mmRgstId = mmRgstId;
	}
	public String getMmRvseDt() {
		return mmRvseDt;
	}
	public void setMmRvseDt(String mmRvseDt) {
		this.mmRvseDt = mmRvseDt;
	}
	public String getMmRvseId() {
		return mmRvseId;
	}
	public void setMmRvseId(String mmRvseId) {
		this.mmRvseId = mmRvseId;
	}
	public String getMmUseYn() {
		return mmUseYn;
	}
	public void setMmUseYn(String mmUseYn) {
		this.mmUseYn = mmUseYn;
	}
	public String getMmAtchFileId() {
		return mmAtchFileId;
	}
	public void setMmAtchFileId(String mmAtchFileId) {
		this.mmAtchFileId = mmAtchFileId;
	}
	public String getMmAtchFileYn() {
		return mmAtchFileYn;
	}
	public void setMmAtchFileYn(String mmAtchFileYn) {
		this.mmAtchFileYn = mmAtchFileYn;
	}
	public String getMmRepresent() {
		return mmRepresent;
	}
	public void setMmRepresent(String mmRepresent) {
		this.mmRepresent = mmRepresent;
	}
	public String getMmAddress() {
		return mmAddress;
	}
	public void setMmAddress(String mmAddress) {
		this.mmAddress = mmAddress;
	}
	public String getMmHpNum() {
		return mmHpNum;
	}
	public void setMmHpNum(String mmHpNum) {
		this.mmHpNum = mmHpNum;
	}
	public String getMmHp() {
		return mmHp;
	}
	public void setMmHp(String mmHp) {
		this.mmHp = mmHp;
	}
	public String getMmMail() {
		return mmMail;
	}
	public void setMmMail(String mmMail) {
		this.mmMail = mmMail;
	}
	public String getMmFax() {
		return mmFax;
	}
	public void setMmFax(String mmFax) {
		this.mmFax = mmFax;
	}
	
	
	
	
	
	
}