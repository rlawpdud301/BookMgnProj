package com.yi.BookMgnProj.model;

public class BookDetail {
	private Book bookCode;
	private Book title;
	private Book author;
	private Book translator;
	private Book price;
	private Book image;
	private String rentalPossible;
	private Publisher pubNo;
	private Publisher pubName;
	private CategoryS sCode;
	private CategoryM mCode;
	private CategoryB bCode;
	private CategoryS sName;
	private CategoryM mName;
	private CategoryB bName;
	private int hap;
	
	
	
	public int getHap() {
		return hap;
	}
	public void setHap(int hap) {
		this.hap = hap;
	}
	public Book getBookCode() {
		return bookCode;
	}
	public void setBookCode(Book bookCode) {
		this.bookCode = bookCode;
	}
	public Book getTitle() {
		return title;
	}
	public void setTitle(Book title) {
		this.title = title;
	}
	public Book getAuthor() {
		return author;
	}
	public void setAuthor(Book author) {
		this.author = author;
	}
	public Book getTranslator() {
		return translator;
	}
	public void setTranslator(Book translator) {
		this.translator = translator;
	}
	public Book getPrice() {
		return price;
	}
	public void setPrice(Book price) {
		this.price = price;
	}
	public Book getImage() {
		return image;
	}
	public void setImage(Book image) {
		this.image = image;
	}
	
	
	
	public String getRentalPossible() {
		return rentalPossible;
	}
	public void setRentalPossible(String rentalPossible) {
		this.rentalPossible = rentalPossible;
	}
	public Publisher getPubNo() {
		return pubNo;
	}
	public void setPubNo(Publisher pubNo) {
		this.pubNo = pubNo;
	}
	public Publisher getPubName() {
		return pubName;
	}
	public void setPubName(Publisher pubName) {
		this.pubName = pubName;
	}
	public CategoryS getsCode() {
		return sCode;
	}
	public void setsCode(CategoryS sCode) {
		this.sCode = sCode;
	}
	public CategoryM getmCode() {
		return mCode;
	}
	public void setmCode(CategoryM mCode) {
		this.mCode = mCode;
	}
	public CategoryB getbCode() {
		return bCode;
	}
	public void setbCode(CategoryB bCode) {
		this.bCode = bCode;
	}
	public CategoryS getsName() {
		return sName;
	}
	public void setsName(CategoryS sName) {
		this.sName = sName;
	}
	public CategoryM getmName() {
		return mName;
	}
	public void setmName(CategoryM mName) {
		this.mName = mName;
	}
	public CategoryB getbName() {
		return bName;
	}
	public void setbName(CategoryB bName) {
		this.bName = bName;
	}
	public BookDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	
	
}
