package com.shiva.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.shiva.model.Protocol;
import com.shiva.model.UserRegistration;
import com.shiva.service.ExcelReportView;
import com.shiva.service.ProtocolService;



@Controller
public class ProtocolController {
	@Autowired
	private ProtocolService protocolService;
	@RequestMapping(value="/all",method=RequestMethod.GET,headers = "Accept=application/json")
	public String goToHomePage()
	{
		return "redirect:/getAllProtocols";
	}
	@RequestMapping(value="/getAllProtocols", method=RequestMethod.GET,headers = "Accept=application/json")
	public String getAllProtocols(Model model)
	{ 
		List<Protocol> allPro=protocolService.getAllProtocols();
		model.addAttribute("protocol", new Protocol());
		model.addAttribute("allProtocols", allPro);
		return "protocolList";	
	}
	@RequestMapping(value="/addProtocol",method=RequestMethod.POST,headers = "Accept=application/json")
	public String addFamily(@Valid @ModelAttribute("protocol") Protocol protocol,BindingResult result)
	{
		if(result.hasErrors())
		{
			return "addProtocol";
		}
		else
		
		if(protocol.getId()==0)
		{
			protocolService.addProtocol(protocol);
		}
		else
		{
			protocolService.updateProtocol(protocol);
		}
		return "redirect:/getAllProtocols";
	}
	
	@RequestMapping(value="/updateProtocol/{id}",method=RequestMethod.GET,headers = "Accept=application/json")
	public String updateProtocol(@PathVariable("id") int  id,Model model )
	{
		model.addAttribute("protocol", this.protocolService.getProtocol(id));
		model.addAttribute("listOfFamiles", this.protocolService.getAllProtocols());
		return "protocolList";
	}
	@RequestMapping(value="/deleteProtocol/{id}",method=RequestMethod.GET,headers = "Accept=application/json")
	public String deleteProtocol(@PathVariable("id") int id)
	{
		protocolService.deleteProtocol(id);
		return "redirect:/getAllProtocols";
	}
	@RequestMapping(value="/adding",method=RequestMethod.GET,headers = "Accept=application/json")
	public String addingProtocol(Model model)
	{ 
		model.addAttribute("protocol", new Protocol());
		return "addProtocol";
	}
	@RequestMapping(value="/searching",method=RequestMethod.GET,headers = "Accept=application/json")
	public ModelAndView say()
	{
		String  a="Searching operation";
		ModelAndView m=new ModelAndView("Search","info",a);
		return m;
	}
	
	@RequestMapping(value="/search",method=RequestMethod.GET,headers = "Accept=application/json")
	public String searchByProtocalId(HttpServletRequest request,Model model)
	{ 
		int id=Integer.parseInt(request.getParameter("id"));
		Protocol protocol=protocolService.getProtocol(id);
		if(protocol!=null)
		{
		model.addAttribute("protocol", new Protocol());
		model.addAttribute("searchResult", protocol);
		return "Search";
		}
		else
			model.addAttribute("idnotfound", "SORRY ITEM WAS NOT FOUND WITH THIS ID: "+id);
			return "Search";
		
	}
	
	@RequestMapping(value="/hi",method=RequestMethod.GET,headers = "Accept=application/json")
	public String saying(Model model)
	{
		return "SearchByName";
	}
	
	@RequestMapping(value="/searchbyname",method=RequestMethod.GET,headers = "Accept=application/json")
	public String searchFamilyName(@RequestParam("searchName")String protocolName,Model model)
	{	
		List<Protocol> protocolByName=protocolService.searchByName(protocolName);
		if(protocolByName!=null)
		{
			model.addAttribute("protocolByName", protocolByName);
			  return "SearchByName";	
		}
		else
			model.addAttribute("errorByName", "SORRY ITEM WAS NOT FOUND WITH THIS NAME: "+ protocolName);
		return "SearchByName";
	}
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET,headers = "Accept=application/json")
	public String updatePage(Model model,@PathVariable("id")int id)
	{
		model.addAttribute("protocol", new Protocol());
		Protocol protocol=protocolService.getProtocol(id);
		
		return "upsdate";
	}
	 @RequestMapping(value="/editProtocol/{id}")  
	    public ModelAndView edit(@PathVariable int id){ 
		 Protocol protocol=protocolService.getProtocol(id); 
	        return new ModelAndView("upsdate","command",protocol);  
	    }  
	  @RequestMapping(value="/editsave",method = RequestMethod.POST)  
	    public ModelAndView editsave(@ModelAttribute("protocol") Protocol protocol)
	  	{
		  protocolService.updateProtocol(protocol);  
	      return new ModelAndView("redirect:/getAllProtocols");  
	    }
	  @RequestMapping(value="/report",method=RequestMethod.GET)
	  public ModelAndView getExcel()
	  {
		  List<Protocol> protocolList=protocolService.getAllProtocols();
		  return new ModelAndView(new ExcelReportView(),"protocolList",protocolList);
	  }
	  @RequestMapping(value="/addUser",method=RequestMethod.POST,headers = "Accept=application/json")
		public String addUser(@Valid @ModelAttribute("userRegistration") UserRegistration userRegistration,BindingResult result)
		{
			if(result.hasErrors())
			{
				return "UserRegistration";
			}
			else
			{
			if(userRegistration.getId()==0)
			{
				protocolService.addNewUser(userRegistration);
			}
		
			return "redirect:/";
			
			}
			
		}  
	  @RequestMapping(value="/",method=RequestMethod.GET,headers = "Accept=application/json")
	  public String getUser(Model model)
	  {
		  model.addAttribute("userRegistration", new UserRegistration());
		  return "UserRegistration";
	  }
	  @RequestMapping(value="/logiing",method=RequestMethod.GET,headers = "Accept=application/json")
	  public String logining(Model model)
	  {
	
		  return "Login";
	  }
	 

		@RequestMapping(value="/login",method=RequestMethod.GET,headers = "Accept=application/json")
		public String Login(@RequestParam("email")String email,@RequestParam("password")String password,Model model)
		{	
			List<UserRegistration> user=protocolService.getUser(email, password);
			if(user!=null)
			{
				model.addAttribute("user", user);
				  return "Login";	
			}
			else
				model.addAttribute("errorByName", "SORRY ITEM WAS NOT FOUND WITH THIS NAME: "+ email);
			return "SearchByName";
		}
}
