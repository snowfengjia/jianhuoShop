package com.service.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ForderMapper;
import com.pojo.Forder;
import com.pojo.TongJi;
import com.service.ForderService;
@Service
public class ForderServiceImpi implements ForderService {
   @Resource
   private ForderMapper gdao;
	@Override
	public int add(Forder po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Forder po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Forder> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}

	@Override
	public Forder checkUname(String account) {
		return null;
	}

	@Override
	public List<Forder> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Forder> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Forder getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

	@Override
	public List<TongJi> getTongJi(Map<String, Object> map) {
		return gdao.getTongJi(map);
	}


}
