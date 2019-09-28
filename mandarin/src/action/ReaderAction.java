package action;

import java.util.Map;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.opensymphony.xwork2.ActionContext;

import entity.Reader;
import service.ReaderService;

public class ReaderAction extends BaseAction<Reader, ReaderService> {

	private static final long serialVersionUID = 1L;

	private Reader tempReader;
	private String searchContent;

	public String signin() throws Exception {
		String email = this.getModel().getEmail();
		String password = this.getModel().getPassword();
		if(email == null) {
			this.errorMessage="Please enter your email!";
			return INPUT;
		}
		if(password==null) {
			this.errorMessage="Please enter your password!";
			return INPUT;
		}
		Reader reader = this.getService().verify(email, password);
		if (reader != null) {
			Map<String, Object> session = ActionContext.getContext().getSession();
			session.put("reader", reader);
			setTempReader(reader);
			return INPUT;
		}
		this.errorMessage="Your email or password is wrong!";
		return INPUT;
	}
	
    public String signup() throws Exception{
    	String nickname = this.getModel().getUsername();
    	String email = this.getModel().getEmail();
    	String password = this.getModel().getPassword();
    	String repeatpw = this.getModel().getRepeatpw();
    	boolean check = this.getService().checkEmail(email);
    	if(!check) {
    		this.errorMessage="wrong email";
    		return INPUT;
    	}
    	if(!repeatpw.equals(password)){
    		this.errorMessage="wrong password";
    		return INPUT;
    	}
    	try {
			this.getService().register(this.getModel());
		}
		catch (Exception ex){
			this.addActionError(ex.getMessage());
			return INPUT;
		}
    	return SUCCESS;
    }

	public String search() throws Exception {
		if (this.searchContent == null) {
			return NONE;
		}
		System.out.println(searchContent);
		return "isTitle";
//		if(searchContent.length()>=7  && searchContent.substring(0,7).equals("@email ")) {
//			String emailString = this.searchContent.substring(7).strip();
//			this.tempUser = this.getService().getUserByEmail(emailString);
//			if(this.tempUser==null) {
//				return NONE;
//			}
//			else {
//				Map<String, Object> session = ActionContext.getContext().getSession();
//		    	User user = (User) session.get("user");
//		    	if(user==null) {
//		    		return INPUT;
//		    	}
//				return "isuser";
//			}
//		}
//		else{
//			return "istheme";		
//		}
	}

	public String currentBorrowed() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Reader reader = (Reader) session.get("reader");
		if(reader != null) {
			System.out.println(reader.getId());
			return SUCCESS;
		}
		else {
			return "signin";
		}
	}
	
	public String borrowHistory() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Reader reader = (Reader) session.get("reader");
		if(reader != null) {
			System.out.println(reader.getId());
			return SUCCESS;
		}
		else {
			return "signin";
		}
	}

	// tempReader
	public Reader getTempReader() {
		return tempReader;
	}

	public void setTempReader(Reader tempReader) {
		this.tempReader = tempReader;
	}

	// searchContent
	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
}
