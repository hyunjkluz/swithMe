/**
 * 
 */
package ssd.pbl.model;

import javax.validation.constraints.NotBlank;

/**
 * @author kimhyunjin
 * @date: Jun 18, 2020 2:23:48 AM
 */
public class ReviewForm {
	private Integer connectionId;
	private String teacherName;
	private String subjectName;
	private Double rate;
	@NotBlank(message = "후기를 작성해주세요.")
	private String review;

	public ReviewForm(Integer connectionId, String teacherName, String subjectName, Double rate,
			@NotBlank(message = "후기를 작성해주세요.") String review) {
		super();
		this.connectionId = connectionId;
		this.teacherName = teacherName;
		this.subjectName = subjectName;
		this.rate = rate;
		this.review = review;
	}

	public Integer getConnectionId() {
		return connectionId;
	}

	public void setConnectionId(Integer connectionId) {
		this.connectionId = connectionId;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	@Override
	public String toString() {
		return "ReviewForm [connectionId=" + connectionId + ", teacherName=" + teacherName + ", subjectName="
				+ subjectName + ", rate=" + rate + ", review=" + review + "]";
	}

}
