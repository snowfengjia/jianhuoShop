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

import com.pojo.Forder;
import com.pojo.Fshop;
import com.pojo.Goods;
import com.pojo.Sysuser;
import com.pojo.TongJi;
import com.service.ForderService;
import com.service.FshopService;
import com.service.GoodsService;
import com.service.SysuserService;
import com.util.Info;
import com.util.PageBean;

import net.sf.json.JSONObject;

@Controller
public class ForderController {
	@Resource
	private ForderService orderService;
	@Resource
	private SysuserService userService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private FshopService shopService;
	

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
//	退货  tuiHuo.do
	@RequestMapping("tuiHuo.do")
	public String tuiHuo(HttpServletRequest request,Forder order,HttpSession session,int id){
		Sysuser u=(Sysuser)session.getAttribute("user");
		Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null){
			return "nologin";
		}else{
             order=orderService.getById(id);
             order.setStatus("待确认退货");
             order.setKid(id);
             orderService.update(order);
			return "redirect:shopList.do";
		}
	}
	
//	确认退货 queRenTuiHuo.do
	@RequestMapping("admin/queRenTuiHuo.do")
	public String queRenTuiHuo(HttpServletRequest request,Forder order,HttpSession session,int id){
             order=orderService.getById(id);
             order.setStatus("已退货，退款");
             order.setKid(id);
             Sysuser u=userService.getById(order.getUid());
             u.setEd(Double.parseDouble(u.getEd())+order.getZprice()+"");
             u.setUid(order.getUid());
             userService.update(u);
             Map<String,Object> cmap=new HashMap<String,Object>();
             cmap.put("oid", order.getOno());
             List<Fshop> slist=shopService.getAll(cmap);
             for(Fshop ss:slist){
            	ss.setStatus("已退货，退款");
            	ss.setId(ss.getId());
            	Goods gg=goodsService.getById(ss.getFid());
            	gg.setKcnum(gg.getKcnum()+ss.getNum());
            	gg.setXnum(gg.getXnum()-ss.getNum());
            	gg.setId(ss.getFid());
            	goodsService.update(gg);
            	shopService.update(ss);
             }
             orderService.update(order);
			return "redirect:ForderList.do";
	}
	
		@RequestMapping("admin/juJue.do")
		public String juJue(int id,ModelMap map,HttpSession session){
			    Forder order=orderService.getById(id);
			    order.setStatus("卖家已确认");
			    order.setKid(id);
			    orderService.update(order);
				return "redirect:ForderList.do";
		}
//		购买
	@RequestMapping("addOrder.do")
	public String addOrder(HttpServletRequest request,Forder order,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("user");
		Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null){
			return "nologin";
		}else{

			if(order.getZprice()>Double.parseDouble(u.getEd())){
				return "error_cz";
			}else{
				   String ono=Info.getID();
				   System.out.println("订单号rr==="+ono);
					Map<String,Object> smap=new  HashMap<String,Object>();
					smap.put("uid", u.getUid());
					smap.put("status","购物车");
					List<Fshop> slist=shopService.getAll(smap);
					for(Fshop fs:slist){
						Fshop ff=shopService.getById(fs.getId());
						Goods gg=goodsService.getById(ff.getFid());
						gg.setXnum(gg.getXnum()+ff.getNum());
						gg.setId(ff.getFid());
						gg.setKcnum(gg.getKcnum()-ff.getNum());
						goodsService.update(gg);
						ff.setStatus("已支付");
						ff.setId(fs.getId());
						ff.setOid(ono);
						shopService.update(ff);
						}
					u.setEd(Double.parseDouble(u.getEd())-order.getZprice()+"");
					u.setUid(u.getUid());
					userService.update(u);
					Forder fo=new Forder();
					fo.setIsdel("1");
					fo.setOno(ono);
					fo.setPubtime(time.toString().substring(0, 10));
					fo.setUid(u.getUid());
					fo.setStatus("已支付");
					fo.setZprice(order.getZprice()+0);
					orderService.add(fo);
					return "success";
				}
		}
	}
//	订单详情查看showOrderDetail.do
	@RequestMapping("admin/showOrderDetail.do")
	public String showOrderDetail(int id,ModelMap map,HttpSession session){
		    Forder order=orderService.getById(id);
		    Map<String,Object> gmap=new HashMap<String,Object>();
		    gmap.put("oid", order.getOno());
		    map.put("list", shopService.getAll(gmap));
		    map.put("order", order);
		    map.put("glist", goodsService.getAll(null));
		    map.put("ulist", userService.getAll(null));
			return "admin/order_detail";
	}
	
//	前台订单详情查看showOrderDetail.do
	@RequestMapping("showOrderDetail.do")
	public String fshowOrderDetail(int id,ModelMap map,HttpSession session){
		    Forder order=orderService.getById(id);
		    Map<String,Object> gmap=new HashMap<String,Object>();
		    gmap.put("oid", order.getOno());
		    map.put("list", shopService.getAll(gmap));
		    map.put("order", order);
		    map.put("glist", goodsService.getAll(null));
		    map.put("ulist", userService.getAll(null));
			return "order_detail";
	}
	
//	购物车
	@RequestMapping("addshop.do")
	public String addForder(HttpServletRequest request,Fshop shop,HttpSession session,int fid){
		Sysuser u=(Sysuser)session.getAttribute("user");
		Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null){
			return "fore_login";
		}else{
			shop.setUid(u.getUid());
			shop.setFid(fid);
			shop.setStatus("购物车");
			shop.setPubtime(time.toString().substring(0, 19));
			shop.setNum(1);
			shopService.add(shop);
			return "success";
		}

	}
//	显示购物车
	@RequestMapping("showShop.do")
	public String showShop(HttpServletRequest request,Fshop shop,HttpSession session,ModelMap map){
		Sysuser u=(Sysuser)session.getAttribute("user");
		if(u==null){
			return "nologin";
		}else{
			Map<String,Object> smap=new  HashMap<String,Object>();
			smap.put("uid", u.getUid());
			smap.put("status","购物车");
			map.put("list", shopService.getAll(smap));
			map.put("glist", goodsService.getAll(null));
			return "cart_list";
		}

	}
//	修改购物车的数量
		@RequestMapping("updateShopNum.do")
	public String updateShopNum(HttpServletRequest request,Fshop shop){
		shopService.update(shop);
		return "redirect:showShop.do";
	}
	@RequestMapping("admin/updateForder.do")
	public String updateForder(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,Forder yp,String img){
		
		img=fileUpload(file, request, img);
		/*yp.setImg(img);*/
		orderService.update(yp);
		return "redirect:jianSList.do";
	}
//	分页查询
	@RequestMapping("shopList.do")
	public String jianList(@RequestParam(value="page",required=false)String page,
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
		Map<String, Object> umap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		pmap.put("uid", u.getUid());
		umap.put("uid", u.getUid());
		int total=orderService.getCount(umap);
		pageBean.setTotal(total);
		List<Forder> list=orderService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("ulist",userService.getAll(null) );
		map.put("flist", goodsService.getAll(null));
		session.setAttribute("p", 1);
		return "myorderlist";
		}
	}
//	分页查询个人订单信息
	@RequestMapping("showQiuZ.do")
	public String fjianList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("user");
		if(u==null||u.equals("")){
			return "redirect:showIndex.do";
		}else{
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		Map<String, Object> umap=new HashMap<String,Object>();
		Map<String, Object> fmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		pmap.put("uid", u.getUid());
		umap.put("uid", u.getUid());
		fmap.put("utype", "服务员");
		int total=orderService.getCount(umap);
		pageBean.setTotal(total);
		List<Forder> list=orderService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("fwlist", goodsService.getAll(null));
		map.put("ulist", userService.getAll(fmap));
		return "myorderlist";
		}
	}
//   分页查询
	@RequestMapping("admin/ForderList.do")
	public String ForderList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Forder yp){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		int total=orderService.getCount(null);
		pageBean.setTotal(total);
		List<Forder> list=orderService.getByPage(pmap);
		List<Sysuser> ulist=userService.getAll(null);
		List<Goods> jzlist=goodsService.getAll(null);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("ulist", ulist);
		map.put("flist", jzlist);
		session.setAttribute("p", 1);
		return "admin/list_order";
	}
//		完成
		@RequestMapping("wancheng.do")
		public String wancheng(int id,Forder yp){
			Timestamp time=new Timestamp(System.currentTimeMillis());
			yp.setStatus("已确认");
			yp.setKid(id);
			yp.setStime(time.toString().substring(0, 19));
			orderService.update(yp);
			return "success";
		}
//	完成
	@RequestMapping("admin/orderQueRen.do")
	public String luQu(int id,Forder yp){
		Timestamp time=new Timestamp(System.currentTimeMillis());
		yp.setStatus("卖家已确认");
		yp.setKid(id);
		yp.setEtime(time.toString().substring(0, 19));
		orderService.update(yp);
		return "redirect:ForderList.do";
	}
	

	@RequestMapping("doAddpj.do")
	public String doAddpj(int id,ModelMap map,Fshop shop,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("user");
		if(u==null){
			return "nologin";
		}else{
		    Forder order=orderService.getById(id);
		    Map<String,Object> gmap=new HashMap<String,Object>();
		    gmap.put("oid", order.getOno());
		    map.put("list", shopService.getAll(gmap));
		    map.put("order", order);
		    map.put("glist", goodsService.getAll(null));
		    map.put("ulist", userService.getAll(null));
			return "pjList";
		}
	}

	
		@RequestMapping("deleteKeep.do")
	public String deleteKeep(int id){
		shopService.delete(id);
		return "success";
	}
	@RequestMapping("admin/deleteForder.do")
	public String deleteForder(int id){
		orderService.delete(id);
		return "redirect:jianSList.do";
	}
	@RequestMapping("deleteShop.do")
	public String deleteShop(int id){
		shopService.delete(id);
		return "redirect:showShop.do";
	}
	// 统计分析
	@RequestMapping("admin/tj.do")
		public void selectTongji(ModelMap map,Fshop shop,HttpSession session,String starttime,String endtime,String xmlstr,HttpServletResponse response) {
			System.out.println("开始时间" + starttime);
			System.out.println("结束时间" + endtime);
			Map<String,Object> cmap=new HashMap<String,Object>();
			cmap.put("stime1", starttime);
			cmap.put("etime1", endtime);
			List<TongJi> tjlist = orderService.getTongJi(cmap);
			System.out.println("aaaaaaaaaaa==" + tjlist.size());
			xmlstr = "<graph showNames='1'  decimalPrecision='0'  > ";
			for (TongJi tj:tjlist) {
				
				xmlstr += "<set name='" + tj.getName() + "' value='" + tj.getAmount() + "'/> ";
			}
			xmlstr += "</graph>";
			System.out.println("xml==" + xmlstr);
			// System.out.println("ccccccccccccccccccc=="+olist.size());
			// 把集合转换为jsonarray
			// JSONArray array=JSONArray.fromObject(olist);
			JSONObject obj = new JSONObject();
			obj.put("xmlstr", xmlstr);
			// obj.put("list", array);
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

}
