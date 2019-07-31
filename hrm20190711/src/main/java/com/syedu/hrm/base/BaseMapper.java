package com.syedu.hrm.base;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * 基础的数据访问类
 */
public interface BaseMapper {
	/**
	 * 保存操作
	 * @param entity 实体
	 */
	public <T> void save(T entity);
	/**
	 * 修改操作
	 * @param entity 实体
	 */
	public <T> void update(T entity);
	/**
	 * 删除操作
	 * @param id 主键ID
	 */
	public <T> void delete(Serializable id);
	/**
	 * 根据主键获取实体
	 * @param id 主键ID
	 * @return 实体
	 */
	public <T> T get(Serializable id);
	/**
	 * 查询操作
	 * @param params 查询参数
	 * @return 实体集合
	 */
	public <T> List<T> find(Map<String, Object> params);
	/**
	 * 统计查询
	 * @param params 查询参数
	 * @return 总记录条数
	 */
	public int count(Map<String, Object> params);
	/**
	 * 分页查询
	 * @param params 查询参数
	 * @return 实体集合
	 */
	public <T> List<T> findAll(Map<String, Object> params);

}