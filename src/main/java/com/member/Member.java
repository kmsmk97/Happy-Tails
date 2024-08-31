package com.member;

public class Member {
    private int id;
    private String name;
    private String nic;
    private String phone;
    private String address;
    private String gender;
    private String date;
    private String type;
    private String fee;
    
	public Member(int id, String name, String nic, String phone, String address, String gender, String date,
			String type, String fee) {
		super();
		this.id = id;
		this.name = name;
		this.nic = nic;
		this.phone = phone;
		this.address = address;
		this.gender = gender;
		this.date = date;
		this.type = type;
		this.fee = fee;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getNic() {
		return nic;
	}

	public String getPhone() {
		return phone;
	}

	public String getAddress() {
		return address;
	}

	public String getGender() {
		return gender;
	}

	public String getDate() {
		return date;
	}

	public String getType() {
		return type;
	}

	public String getFee() {
		return fee;
	}

	
	
}

