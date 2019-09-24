package service;

import dao.BaseDao;

public class BaseService<TEntity> {

	private BaseDao<TEntity> dao;
	
	protected BaseDao<TEntity> getDao() {
		return dao;
	}
	
	public void setDao(BaseDao<TEntity> dao) {
		this.dao = dao;
	}
}
