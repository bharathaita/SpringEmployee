package com.aita.emp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;



@RestController
public class EmpController 
{
	@Autowired
	private EmpService empService;
	
	@GetMapping("/register")
	public RedirectView getJob(@RequestBody(required = false) JobRole job,HttpSession session) 
	{
		List<JobRole> jobRole = empService.getJob(job);
//		for(JobRole sk : jobRole)
//		{
//			System.out.println(sk);
//		}
		session.setAttribute("jobRole", jobRole);
		RedirectView redirectView = new RedirectView("/SpringEmployee/Register.jsp");
		return redirectView;
	}
	
	@GetMapping("/jobDetails")
	public RedirectView getJobData(@RequestBody(required = false) JobRole job,HttpSession session) 
	{
		List<JobRole> jobRole = empService.jobDetails(job);
		for(JobRole sk : jobRole)
		{
			System.out.println(sk);
		}
		
//		int count = jobRole.isEmpty() ? 0 : jobRole.get(0).getCount();
//		System.out.println("Count is "+count);
		session.setAttribute("jobRole", jobRole);
		return new RedirectView("/SpringEmployee/JobDetails.jsp");
	}
	
	@GetMapping("/jobEmp/{eId}")
	public RedirectView jobEmp(@PathVariable("eId") String eId,Employee emp ,HttpSession session) 
	{
		System.out.println("jobemp");
		List<Employee> employee = empService.getJobEmp(eId,emp);
		session.setAttribute("employee", employee);
		System.out.println(employee);
		return new RedirectView("/SpringEmployee/JobEmp.jsp");
	}
	
	@PostMapping("/create")
	public RedirectView createEmp(@RequestBody Employee emp) 
	{
		System.out.println("created");
		empService.store(emp);
		return new RedirectView("/SpringEmployee/Login.jsp");
	}
	
	@PostMapping(value = "/loginEmp")
	public ResponseEntity<String> loginEmp(@RequestParam("eId") String eId,
											@RequestParam("password") String password,HttpSession session) 
	{
	       Employee emp = empService.loginEmp(eId,password);
	       
	       if (emp != null) 
	       {
	    	   String empId = emp.getEmpId();
	    	   session.setAttribute("empId", empId);
	    	   session.setAttribute("emp", emp);
	           String redirectUrl = "/SpringEmployee/Skills.jsp?empId="+empId;
	           return ResponseEntity.ok(redirectUrl);
	       }
	       else 
	       {
	           return ResponseEntity.badRequest().body("Invalid credentials");
	       }
	   }
	
//	@PostMapping("/login")
//	public RedirectView loginEmp1(@RequestParam("eId") String eId,
//						@RequestParam("password") String password) 
//	{
//		System.out.println("Emp Logged in");
//		Employee emp =  empService.loginEmp(eId,password);
//		String empId = emp.getEmpId();
//		return new RedirectView("/SpringEmployee/Skills.jsp?empId="+empId);
//	}
	
	@GetMapping("/viewSkill")
	public RedirectView viewSkill(@RequestParam(name="eId",required=false) String eId,HttpSession session) 
	{
		System.out.println("viewSkill1");
		eId = (String) session.getAttribute("empId");
		List<Skills> skill = empService.view(eId);
		for(Skills sk : skill)
		{
			System.out.println(sk);
		}
		session.setAttribute("skill", skill);
		return new RedirectView("/SpringEmployee/ViewSkills.jsp");
	}
	
	@PostMapping("/viewSkill")
	public RedirectView viewSkill2(@RequestParam(name="eId",required=false) String eId,HttpSession session) 
	{
		System.out.println("viewSkill2");
		List<Skills> skill = empService.view(eId);
//		for(Skills sk : skill)
//		{
//			System.out.println(sk);
//		}
		session.setAttribute("skill", skill);
		return new RedirectView("/SpringEmployee/ViewSkills.jsp");
	}
	
	@PostMapping("/viewEmp")
	public RedirectView viewEmp(@RequestParam(name="eId",required=false)String eId,Employee emp ,HttpSession session) 
	{
		System.out.println("viewEmployee");
		emp = empService.viewEmp(eId,emp);
		return new RedirectView("/SpringEmployee/ViewDetails.jsp");
	}
	
	@PostMapping("/addSkill")
	public RedirectView addSkill(@RequestBody Skills skill) 
	{
		System.out.println("skill added");
		empService.add(skill);
		//return new RedirectView("/SpringEmployee/Login.jsp");
		String redirectUrl = "/SpringEmployee/viewSkill";
		return new RedirectView(redirectUrl);
	}
	
	@PostMapping("/editSkill")
	public RedirectView editSkill(@RequestParam("id") Integer id, Skills skill) 
	{
		System.out.println("one skill edited");
		empService.editSkill(id,skill);
		//return new RedirectView("/SpringEmployee/Login.jsp");
		String redirectUrl = "/SpringEmployee/viewSkill";
		return new RedirectView(redirectUrl);
	}
	
	@GetMapping("/deleteSkill/{id}")
	public RedirectView deleteSkill(@PathVariable("id") Integer id, Skills skill) 
	{
		System.out.println("skill deleted");
		empService.deleteSkill(id,skill);
		return new RedirectView("/SpringEmployee/viewSkill");
		//String redirectUrl = "/SpringEmployee/viewSkill";
		//return new RedirectView(redirectUrl);
	}
	
	@PostMapping("/resetPwd")
	public RedirectView forget(@RequestParam(name="emailId",required=false) String emailId,Employee emp)
	{
		System.out.println("forgot controller called");
		empService.forget(emailId,emp);
		String redirectUrl = "/EmployeeDetails/Login.jsp";
		return new RedirectView(redirectUrl);
	}
	
}
