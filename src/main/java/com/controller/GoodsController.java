package com.controller;

import java.io.File;


import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pojo.Goods;
import com.pojo.Sysuser;
import com.service.ForderService;
import com.service.FtypeService;
import com.service.GoodsService;
import com.service.SysuserService;
import com.util.PageBean;

@Controller
public class GoodsController {
	@Resource
	private GoodsService goodsService;
	@Resource
	private FtypeService typeService;
	@Resource
	private ForderService orderService;
	@Resource
	private SysuserService userService;
	
	@RequestMapping("admin/doAddGoods.do")
	public String doAddGoods(ModelMap map){
		map.put("adlist", typeService.getAll(null));
		return "admin/add_goods";
	}
//	文件上传
	public String fileUpload(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,String img){
		String path=request.getSession().getServletContext().getRealPath("upload");
		String fileName=file.getOriginalFilename();
		File targetFile=new File(path,fileName);
		if(!targetFile.exists()){
			targetFile.mkdirs();
		}
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String pa=request.getContextPath()+"/upload/"+fileName;
		System.out.println("path==="+pa);
		if(fileName!=null&&!fileName.equals("")){
			img=fileName;
		}else{
			img="zanwu.jpg";	
		}
		return img;
		
	}
	@RequestMapping("admin/addGoods.do")
	public String addGoods(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,Goods Goods,String img,HttpSession session){
		System.out.println("ddddd");
		Sysuser u=(Sysuser)session.getAttribute("auser");
		System.out.println("u=-="+u);
		if(u==null||u.equals("")){
			return "redirect:alogin.do";
		}else{
		img=fileUpload(file, request, img);
		Goods.setImg(img);
		java.sql.Timestamp time=new Timestamp(System.currentTimeMillis());
		Goods.setPubtime(time.toString().substring(0, 19));
		Goods.setIsdel("1");
		Goods.setUid(u.getUid()+"");
		goodsService.add(Goods);
		return "admin/success";
		}
	}
	@RequestMapping("admin/doUpdateGoods.do")
	public String doUpdateGoods(ModelMap map,int id){
		map.put("jz", goodsService.getById(id));
		map.put("adlist", typeService.getAll(null));
		return "admin/update_goods";
	}

	@RequestMapping("admin/updateGoods.do")
	public String updateGoods(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,Goods Goods,String img){
		img=fileUpload(file, request, img);
		Goods.setImg(img);
		goodsService.update(Goods);
		return "admin/success";
	}
//	商品详情
	@RequestMapping("showGoodsx.do")
	public String showGoods(ModelMap map,int id){
		map.put("jz", goodsService.getById(id));
		Map<String,Object> omap=new HashMap<String,Object>();
		omap.put("fid",id);
		map.put("ulist",userService.getAll(null));
		map.put("u2list",userService.getAll(null));
		map.put("olist",orderService.getAll(omap));
		map.put("adlist", typeService.getAll(null));
		return "goodsx";
	}
	

//	分页查询
	@RequestMapping("fGoodsList.do")
	public String showjianList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String, Object>();
		pmap.put("name", null);
		cmap.put("name", null);
		int total=goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list=goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("adlist", typeService.getAll(null));
		session.setAttribute("p", 1);
		return "fwlist";
	}
//	分页查询
	@RequestMapping("admin/GoodsList.do")
	public String jianList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String, Object>();
		int total=goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list=goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		map.put("adlist", typeService.getAll(null));
		map.put("ulist", userService.getAll(null));
		return "admin/list_goods";
	}
//   分页模糊查询
	@RequestMapping("admin/vagueGoodsList.do")
	public String vagueGoodsList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Goods cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		
		Map<String, Object> cmap=new HashMap<String,Object>();
       if(cd.getName()!=null&&!cd.getName().equals("")){
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		}
      if(cd.getFid()!=null&&!cd.getFid().equals("")){
			cmap.put("fid", cd.getFid());
			pmap.put("fid", cd.getFid());
		}
		int total=goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list=goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		map.put("adlist", typeService.getAll(null));
		return "admin/list_goods";
	}
//  分页模糊查询
	@RequestMapping("showGoods.do")
	public String showGoods(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Goods cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		
		Map<String, Object> cmap=new HashMap<String,Object>();
		System.out.println("name==="+cd.getName());
      if(cd.getName()!=null&&!cd.getName().equals("")){
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		}
      if(cd.getFid()!=null&&!cd.getFid().equals("")){
   			cmap.put("fid", cd.getFid());
   			pmap.put("fid", cd.getFid());
   		}
		int total=goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list=goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		map.put("adlist", typeService.getAll(null));
		return "goodsList";
	}
//  分页模糊查询
	@RequestMapping("selectGoodsList.do")
	public String SelectGoods(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Goods cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		
		Map<String, Object> cmap=new HashMap<String,Object>();
		System.out.println("name==="+cd.getName());
      if(cd.getName()!=null&&!cd.getName().equals("")){
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		
		}
      if(cd.getFid()!=null&&!cd.getFid().equals("")){
   			cmap.put("fid", cd.getFid());
   			pmap.put("fid", cd.getFid());
   		}
      if(cd.getMark()!=null&&!cd.getMark().equals("")){
 			cmap.put("mark", cd.getMark());
 			pmap.put("mark", cd.getMark());
 		}
		int total=goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list=goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		map.put("adlist", typeService.getAll(null));
		return "goodsList";
	}
	@RequestMapping("admin/deleteGoods.do")
	public String deleteGoods(int id){
		goodsService.delete(id);
		return "redirect:GoodsList.do";
	}
}
