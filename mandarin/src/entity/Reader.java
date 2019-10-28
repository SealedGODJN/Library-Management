package entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class Reader extends BaseEntity{
	private String username;
	private String password;
	private String email;
	private String phoneNumber;
	private int borrowBookNumber;
	private boolean fineState;
	private Date createDate;
	private boolean checkState;
	
	public Reader() {
		super(0);
		// TODO Auto-generated constructor stub
	}

	public Reader(long id, String username, String password, String email, String phoneNumber, int borrowBookNumber,
			boolean fineState, Date createDate, boolean checkState) {
		super(id);
		this.username = username;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.borrowBookNumber = borrowBookNumber;
		this.fineState = fineState;
		//SimpleDateFormat bjsdf =   new SimpleDateFormat( "yyyy/MM/dd  HH:mm:ss" ); 
		//bjsdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
		//this.setCreateDate(bjsdf.format(new Date()));
		this.setCreateDate(new Date());
		this.checkState = checkState;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getBorrowBookNumber() {
		return borrowBookNumber;
	}

	public void setBorrowBookNumber(int borrowBookNumber) {
		this.borrowBookNumber = borrowBookNumber;
	}

	public boolean isFineState() {
		return fineState;
	}

	public void setFineState(boolean fineState) {
		this.fineState = fineState;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public boolean isCheckState() {
		return checkState;
	}

	public void setCheckState(boolean checkState) {
		this.checkState = checkState;
	}
	
}
