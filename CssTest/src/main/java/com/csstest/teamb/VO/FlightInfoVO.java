package com.csstest.teamb.VO;

public class FlightInfoVO {
	private String realtimeNo;
	private String airFln;
	
	private String airlineEnglish;
	private String boardingEng;
	private String arrivedEng;
	private String std;
	private String etd;
	private String rmkEng;
	private String gate;
	private String io;
	private String line;
	private String sdtTime;
	private String edtTime;
	private String airport;
	private String city;
	
	
	
	
	
	public String getAirport() {
		return airport;
	}

	public String getCity() {
		return city;
	}

	public void setAirport(String airport) {
		this.airport = airport;
	}

	public void setCity(String city) {
		this.city = city;
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

	public String getIo() {
		return io;
	}

	public String getLine() {
		return line;
	}

	public void setIo(String io) {
		this.io = io;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public String getRealtimeNo() {
		return realtimeNo;
	}

	public void setRealtimeNo(String realtimeNo) {
		this.realtimeNo = realtimeNo;
	}

	public String getAirFln() {
		return airFln;
	}
	
	public String getAirlineEnglish() {
		return airlineEnglish;
	}
	public String getBoardingEng() {
		return boardingEng;
	}
	public String getArrivedEng() {
		return arrivedEng;
	}
	public String getStd() {
		return std;
	}
	public String getEtd() {
		return etd;
	}
	public String getRmkEng() {
		return rmkEng;
	}
	public String getGate() {
		return gate;
	}
	public void setAirFln(String airFln) {
		this.airFln = airFln;
	}
	
	public void setAirlineEnglish(String airlineEnglish) {
		this.airlineEnglish = airlineEnglish;
	}
	public void setBoardingEng(String boardingEng) {
		this.boardingEng = boardingEng;
	}
	public void setArrivedEng(String arrivedEng) {
		this.arrivedEng = arrivedEng;
	}
	public void setStd(String std) {
		this.std = std;
	}
	public void setEtd(String etd) {
		this.etd = etd;
	}
	public void setRmkEng(String rmkEng) {
		this.rmkEng = rmkEng;
	}
	public void setGate(String gate) {
		this.gate = gate;
	}

	 @Override
	    public String toString() {
	        return "FlightInfoVO{" +
	                "airFln='" + airFln + '\'' +
	                ", airlineEnglish='" + airlineEnglish + '\'' +
	                ", boardingEng='" + boardingEng + '\'' +
	                ", arrivedEng='" + arrivedEng + '\'' +
	                ", std='" + std + '\'' +
	                ", etd='" + etd + '\'' +
	                ", rmkEng='" + rmkEng + '\'' +
	                ", gate='" + gate + '\'' +
	                 ",io='" + io + '\'' +
	                  ",line='" + line + '\'' +
	                '}';
	    }

}
