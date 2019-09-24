package service;

import java.util.List;

import entity.Librarian;
import entity.Reader;

public interface LibrarianService {

	public Librarian verify(long id, String password);
	
	public void register(Reader reader);
	
	// ͼ��ݹ���Ա�ܹ��ڳ��ܵİ������һ����룬����ȷ���������Ӧ����admin�л�����service��
	public boolean checkEmail(String email);
	
	public Reader getReaderById(long id);
	
	public List<Reader> getAllUsers();
	public void mergeReader(Reader reader);
}
