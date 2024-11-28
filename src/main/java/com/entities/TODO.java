package com.entities;

import java.time.LocalDate;
import java.util.Date;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Notes")
public class TODO {
	@Id
	private int id;
	private int days;
	private LocalDate targetdate;
	private LocalDate createdAt;
	
	public LocalDate getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDate createdAt) {
		this.createdAt = createdAt;
	}
	private String title;
	
	@Column(length = 1500)
	private String content;
	private Date addedDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getAddedDate() {
		return addedDate;
	}
	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}
	
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	} 
	
	
	public LocalDate getTargetdate() {
		return targetdate;
	}
	public void setTargetdate(LocalDate targetdate) {
		this.targetdate = targetdate;
	}
	public TODO(LocalDate createdAt, LocalDate targetdate, int days, String title, String content, Date addedDate) {
		super();
		this.id = new Random().nextInt(100000);
		this.days = days;
		this.title = title;
		this.content = content;
		this.addedDate = addedDate;
		this .targetdate=targetdate;
		this.createdAt=createdAt;
	}
	public TODO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

}
