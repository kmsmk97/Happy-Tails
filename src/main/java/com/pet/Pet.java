package com.pet;

public class Pet {
    private int id;
    private String name;
    private String phone;
    private String date;
    private String category;
    private String petname;
    private String gender;
    private String age;
    private String breed;
    private String dob;
    
	public Pet(int id, String name, String phone, String date, String category, String petname, String gender,
			String age, String breed, String dob) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.date = date;
		this.category = category;
		this.petname = petname;
		this.gender = gender;
		this.age = age;
		this.breed = breed;
		this.dob = dob;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getDate() {
		return date;
	}

	public String getCategory() {
		return category;
	}

	public String getPetname() {
		return petname;
	}

	public String getGender() {
		return gender;
	}

	public String getAge() {
		return age;
	}

	public String getBreed() {
		return breed;
	}

	public String getDob() {
		return dob;
	}


}

