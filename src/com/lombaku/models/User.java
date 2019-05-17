package com.lombaku.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import static javax.persistence.GenerationType.IDENTITY;


@Entity
@Table(name = "users")
public class User implements java.io.Serializable {
	
	private int id;
	private String name;
	private String email;
	private String password;
	private boolean isAdmin;
	
	public User() {
		
	}
	
	public User(String name, String email, String password) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.isAdmin = false;
	}
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "name", nullable = false, length = 100)
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "email", unique = true, nullable = false, length = 100)
	public String getEmail() {
		return this.email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "password", nullable = false, length = 100)
	public String getPassword() {
		return this.password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name = "is_admin", nullable = false)
	public boolean getIsAdmin() {
		return this.isAdmin;
	}
	
	public void setIsAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
}