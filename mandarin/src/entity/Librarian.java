package entity;

public class Librarian extends BaseEntity{
	private String username;
	private String password;
	private String securityAnswer;
	private String repeatpw;
	private boolean checkState;
	
	public Librarian() {
		super(0);
	}

	public Librarian(long id, String username, String password, String securityAnswer, String repeatpw,boolean checkState) {
		this();
		this.username = username;
		this.password = password;
		this.securityAnswer = securityAnswer;
		this.repeatpw = repeatpw;
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

	public String getSecurityAnswer() {
		return securityAnswer;
	}

	public void setSecurityAnswer(String securityAnswer) {
		this.securityAnswer = securityAnswer;
	}

	public String getRepeatpw() {
		return repeatpw;
	}

	public void setRepeatpw(String repeatpw) {
		this.repeatpw = repeatpw;
	}

	/**
	 * @return the checkState
	 */
	public boolean isCheckState() {
		return checkState;
	}

	/**
	 * @param checkState the checkState to set
	 */
	public void setCheckState(boolean checkState) {
		this.checkState = checkState;
	}
	
}
