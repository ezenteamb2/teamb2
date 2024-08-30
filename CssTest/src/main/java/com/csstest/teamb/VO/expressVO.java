package com.csstest.teamb.VO;

public class expressVO {
	
	private String expressNo;
	private String gradeNm;
	private String depPlandTime;
	private String arrPlandTime;
	private String depPlaceNm;
	private String arrPlaceNm;
	private int expressType;
	
	
	 public int getExpressType() {
		return expressType;
	}
	public void setExpressType(int expressType) {
		this.expressType = expressType;
	}
	public String getExpressNo() {
		return expressNo;
	}
	public String getGradeNm() {
		return gradeNm;
	}
	public String getDepPlandTime() {
		return depPlandTime;
	}
	public String getArrPlandTime() {
		return arrPlandTime;
	}
	public String getDepPlaceNm() {
		return depPlaceNm;
	}
	public String getArrPlaceNm() {
		return arrPlaceNm;
	}
	
	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}
	public void setGradeNm(String gradeNm) {
		this.gradeNm = gradeNm;
	}
	public void setDepPlandTime(String depPlandTime) {
		this.depPlandTime = depPlandTime;
	}
	public void setArrPlandTime(String arrPlandTime) {
		this.arrPlandTime = arrPlandTime;
	}
	public void setDepPlaceNm(String depPlaceNm) {
		this.depPlaceNm = depPlaceNm;
	}
	public void setArrPlaceNm(String arrPlaceNm) {
		this.arrPlaceNm = arrPlaceNm;
	}
	



	@Override
	    public String toString() {
	        return "expressVO{" +
	                "gradeNm='" +gradeNm + '\'' +
	                ", depPlandTime='" + depPlandTime + '\'' +
	                ", arrPlandTime='" + arrPlandTime + '\'' +
	                ", depPlaceNm='" + depPlaceNm + '\'' +
	                ", arrPlaceNm='" +arrPlaceNm + '\'' +
	         
	                '}';
	    }

}
