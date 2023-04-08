package es.unex.giiis.pi.jeatust.model;

public class User {

	private long id;
	private String name;
	private String surname;
	private String email;
	private String password;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean validateName() {
		return name.trim().matches("[A-Za-záéíóúñÁÉÍÓÚ]{2,}") && surname.trim().matches("[A-Za-záéíóúñÁÉÍÓÚ]{2,}");
	}
	public boolean validatePassword() {
		return password.trim().matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[^\\w\\s])[A-Za-z\\d^\\W_]{8,}$");
	}
}
