package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pojo.Ftype;
import com.pojo.Sysuser;
import com.service.FtypeService;
import com.util.PageBean;

import net.sf.json.JSONObject;

@Controller
public class FtypeController {
	@Resource
	private FtypeService typeService;
	

	@RequestMapping("admin/addFtype.do")
	public void addFtype(Ftype Ftype,HttpServletResponse response){
		   Map<String, Object> map=new HashMap<String, Object>();
		   map.put("ftype", Ftype.getFtype());
		   System.out.println("uname==="+typeService.checkUname(map));
		   JSONObject obj=new JSONObject();
		   if(typeService.checkUname(map)!=null){
				 obj.put("info", "ok");
			   }else{
				   Ftype type=new Ftype();
				   type.setFtype(Ftype.getFtype());
				   type.setIsdel("1");
				   typeService.add(type);
				   obj.put("info", "用户名可以用！");
				  
			   }
		   response.setContentType("text/html;charset=utf-8");
		   PrintWriter out=null;
		   try {
			out=response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
		   
	}
	@RequestMapping("doUpdateFtype.do")
	public String doUpdateFtype(ModelMap map,int id){
		map.put("Ftype", typeService.getById(id));
		return "admin/update_type";
	}
	@RequestMapping("updateFtype.do")
	public String updateFtype(Ftype type){
		typeService.update(type);
		return "redirect:admin/FtypeList.do";
	}
//	分页查询
	@RequestMapping("admin/fFtypeList.do")
	public String goodList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Sysuser u=(Sysuser)session.getAttribute("user");
		int total=typeService.getCount(null);
		pageBean.setTotal(total);
		List<Ftype> list=typeService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/list_type";
	}
//   分页模糊查询
	@RequestMapping("admin/vagueFtypeList.do")
	public String vagueFtypeList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Sysuser u=(Sysuser)session.getAttribute("user");
		Map amap=new HashMap();
		/*amap.put("uid", u.getId());
		pmap.put("uid", u.getId());*/
		int total=typeService.getCount(amap);
		pageBean.setTotal(total);
		List<Ftype> list=typeService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		return "admin/list_type";
	}
	@RequestMapping("admin/deleteFtype.do")
	public String deleteFtype(int id){
		typeService.delete(id);
		return "redirect:fFtypeList.do";
	}
}
