package com.syaccp.easybuy.controller;

import java.beans.PropertyEditorSupport;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.syaccp.easybuy.entity.News;
import com.syaccp.easybuy.service.NewsService;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	
	
	@Resource
	private NewsService newsService;

	public NewsController() {

		System.out.println("NewsController 造出来了");
	}
	
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		// String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击

		// Date 类型转换
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(DateUtils.parseDate(text));
			}

		});
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpServletResponse response, HttpSession session, PrintWriter out,
			ModelMap map) {
		List<News> findAll = newsService.findAll();
		map.addAttribute("list", findAll);
		return "news/news-list";

	}

	@RequestMapping(value = "/delete/{id}/{ccc}", method = RequestMethod.GET)

	public String delete(@PathVariable(value = "id") Integer ids, @PathVariable(value = "ccc") Integer ggg) {

		System.out.println("NewsController delete===>" + ids);
		System.out.println("NewsController delete===>" + ggg);

		return "redirect:/news";

	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(News news,@RequestParam("image") MultipartFile part) {
		String fileName = part.getOriginalFilename();  //文件名称
		long size = part.getSize();
		String name = part.getName();  //获得输入框的名称
		String contentType = part.getContentType();
		System.out.println("NewsController save");
		//part.transferTo(dest);
		
		
		

		return "redirect:/news";

	}
	
	
	 //普通属性直接用user  ,多文件上载
//	@RequestMapping(value="/uploadFile2" ,method=RequestMethod.POST)
//	public String upload2(@Valid User user,BindingResult errors,MultipartRequest request){
//		List<MultipartFile> files = request.getFiles("parts");
//		List<FieldError> fieldErrors = errors.getFieldErrors();
//		for(FieldError error:fieldErrors){
//			System.out.println(error.getField());
//			System.out.println(error.getDefaultMessage());
//		}
//		
//		for(MultipartFile part:files){
//			String fileName = part.getOriginalFilename();  //文件名称
//			long size = part.getSize();
//			String name = part.getName();  //获得输入框的名称
//			String contentType = part.getContentType();
//			
//			//流复制
//			File file =new File("D:" +File.separator+fileName);
//			try {
//				InputStream inputStream = part.getInputStream();
//				
//				part.transferTo(file);
//				
//				
//			}catch (Exception e) {
//			
//				e.printStackTrace();
//			}
//			
//		}
//		
//		
//		
//		return "";
//		
//	}

	@ResponseBody
	@RequestMapping(value = "/ajax")

	public String ajax(ModelMap model, String flightno, HttpServletResponse response) {
		String result = "aaa啊啊啊啊";

		/*News news = new News();
		news.setContent("aaa啊啊啊啊");
		news.setTitle("ddd");*/
		

		return result;
	}

	/*
	 * @RequestMapping("") public ModelAndView list(HttpServletRequest request,
	 * Integer departurecity, Integer arrivalcity) { ModelAndView view = new
	 * ModelAndView(); List<Flight> list =
	 * flightService.findAllWhere(departurecity, arrivalcity); List<City>
	 * cityAll = cityService.selectAll(); view.addObject("list", list);
	 * view.addObject("cityAll", cityAll);
	 * 
	 * view.setViewName("/flight/flight_list"); return view; }
	 */

	/**
	 * 
	 * <bean class=
	 * "org.springframework.web.servlet.view.InternalResourceViewResolver">
	 * <property name="prefix" value="/WEB-INF/manage/"></property>
	 * <property name="suffix" value=".jsp"></property>
	 * 
	 * </bean>
	 * 
	 * 
	 * 
	 * 
	 */

	@RequestMapping("/add")
	public String add() {

		System.out.println("NewsController add");

		// /WEB-INF/manage/news/news-add.jsp
		return "news/news-add";

	}

}
