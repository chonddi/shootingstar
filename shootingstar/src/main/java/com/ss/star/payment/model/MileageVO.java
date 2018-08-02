package com.ss.star.payment.model;

public class MileageVO {

	private int price;
	private int mileage;

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	@Override
	public String toString() {
		return "MileageVO [price=" + price + ", mileage=" + mileage + "]";
	}

}