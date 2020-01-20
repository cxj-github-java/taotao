package com.clive.controller;


import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.clive.bean.TbItem;
import com.clive.common.Data;
import com.clive.common.FtpUtil;
import com.clive.common.IDUtils;
import com.clive.common.LayuiTableResult;
import com.clive.common.LayuiUploadResult;
import com.clive.common.TaotaoResult;
import com.clive.constant.Constant;
import com.clive.service.TbItemService;

@Controller
@RequestMapping("/item")
public class TbItemController {
	/**
	 * @Value：注解是指为一个属性赋值，${}:根据key取value
	 * 	为一个属性赋值，
	 */
	@Autowired
	private TbItemService tbItemService;
	@RequestMapping("/{itemId}")
	@ResponseBody
	public TbItem findTbItemById(@PathVariable Long itemId){
		TbItem tbItem = tbItemService.findTbItemById(itemId);
		return tbItem;
	}
	@RequestMapping("/showtbItem")
	@ResponseBody
	public LayuiTableResult findTbItemByPage(Integer page,Integer limit){
		LayuiTableResult result = tbItemService.findTbItemByPage(page, limit);
		return result;
	}
	@RequestMapping("/itemDelete")
	@ResponseBody
	public TaotaoResult deleteItemById(@RequestBody List<TbItem> items){
		Date date = new Date();
		TaotaoResult updateItemById = tbItemService.updateItem(items,2,date);
		return updateItemById;
	}
	@RequestMapping("/upItem")
	@ResponseBody
	public TaotaoResult upItem(@RequestBody List<TbItem> items){
		Date date = new Date();
		TaotaoResult upItem = tbItemService.updateItem(items,1,date);
		return upItem;
	}
	@RequestMapping("/downItem")
	@ResponseBody
	public TaotaoResult downItem(@RequestBody List<TbItem> items){
		Date date = new Date();
		TaotaoResult upItem = tbItemService.updateItem(items,0,date);
		return upItem;
	}
	@RequestMapping("/searchtbItem")
	@ResponseBody
	public LayuiTableResult searchTbItem(String title,Long price,Long cId,Integer page,Integer limit){

		LayuiTableResult searchTbItem = tbItemService.searchTbItem(title,price,cId,page,limit);
		return searchTbItem;
	}
	@RequestMapping("/fileUpload")
	@ResponseBody
	public LayuiUploadResult fileUpload(MultipartFile file) {
		try {
			Date date = new Date();
			//每天上传的图片 都按照每天的文件夹分好
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
			//图片路径
			String filePath = format.format(date);
			//得到需要上传的图片名称
			String fileName = file.getOriginalFilename();
			//通过 springmvc的MultipartFile参数 来得到 图片上传的io流 吧他做为参数传入到 我们封装好的方法里面去
			InputStream input = file.getInputStream();
			// 不管页面传递过来的图片 名字叫做什么 比如叫做abc.jpg aaaaa.png 我只要 （随机数生成的图片名称）.png
			fileName = IDUtils.genImageName() + fileName.substring(fileName.lastIndexOf("."));
			FtpUtil.uploadFile(Constant.FTP_ADDRESS, Constant.FTP_PORT, Constant.FTP_USERNAME, Constant.FTP_PASSWORD,
					Constant.FILI_UPLOAD_PATH, filePath, fileName, input);
			LayuiUploadResult result = new LayuiUploadResult();
			result.setCode(0);
			result.setMsg("");
			Data data = new Data();
			data.setSrc(Constant.IMAGE_BASE_URL+"/"+filePath+"/"+fileName);
			result.setData(data);
			return result;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping("/addItem")
	@ResponseBody
	public TaotaoResult addItem(TbItem item,String itemDesc){
		TaotaoResult result = tbItemService.saveItem(item,itemDesc);
		return result;
	}
}
