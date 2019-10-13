package dao;

import java.util.List;

import entity.Book;

public interface BaseDao<TEntity> {
	
	/**
	 * 
	 * @param id The primary Id of the entity
	 * @return the entity identified by the Id
	 */
	TEntity get(long id);
	
	/**
	 * get single entity by specified property
	 * @param propertyName The name of the property
	 * @param propertyValue The value of the property
	 * @return the entity specialized by the property
	 */
	TEntity getSingle(String propertyName, Object propertyValue);
	
	/**
	 * save the entity
	 * @param entity The entity to be saved
	 */
	void save(TEntity entity);
	
	void merge(TEntity entity);
	
	/**
	 * delete an entity with the primary key id
	 * @param id The primary key id of the entity to be deleted
	 */
	void delete(long id);
	
	/**
	 * delete the entity
	 * @param entity the entity to be deleted.
	 */
	void delete(TEntity entity);
	
	/**
	 * find all the entity from DAO
	 * @return the List of entities found
	 */
	List<TEntity> findAll();
	/**
	 * 
	 * @param condition ����condition�Բ��ҵ������е�ʵ���������
	 * @return the List of entities which are specialized by the condition
	 */
	List<TEntity> findAll(String condition);
	
	/**
	 * find entities with the specified property
	 * @param propertyName The name of the property
	 * @param propertyValue The value of the property
	 * @return the List of entities specialized by the property
	 */
	List<TEntity> findBy(String propertyName, Object propertyValue);
	List<TEntity> findBy(String propertyName, Object propertyValue, String condition);
	List<TEntity> findBySubString(String propertyName, String condition);

	/**
	 * save the copy of the entity
	 * @param entity the entity to be saved
	 */
	void saveCopy(TEntity entity);
}
