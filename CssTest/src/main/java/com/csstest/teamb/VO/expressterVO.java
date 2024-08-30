package com.csstest.teamb.VO;

public class expressterVO {
	
	private String expressterNo;
	private int expressType;
	private String terminalld;
	private String terminalNm;
	
	public String getExpressterNo() {
		return expressterNo;
	}
	public int getExpressType() {
		return expressType;
	}

	public String getTerminalld() {
		return terminalld;
	}

	public String getTerminalNm() {
		return terminalNm;
	}

	public void setExpressterNo(String expressterNo) {
		this.expressterNo = expressterNo;
	}

	public void setExpressType(int expressType) {
		this.expressType = expressType;
	}

	public void setTerminalld(String terminalld) {
		this.terminalld = terminalld;
	}

	public void setTerminalNm(String terminalNm) {
		this.terminalNm = terminalNm;
	}









	@Override
	    public String toString() {
	        return "expressterVO{" +
	                "terminalld='" +terminalld + '\'' +
	                ", terminalNm='" + terminalNm + '\'' +
	                '}';
	    }

}
