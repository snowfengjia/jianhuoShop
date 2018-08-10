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

import com.pojo.Bbs;
import com.pojo.BbsWithBLOBs;
import com.pojo.Sysuser;
import com.service.BbsService;
import com.service.ForderService;
import com.service.FtypeService;
import com.service.GoodsService;
import com.service.SysuserService;
import com.util.PageBean;

@Controller
public class BbsController {
	@Resource
	private FtypeService typeService;
	@Resource
	private ForderService orderService;
	@Resource
	private SysuserService userService;
	@Resource
	private BbsService bbsService;
	@Resource
	private GoodsService goodsService;
	
	@RequestMapping("admin/doAddBbs.do")
	public String doAddBbs(ModelMap map){
		map.put("adlist", typeService.getAll(null));
		Map<String,Object> umap=new HashMap<String,Object>();
		umap.put("utype", "商品员");
		map.put("ulist", userService.getAll(umap));
		return "admin/add_Bbs";
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
/*//	
		@RequestMapping("doAddpj.do")
	public String doAddpj(ModelMap map,int gid){
		map.put("goods", goodsService.getById(gid));
		return "pj";
	}*/
	@RequestMapping("addBbs.do")
	public String addBbs(HttpServletRequest request,BbsWithBLOBs Bbs,HttpSession session){
		System.out.println("ddddd");
		Sysuser u=(Sysuser)session.getAttribute("user");
		System.out.println("u=-="+u);
		if(u==null){
			return "fore_login";
		}else{
		java.sql.Timestamp time=new Timestamp(System.currentTimeMillis());
		Bbs.setPubtime(time.toString().substring(0, 19));
		Bbs.setIsdel("1");
		Bbs.setUid(u.getUid());
		bbsService.add(Bbs);
		return "redirect:fBbsList.do";
		}
	}
	@RequestMapping("admin/doUpdateBbs.do")
	public String doUpdateBbs(ModelMap map,int id){
		map.put("bbs", bbsService.getById(id));
		return "admin/update_bbs";
	}
	@RequestMapping("admin/updateBbs.do")
	public String updateBbs(HttpServletRequest request,BbsWithBLOBs Bbs){
		Timestamp time=new Timestamp(System.currentTimeMillis());
		Bbs.setEtime(time.toString().substring(0,19));
		bbsService.update(Bbs);
		return "redirect:bbsList.do";
	}
	
//	分页查询
	@RequestMapping("fBbsList.do")
	public String showjianList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("user");
		if(u==null){
			return "fore_login";
		}else{
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String, Object>();
		pmap.put("uid", u.getUid());
		cmap.put("uid", u.getUid());
		int total=bbsService.getCount(cmap);
		pageBean.setTotal(total);
		List<BbsWithBLOBs> list=bbsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("adlist", typeService.getAll(null));
		session.setAttribute("p", 1);
		return "bbslist";
		}
	}
//	分页查询
	@RequestMapping("admin/bbsList.do")
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
		pmap.put("name", null);
		cmap.put("name", null);
		int total=bbsService.getCount(cmap);
		pageBean.setTotal(total);
		List<BbsWithBLOBs> list=bbsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/list_bbs";
	}
//   分页模糊查询
	@RequestMapping("admin/vagueBbsList.do")
	public String vagueBbsList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Bbs cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		
		Map<String, Object> cmap=new HashMap<String,Object>();
    
		int total=bbsService.getCount(cmap);
		pageBean.setTotal(total);
		List<BbsWithBLOBs> list=bbsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		map.put("adlist", typeService.getAll(null));
		return "admin/list_Bbs";
	}
	
//  分页模糊查询
	@RequestMapping("showBbs2.do")
	public String showBbs2(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Bbs cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		
		Map<String, Object> cmap=new HashMap<String,Object>();
		int total=bbsService.getCount(cmap);
		pageBean.setTotal(total);
		List<BbsWithBLOBs> list=bbsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		map.put("adlist", typeService.getAll(null));
		return "fwlist";
	}
	
//  分页模糊查询
	@RequestMapping("selectBbsList.do")
	public String SelectBbs(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Bbs cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		
		Map<String, Object> cmap=new HashMap<String,Object>();
	/*if(cd.getExperience()!=null&&!cd.getExperience().equals("")){
				cmap.put("experience", cd.getExperience());
				pmap.put("experience", cd.getExperience());
			} */
		int total=bbsService.getCount(cmap);
		pageBean.setTotal(total);
		List<BbsWithBLOBs> list=bbsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		map.put("adlist", typeService.getAll(null));
		return "fwlist";
	}
	@RequestMapping("admin/deleteBbs.do")
	public String deleteBbs(int id){
		bbsService.delete(id);
		return "redirect:bbsList.do";
	}
}
