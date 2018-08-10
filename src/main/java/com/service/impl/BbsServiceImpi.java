package com.service.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BbsMapper;
import com.pojo.Bbs;
import com.pojo.BbsWithBLOBs;
import com.service.BbsService;
@Service
public class BbsServiceImpi implements BbsService {
   @Resource
   private BbsMapper gdao;
	@Override
	public int add(BbsWithBLOBs po) {
		return gdao.insert(po);
	}

	@Override
	public int update(BbsWithBLOBs po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<BbsWithBLOBs> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}

	@Override
	public Bbs checkUname(String account) {
		return null;
	}

	@Override
	public List<BbsWithBLOBs> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<BbsWithBLOBs> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Bbs getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}
