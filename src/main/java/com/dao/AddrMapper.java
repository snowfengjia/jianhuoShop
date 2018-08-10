package com.dao;

import java.util.List;
import java.util.Map;

import com.pojo.Addr;

/**
 * @author Administrator
 *	订单状态mapper
 */
public interface AddrMapper {
    int deleteByPrimaryKey(Integer fid);

    int insert(Addr record);

    int insertSelective(Addr record);

    Addr selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(Addr record);

    int updateByPrimaryKey(Addr record);
    
    public Addr checkUname(Map<String, Object> uname);
//  查询所有信息
  public List<Addr> getAll(Map<String, Object> map);
//  获取条数
  public int getCount(Map<String, Object> po); 
//  分页
  public List<Addr> getByPage(Map<String, Object> map);
//  模糊查询并分页
  public List<Addr> select(Map<String, Object> map);
}