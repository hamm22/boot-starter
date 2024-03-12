package com.ham.spring.test.jpa.domain;

import java.util.Date;

import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Entity
@AllArgsConstructor
@NoArgsConstructor // 기본생성자
@Table(name="company")
@Builder(toBuilder=true)

public class Company {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	private String business;
	private String scale;
	private int headcount;
	
	@UpdateTimestamp
	@Column(name="createdAt", updatable=false)
	private Date createdAt;

	@UpdateTimestamp
	@Column(name="updatedAt")
	private Date updatedAt;
}
