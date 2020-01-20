package com.clive.service.impl;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clive.bean.TbItem;
import com.clive.bean.TbItemDesc;
import com.clive.common.IDUtils;
import com.clive.common.LayuiTableResult;
import com.clive.common.TaotaoResult;
import com.clive.mapper.TbItemDescMapper;
import com.clive.mapper.TbItemMapper;
import com.clive.service.TbItemService;
@Service
public class TbItemServiceImpl implements TbItemService {
	@Autowired
	private TbItemMapper tbItemMapper;
	@Autowired
	private TbItemDescMapper tbItemDescMapper;
	@Override
	public TbItem findTbItemById(Long tbItemId) {
		TbItem tbItem = tbItemMapper.findTbItemById(tbItemId);
		return tbItem;
	}
	@Override
	public LayuiTableResult findTbItemByPage(Integer page, Integer limit) {
		LayuiTableResult result = new LayuiTableResult();
		Integer i = tbItemMapper.findAllCount();
		List<TbItem> list = tbItemMapper.findTbItemByPage((page-1)*limit, limit);
		result.setCode(0);
		result.setCount(i);
		result.setData(list);
		result.setMsg("");
		return result;
	}
	/**
	@Override删除的方法
	public TaotaoResult deleteItemById(List<TbItem> items) {
		List<Long> ids = new ArrayList<Long>();
		for (TbItem item : items) {
			ids.add(item.getId());
		}
		int i = tbItemMapper.deleteItemById(ids);
		if(i>0){
			return TaotaoResult.ok();
		}

		return TaotaoResult.build(500, "删除错误");
	}
	 */
	@Override
	public TaotaoResult updateItem(List<TbItem> items, Integer type,Date date) {
		List<Long> ids = new ArrayList<Long>();
		for (TbItem tbItem : items) {
			ids.add(tbItem.getId());

		}
		int count = tbItemMapper.updateItemById(ids, type,date);
		if(count>0&&type==0){
			return TaotaoResult.build(200, "下架成功");
		}else if(count>0&&type==1){
			return TaotaoResult.build(200, "上架成功");
		}else if(count>0&&type==2){
			return TaotaoResult.build(200, "删除成功");
		}
		return TaotaoResult.build(500, "错误");
	}
	@Override
	public LayuiTableResult searchTbItem(String title, Long price, Long cId, Integer page, Integer limit) {
		LayuiTableResult result = new LayuiTableResult();
		Integer i  = tbItemMapper.searchCount(title,price,cId);
		if(i<=0){
			result.setMsg("没有商品信息");
			return result;
		}
		result.setCode(0);
		result.setCount(i);
		List<TbItem> data = tbItemMapper.searchTbItem(title,price,cId,(page-1)*limit, limit);
		result.setData(data);
		result.setMsg("");
		return result;	
	}
	@Override
	public TaotaoResult saveItem(TbItem item, String itemDesc) {
		long itemId = IDUtils.genItemId();
		item.setId(itemId);
		item.setStatus((byte) 1);
		Date date = new Date();
		item.setCreated(date);
		item.setUpdated(date);
		int i = tbItemMapper.saveItem(item);
		if(i<=0){
			return TaotaoResult.build(500, "添加商品失败，商品基本信息填写有误");
		}
		TbItemDesc tbItemDesc = new TbItemDesc();
		tbItemDesc.setItemId(itemId);
		tbItemDesc.setItemDesc(itemDesc);
		tbItemDesc.setCreated(date);
		tbItemDesc.setUpdated(date);
		int j = tbItemDescMapper.saveTbItemDesc(tbItemDesc);
		if(j<=0){
			return TaotaoResult.build(500, "添加商品失败，商品描述信息填写有误");
		}
		return TaotaoResult.build(200, "添加商品成功");
	}	
}
