/**
 * 
 */
package ssd.pbl.model;

import java.util.Date;

/**
 * @author kimhyunjin
 * @date: Jun 12, 2020 12:58:05 PM
 */
public class ClassFeedback {
	private Integer id;
	private Integer connectionId;
	private Double rate;
	private String content;
	private Date registeredAt;
	private Date updatedAt;

	public ClassFeedback() {
	}

	public ClassFeedback(Integer id, Integer connectionId, Double rate, String content, Date registeredAt,
			Date updatedAt) {
		super();
		this.id = id;
		this.connectionId = connectionId;
		this.rate = rate;
		this.content = content;
		this.registeredAt = registeredAt;
		this.updatedAt = updatedAt;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getConnectionId() {
		return connectionId;
	}

	public void setConnectionId(Integer connectionId) {
		this.connectionId = connectionId;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegisteredAt() {
		return registeredAt;
	}

	public void setRegisteredAt(Date registeredAt) {
		this.registeredAt = registeredAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	@Override
	public String toString() {
		return "ClassFeedback [id=" + id + ", connectionId=" + connectionId + ", rate=" + rate + ", content=" + content
				+ ", registeredAt=" + registeredAt + ", updatedAt=" + updatedAt + "]";
	}

}
