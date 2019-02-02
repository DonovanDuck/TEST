package cn.edu.tit.bean;

/**
 * @author LiMing
 *
 */
public class Term {
	private String termId;
	private String startYear;
	private String endYear;
	private String term;
	public String getTermId() {
		return termId;
	}
	public void setTermId(String termId) {
		this.termId = termId;
	}
	public String getStartYear() {
		return startYear;
	}
	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}
	public String getEndYear() {
		return endYear;
	}
	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public Term(String termId, String startYear, String endYear, String term) {
		super();
		this.termId = termId;
		this.startYear = startYear;
		this.endYear = endYear;
		this.term = term;
	}
	public Term() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
