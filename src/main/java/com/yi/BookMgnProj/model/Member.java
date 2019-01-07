package com.yi.BookMgnProj.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("Member")
public class Member {
	private String memberNo;
	private String password;
	private String korName;
	private String engName;
	private String phone;
	private String jumin;
	private String email;
	private String address;
	private String photo;
	private boolean admin;
	private String uniqueness;
	private BookRentalInfo bookRentallInfo;
	private Book book;
	private Publisher publisher;

	public Member() {
	}

	public Member(String memberNo, String password, String korName, String engName, String phone, String jumin,
			String email, String address, String photo, boolean admin, String uniqueness,
			BookRentalInfo bookRentallInfo, Book book) {
		super();
		this.memberNo = memberNo;
		this.password = password;
		this.korName = korName;
		this.engName = engName;
		this.phone = phone;
		this.jumin = jumin;
		this.email = email;
		this.address = address;
		this.photo = photo;
		this.admin = admin;
		this.uniqueness = uniqueness;
		this.bookRentallInfo = bookRentallInfo;
		this.book = book;
	}

	public Member(String memberNo, String password, String korName, String engName, String phone, String jumin,
			String email, String address, String photo, boolean admin, String uniqueness,
			BookRentalInfo bookRentallInfo, Book book, Publisher publisher) {
		super();
		this.memberNo = memberNo;
		this.password = password;
		this.korName = korName;
		this.engName = engName;
		this.phone = phone;
		this.jumin = jumin;
		this.email = email;
		this.address = address;
		this.photo = photo;
		this.admin = admin;
		this.uniqueness = uniqueness;
		this.bookRentallInfo = bookRentallInfo;
		this.book = book;
		this.publisher = publisher;
	}

	public Member(String memberNo, String password, String korName, String engName, String phone, String jumin,
			String email, String address, String photo ,String uniqueness) {
		super();
		this.memberNo = memberNo;
		this.password = password;
		this.korName = korName;
		this.engName = engName;
		this.phone = phone;
		this.jumin = jumin;
		this.email = email;
		this.address = address;
		this.photo = photo;
		this.uniqueness = uniqueness;
	}
	
	public Member(String password, String phone, String jumin, String email, String address, String photo) {
		super();
		this.password = password;
		this.phone = phone;
		this.jumin = jumin;
		this.email = email;
		this.address = address;
		this.photo = photo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getEngName() {
		return engName;
	}

	public void setEngName(String engName) {
		this.engName = engName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getJumin() {
		return jumin;
	}

	public void setJumin(String jumin) {
		this.jumin = jumin;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public String getUniqueness() {
		return uniqueness;
	}

	public void setUniqueness(String uniqueness) {
		this.uniqueness = uniqueness;
	}

	public BookRentalInfo getBookRentallInfo() {
		return bookRentallInfo;
	}

	public void setBookRentallInfo(BookRentalInfo bookRentallInfo) {
		this.bookRentallInfo = bookRentallInfo;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Publisher getPublisher() {
		return publisher;
	}

	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((memberNo == null) ? 0 : memberNo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		if (memberNo == null) {
			if (other.memberNo != null)
				return false;
		} else if (!memberNo.equals(other.memberNo))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return memberNo;
	}

}
