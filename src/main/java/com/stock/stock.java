package com.stock;

import java.util.List;

public class stock {
	
			private	int id;
			private	String name;
			private	String animal;
			private	String size;
			private	String uprice;
			private	String quantity;
			private	String coordinator;
		    private String total;
			
			public stock(int id, String name,String animal,String size, String uprice,String quantity,String coordinator,
					String total) {
					super();
					this.id = id;
					this.name = name;
					this.animal = animal;
					this.size = size;
					this.uprice = uprice;
					this.quantity = quantity;
					this.coordinator = coordinator;
					this.total = total;
					
					
				}
			public stock(int id, String name, String animal, String size, String uprice,
					String quantity, String coordinator) {
				// TODO Auto-generated constructor stub
			}
			public int getId() {
				return id;
			}
			public void setId(int id) {
				this.id = id;
			}
			public String getName() {
				return name;
			}
			public void setName(String name) {
				this.name = name;
			}
			public String getAnimal() {
				return animal;
			}
			public void setAnimal(String animal) {
				this.animal = animal;
			}
			public String getSize() {
				return size;
			}
			public void setSize(String size) {
				this.size = size;
			}
			public String getUprice() {
				return uprice;
			}
			public void setUprice(String uprice) {
				this.uprice = uprice;
			}
			public String getQuantity() {
				return quantity;
			}
			public void setQuantity(String quantity) {
				this.quantity = quantity;
			}
			public String getCoordinator() {
				return coordinator;
			}
			public void setCoordinator(String coordinator) {
				this.coordinator = coordinator;
			}
			public String getTotal() {
				return total;
			}
			public void setTotal(String total) {
				this.total = total;
			}
			public static List<stock> getstockDetails(String id) {
				// TODO Auto-generated method stub
				return null;
			}
			
			

	}


