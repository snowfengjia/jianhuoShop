package com.controller;

import java.io.File;

import java.io.IOException;


import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pojo.Sysuser;
import com.service.SysuserService;
import com.util.PageBean;

import net.sf.json.JSONObject;

@Controller
public class SysuserController {
	@Resource
	private SysuserService userService;

	@RequestMapping("flogin.do")
	public String login() {
		return "login";
	}
//    充值
	
		@RequestMapping("chongZhi.do")
	public String chongZhi(ModelMap map,HttpSession session,Sysuser user){
		Sysuser u=(Sysuser)session.getAttribute("user");
		if(u==null){
			return "nologin";
		}else{
			Sysuser uu=userService.getById(u.getUid());
			uu.setEd(Double.parseDouble(user.getEd())+Double.parseDouble(uu.getEd())+"");
			uu.setUid(u.getUid());
			userService.update(uu);
			map.put("user",userService.getById(u.getUid()));
			return "suc_cz";
		}
	}
//	交押金 
		@RequestMapping("yaJin.do")
	public String yaJin(ModelMap map,HttpSession session,Sysuser user){
		Sysuser u=(Sysuser)session.getAttribute("user");
		if(u==null){
			return "nologin";
		}else{
			if(Double.parseDouble(u.getEd())<300){
				return "error_cz";
			}else{
				Sysuser uu=userService.getById(u.getUid());
				uu.setEd(Double.parseDouble(u.getEd())-300+"");
				uu.setLevel(300);
				uu.setUid(u.getUid());
				userService.update(uu);
				map.put("user",userService.getById(u.getUid()));
				return "suc_yj";	
				
			}
		}
	}	
	@RequestMapping("admin/showUserInfo.do")
	public String showUserInfo(ModelMap map,HttpSession session){
		if(session.getAttribute("auser")==null){
			return "login";
		}
		Sysuser u=(Sysuser)session.getAttribute("auser");
		map.put("user",userService.getById(u.getUid()));
		return "admin/update_user_persion";
	}
	@RequestMapping("admin/updatePersionUser.do")
	public String updateUserInfo(ModelMap map,HttpSession session,Sysuser user){
		userService.update(user);
		map.put("user", userService.getById(user.getUid()));
		session.setAttribute("suc", "cc");
		return "redirect:showUserInfo.do";
	}
	
	// 前台登录
	@RequestMapping("login.do")
	public String checkAdminLogin(Sysuser user, HttpSession session) {
		Map<String,Object> u=new HashMap<String,Object>();
		System.out.println("name===" + user.getUname());
		u.put("uname",user.getUname());
		u.put("pwd",user.getPwd());
		u.put("utype", "会员");
		user = userService.adminLogin(u);
		if (user != null) {
			session.setAttribute("user", user);
			System.out.println("user=" + user);
			session.removeAttribute("suc");
			return "redirect:showIndex.do";
		} else {
			session.setAttribute("suc", "登录失败！用户名或密码错误！");
			return "fore_login";
		}

	}
//  前台忘记密码
	@RequestMapping("forPwd.do")
	public String forPwd(Sysuser user,ModelMap map){
		Map<String,Object> umap=new HashMap<String,Object>();
		umap.put("uname", user.getUname());
		Sysuser u=userService.checkUname(umap);
		if(u==null||u.equals("")){
			return "error_uname";
		}else{
			map.put("user", u);
			return "fore_losspwd";
		}
		
	}
	@RequestMapping("admin/login.do")
	public String aLogin() {
		return "admin/login";
	}
//	处理修改个人信息
		@RequestMapping("showInfo.do")
	public String showInfo(HttpSession session,ModelMap map) {
		Sysuser u=(Sysuser)session.getAttribute("user");
		if(u==null){
			return "fore_login";
		}else{
			map.put("user", userService.getById(u.getUid()));
			return "showUserinfo";
		}
	}	
//		实名认证
		@RequestMapping("showInfo2.do")
	public String showInfo2(HttpSession session,ModelMap map) {
		Sysuser u=(Sysuser)session.getAttribute("user");
		if(u==null){
			return "fore_login";
		}else{
			map.put("user", userService.getById(u.getUid()));
			return "showUserinfo2";
		}
	}	
//		处理修改个人信息
			@RequestMapping("addShowInfo.do")
		public String addShowInfo(HttpSession session,ModelMap map,Sysuser user) {
				userService.update(user);
				return "success";
		}	
//			保存实名认证
			@RequestMapping("addShowInfo2.do")
		public String addShowInfo2(HttpSession session,ModelMap map,Sysuser user) {
				user.setSmtype("已实名认证");
				userService.update(user);
				return "success_sm";
		}	
	
//	文件上传
	public String fileUpload(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,String img){
		String path=request.getSession().getServletContext().getRealPath("upload");
		System.out.println("path==="+path);
		System.out.println("file==="+file);
		String fileName=file.getOriginalFilename();
		System.out.println("fileName==="+fileName);
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
			img=null;	
		}
		
		return img;
		
	}
	// 后台登录
	@RequestMapping("admin/alogin.do")
	public String checkLogin(Sysuser user, HttpSession session) {
		Map<String,Object> u=new HashMap<String,Object>();
		System.out.println("name===" + user.getUname());
		System.out.println("pwd===" + user.getPwd());
		u.put("uname",user.getUname());
		u.put("utype", user.getUtype());
		u.put("pwd",user.getPwd());
		user = userService.adminLogin(u);
		if (user != null) {
			session.setAttribute("auser", user);
			System.out.println("auser=" + user);
			return "admin/index";
		} else {
			session.setAttribute("suc", "登录失败！用户名或密码错误！");
			return "admin/login";
		}
	}

	// 后台注销登录
	@RequestMapping("admin/loginout.do")
	public String adminLoginOut(HttpSession session) {
		session.removeAttribute("auser");
		return "redirect:login.do";
	}

	// 前台注销登录
	@RequestMapping("loginout.do")
	public String loginOut(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("p");
		return "fore_login";
	}


//	验证用户名是否存在
	@RequestMapping("admin/checkUname.do")
	public void checkUname(Sysuser user,HttpServletResponse response){
		   Map<String,Object> map=new HashMap<String,Object>();
		   map.put("uname", user.getUname());
		   System.out.println("uname==="+user.getUname());
		   System.out.println("uname222==="+userService.checkUname(map));
		   JSONObject obj=new JSONObject();
		   if(userService.checkUname(map)!=null){
			  
				 obj.put("info", "ng");
			   }else{
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
	
		@RequestMapping("checkmibao.do")
	public void checkMB(Sysuser user,HttpServletResponse response,HttpSession session){
		  JSONObject obj=new JSONObject();
		  Sysuser u=userService.getById(user.getUid());
		  String q=u.getQuestion();
		  if(u==null||u.equals("")){
			  obj.put("info", "ng");
		  }else{
			 if(q.equals(user.getQuestion())){
				 obj.put("info", u.getPwd());
			 }else{
				 obj.put("info", "ng");
			 }
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
//	验证用户名是否存在
	@RequestMapping("checkUname.do")
	public void checkReg(Sysuser user,HttpServletResponse response){
		   Map map=new HashMap();
		   map.put("uname", user.getUname());
		   System.out.println("uname==="+user.getUname());
		   System.out.println("uname222==="+userService.checkUname(map));
		   JSONObject obj=new JSONObject();
		   if(userService.checkUname(map)!=null){
			   System.out.println("uname233333333333===");
				 obj.put("info", "ng");
			   }else{
				   System.out.println("uname255555555555555===");
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
	@RequestMapping("checkPass.do")
	public void checkPass(Sysuser user,HttpServletResponse response){
		   Map map=new HashMap();
		   map.put("uname", user.getUname());
		   System.out.println("uname==="+user.getUname());
		   System.out.println("uname222==="+userService.checkUname(map));
		   JSONObject obj=new JSONObject();
		   if(userService.checkUname(map)!=null){
				 obj.put("info", userService.checkUname(map).getPwd());
			   }else{
				   obj.put("info", "ng");
				  
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
	@RequestMapping("reg.do")
	public String addReg(Sysuser user, HttpSession session) {
		user.setLevel(0);
		user.setUtype("会员");
		Timestamp time=new Timestamp(System.currentTimeMillis());
		user.setPubtime(time.toString());
		userService.add(user);
		return "fore_login";
	}
	// 添加用户
	@RequestMapping("admin/addUser.do")
	public String addUser(Sysuser user, HttpSession session) {
		user.setLevel(0);
		Timestamp time=new Timestamp(System.currentTimeMillis());
		user.setPubtime(time.toString());
		userService.add(user);
		return "redirect:userList.do";
	}
//	管理员注册
	@RequestMapping("admin/addUser2.do")
	public String addUser2(Sysuser user, HttpSession session) {
		
		Timestamp time=new Timestamp(System.currentTimeMillis());
		user.setPubtime(time.toString());
		userService.add(user);
		return "admin/login";
	}

	// 处理更新用户的信息
	@RequestMapping("admin/doUpdateUser.do")
	public String doUpdateUser(ModelMap map, int id) {
		System.out.println("id=="+id);
		map.put("user",userService.getById(id));
		return "admin/update_user";
	}

	// 更新用户的信息
	@RequestMapping("admin/updateUser.do")
	public String updateUser(Sysuser user) {
		userService.update(user);
		return "redirect:userList.do";
	}
	// 加入黑名单
	@RequestMapping("admin/updateUser0.do")
	public String updateUser0(Sysuser user,int id) {
		user=userService.getById(id);
		user.setIsdel("黑名单");
		user.setUid(id);
		userService.update(user);
		return "redirect:userList.do";
	}
	// 释放黑名单
	@RequestMapping("admin/updateUser1.do")
	public String updateUser1(Sysuser user,int id) {
		user=userService.getById(id);
		user.setIsdel("可用");
		user.setUid(id);
		userService.update(user);
		return "redirect:userList.do";
	}
	// 释放黑名单
	@RequestMapping("admin/updateUserA.do")
	public String updateUserA(Sysuser user,int id) {
		user=userService.getById(id);
		user.setCtype("A");
		user.setUid(id);
		userService.update(user);
		return "redirect:userList.do";
	}

	
	// 查询所有用户的信息
	@RequestMapping("admin/userList.do")
	public String userList(@RequestParam(value = "page", required = false) String page, HttpSession session,
			ModelMap map) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map cmap=new HashMap();
		/*pmap.put("utype", "会员");
		cmap.put("utype", "会员");*/
		int total = userService.getCount(cmap);
		pageBean.setTotal(total);
		List<Sysuser> list = userService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/user_list";
	}

	// 模糊查询并分页
	@RequestMapping("admin/userListQuery.do")
	public String useListQuery(@RequestParam(value = "page", required = false) String page, HttpSession session,
			ModelMap map,Sysuser user) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String,Object> cmap=new HashMap<String,Object>();
		if(user.getUname()!=null&&!user.getUname().equals("")){
			pmap.put("uname", user.getUname());
			cmap.put("uname", user.getUname());
		}
		int total = userService.getCount(cmap);
		pageBean.setTotal(total);
		List<Sysuser> list = userService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		return "admin/user_list";
	}
	@RequestMapping("admin/deleteUser.do")
	public String deleteUser(int id){
		userService.delete(id);
		return "redirect:userList.do";
	}

}
