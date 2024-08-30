package com.csstest.teamb.VO;

public class expressgradeVO {
	
	private String expressgradeNo;
	private int expressType;
	private String gradeId;
	private String gradeNm;

	public String getExpressgradeNo() {
		return expressgradeNo;
	}


	public int getExpressType() {
		return expressType;
	}


	public String getGradeId() {
		return gradeId;
	}

	public String getGradeNm() {
		return gradeNm;
	}

	public void setExpressgradeNo(String expressgradeNo) {
		this.expressgradeNo = expressgradeNo;
	}

	public void setExpressType(int expressType) {
		this.expressType = expressType;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	public void setGradeNm(String gradeNm) {
		this.gradeNm = gradeNm;
	}










	@Override
	    public String toString() {
	        return "expressgradeVO{" +
	                "gradeId='" +gradeId + '\'' +
	                ",gradeNm='" + gradeNm + '\'' +
	                '}';
	    }

}
