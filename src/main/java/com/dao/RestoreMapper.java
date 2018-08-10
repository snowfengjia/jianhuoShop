package com.dao;

import java.util.List;
import java.util.Map;

import com.pojo.Restore;

/**
 * @author Administrator
 *	恢复mapper
 */
public interface RestoreMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Restore record);

    int insertSelective(Restore record);

    Restore selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Restore record);

    int updateByPrimaryKeyWithBLOBs(Restore record);

    int updateByPrimaryKey(Restore record);
    
    
    public Restore checkUname(Map uname);
//  查询所有信息
  public List<Restore> getAll(Map map);
//  获取条数
  public int getCount(Map po); 
//  分页
  public List<Restore> getByPage(Map<String, Object> map);
//  模糊查询并分页
  public List<Restore> select(Map<String, Object> map);
}