package com.csstest.teamb.VO;

public class inVO {
	private int inNo;
	private String flightId;
	private String gatenumber;
	private String remark;
	private String elapsetime;
	private String scheduleDateTime;
	private String estimatedDateTime;
	private String airline;
	private String airport;
	private String arrairport;
	private String terminalId;
	private String sdtTime;
	private String edtTime;
	private String typeOfFlight;
	
	
	
	
	
	
	
	
	
	
	
	

public String getTypeOfFlight() {
		return typeOfFlight;
	}
	public void setTypeOfFlight(String typeOfFlight) {
		this.typeOfFlight = typeOfFlight;
	}
public String getSdtTime() {
		return sdtTime;
	}
	public String getEdtTime() {
		return edtTime;
	}
	public void setSdtTime(String sdtTime) {
		this.sdtTime = sdtTime;
	}
	public void setEdtTime(String edtTime) {
		this.edtTime = edtTime;
	}
public String getTerminalId() {
		return terminalId;
	}
	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}
public String getArrairport() {
		return arrairport;
	}
	public void setArrairport(String arrairport) {
		this.arrairport = arrairport;
	}
public String getAirport() {
		return airport;
	}
	public void setAirport(String airport) {
		this.airport = airport;
	}
public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
public String getEstimatedDateTime() {
		return estimatedDateTime;
	}
	public void setEstimatedDateTime(String estimatedDateTime) {
		this.estimatedDateTime = estimatedDateTime;
	}
public int getInNo() {
		return inNo;
	}
	public String getFlightId() {
		return flightId;
	}
	public String getGatenumber() {
		return gatenumber;
	}
	public String getRemark() {
		return remark;
	}
	public String getElapsetime() {
		return elapsetime;
	}
	public String getScheduleDateTime() {
		return scheduleDateTime;
	}
	public void setInNo(int inNo) {
		this.inNo = inNo;
	}
	public void setFlightId(String flightId) {
		this.flightId = flightId;
	}
	public void setGatenumber(String gatenumber) {
		this.gatenumber = gatenumber;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public void setElapsetime(String elapsetime) {
		this.elapsetime = elapsetime;
	}
	public void setScheduleDateTime(String scheduleDateTime) {
		this.scheduleDateTime = scheduleDateTime;
	}

	 @Override
	    public String toString() {
	        return "inVO{" +
	                "flightId='" + flightId + '\'' +
	                ", gatenumber='" + gatenumber + '\'' +
	                ", remark='" + remark + '\'' +
	                ", elapsetime='" + elapsetime + '\'' +
	                ", scheduleDateTime='" +scheduleDateTime + '\'' +
	               ", estimatedDateTime='" +estimatedDateTime + '\'' +
	               ", airline='" +airline + '\'' +
	               ", deairport'" +airport + '\'' +
	                ", arrairport'" +arrairport + '\'' +
	                '}';
	    }

}
