package com.yi.BookMgnProj.model;

public class AUTH {
	private String id;
	private String korName;
	private boolean admin;

	public AUTH() {}  

	public AUTH(String id, String korName, boolean admin) {
		this.id = id;
		this.korName = korName;
		this.admin = admin;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return String.format("Auth [id=%s, korName=%s, admin=%s]", id, korName, admin);
	}

}
