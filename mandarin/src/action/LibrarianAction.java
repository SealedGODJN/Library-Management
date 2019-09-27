package action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import entity.Librarian;
import service.LibrarianService;

public class LibrarianAction extends BaseAction<Librarian, LibrarianService> {

	private static final long serialVersionUID = 1L;

	private Librarian tempLibrarian;
	private String tempLibrarianId;

	public String login() throws Exception {
		String username = this.getModel().getUsername();
		String password = this.getModel().getPassword();
		System.out.println(username + password);
		if (username == null) {
			this.errorMessage = "������ID���룡";
			return INPUT;
		}
		if (password == null) {
			this.errorMessage = "���������룡";
			return INPUT;
		}
		Librarian librarian = this.getService().verify(username, password);
		if (librarian != null) {
			Map<String, Object> session = ActionContext.getContext().getSession();
			session.put("librarian", librarian);
			return SUCCESS;
		}
		this.errorMessage = "�û������������";
		return INPUT;
	}

	public static String hasLogin() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Librarian librarian = (Librarian) session.get("librarian");
		if (librarian == null) {
			return INPUT;
		}
		return SUCCESS;
	}

	public String logout() throws Exception {
		ActionContext.getContext().getSession().clear();
		return SUCCESS;
	}
}
