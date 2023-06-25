package com.task_management.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.task_management.entity.User;
import com.task_management.entity.UserTask;
import com.task_management.services.Services;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping
@SessionAttributes({"userName","distinctStatus","distinctDueDate"})
public class UsersController {
	
	
	@Autowired
	Services services;
	
	@GetMapping("/loginPage")
	public String loginPage() {
		return"login";
	}
	
	@GetMapping("/register")
	public String RegistrationPage() {
		return "register";
	}
	
	@PostMapping("/addNewUser")
	public String addOneUser(@ModelAttribute User user,ModelMap model) {
		User addUser = services.addOneUser(user);
		if(addUser==null) {
			model.addAttribute("message1","User Name is already present !!! ");
			model.addAttribute("message2","Try with another User Name ");
			return "register";
		}else {
		model.addAttribute("message1","You have successfully registered");
		model.addAttribute("message2","Now, You can Login ");
		return "login";
		}
		
	}
	
	@PostMapping("/verifyLogin")
	public String userLogin(@RequestParam("userName") String username,@RequestParam("password") String password,ModelMap model) {
		String userLogin = services.userLogin(username,password);
		if(userLogin=="welcome") {
			model.addAttribute("userName",username); 
			
			return"create_task";
		}else {
			model.addAttribute("message1","Invalid username and password");
			return "login";
		}
		
	}
	
	@GetMapping("/NewTaskPage")
	public String createTaskPage() {
		return "create_task";
	}
	
	@PostMapping("/createTask")
	public String createTask( @ModelAttribute ("userTask") UserTask userTask,ModelMap model) {
		userTask.setTaskStatus("Incomplete");
		String userName=(String)model.getAttribute("userName");
		userTask.setUserName(userName);
		services.addOneTask(userTask);
		model.addAttribute("message1","Your task has been saved !!!");
		return"create_task";
	}
	
	@GetMapping("/myAllTasks")
	public String myTaskPage(ModelMap model) {
		String userName=(String)model.getAttribute("userName");
		List<UserTask> listOfTask = services.getOneUserAllTasks(userName);
		if(listOfTask.size()<1) {
			
			model.addAttribute("message1","Currently, You don't have any task !!!");
			return"feedback_page";
			
		}else {
			model.addAttribute("listOfTask",listOfTask);
			return"one_user_tasks";
			
		}
		
	}
	
	@GetMapping("/update")
	public String updateTaskPage(@RequestParam("id")long id,ModelMap model) {
		UserTask oneTask = services.getOneTask(id);
		model.addAttribute("oneTask",oneTask);
		return"update_one_task";
	}
	
	@PostMapping("/updateOneTask")
	public String updateOneTask(@ModelAttribute UserTask userTask,ModelMap model) {
		if(userTask.getTaskStatus()==null) {
			userTask.setTaskStatus("Incomplete");
		}else {
			userTask.setTaskStatus("Completed");
		}
		String userName=(String)model.getAttribute("userName");
		userTask.setUserName(userName);
		services.addOneTask(userTask);
		List<UserTask> listOfTask = services.getOneUserAllTasks(userName);
			model.addAttribute("listOfTask",listOfTask);
			model.addAttribute("message1","Your task has been updated !!!");
			return"one_user_tasks";
		
	}
	
	@GetMapping("/delete")
	public String deleteOneTask(@RequestParam ("id") long id,ModelMap model) {
		
		services.deleteOneTask(id);
		String userName=(String)model.getAttribute("userName");
		List<UserTask> listOfTask = services.getOneUserAllTasks(userName);
		if(listOfTask!=null) {
			model.addAttribute("listOfTask",listOfTask);
			model.addAttribute("message1","The task has been deleted");
			return"one_user_tasks";
		}else {
			model.addAttribute("message1","Currently, You don't have any task !!!");
			return"feedback_page";
		}	
	}
	
	@GetMapping("/viewAllUserTasks")
	public String viewAllUserTasks(ModelMap model) {
		List<UserTask> allUserTasks = services.getALLUserTasks();
		if(allUserTasks.size()<1) {
			model.addAttribute("message1","Nobody has any task !!!");
			return"feedback_page";
		}else {
		model.addAttribute("allTasks",allUserTasks);
		TreeSet<String> distinctUsers=new TreeSet<>();
		TreeSet<String> distinctDueDate=new TreeSet<>();
		TreeSet<String> distinctStatus=new TreeSet<>();
		for(UserTask userTask:allUserTasks) {
			distinctUsers.add(userTask.getUserName());
			distinctDueDate.add(userTask.getDueDate());
			distinctStatus.add(userTask.getTaskStatus());
		}
		model.addAttribute("distinctStatus",distinctStatus);
		model.addAttribute("distinctDueDate",distinctDueDate);
		model.addAttribute("users",distinctUsers);
		return"all_user_tasks";
		}
	}
	

	@PostMapping("/filterSearch")
	public String searchTasks(@RequestParam("search")String searchedKey,ModelMap model) {
		if(searchedKey!=null) {
			List<UserTask> searchedTask = services.getSearchedTask(searchedKey);
			model.addAttribute("searchedTask",searchedTask);
			return"all_user_tasks";
			
		}else {
			model.addAttribute("message1","No date Found");
			 return "feedback_page";
		}	
	}
	
	@PostMapping("/dueDateTasks")
	  public String handleFormSubmission(@RequestParam("dueDate") String date,ModelMap model) {
		if(date!=null) {
		List<UserTask> oneDueDateTasks = services.getOneDueDateTasks(date);
		model.addAttribute("searchedTask",oneDueDateTasks);
			return"all_user_tasks"; 
		}
		return null;
	}
	
	@PostMapping("/tasksBasedOnStatus")
	public String tasksBasedOnStatus(@RequestParam("taskStatus") String taskStatus,ModelMap model) {
		List<UserTask> sameStatusTasks = services.getSameStatusTasks(taskStatus);
		model.addAttribute("searchedTask",sameStatusTasks);
		return"all_user_tasks";
	}
	
	@GetMapping("/logOut")
	public String logOutPage(ModelMap model,HttpSession session) {
		session.invalidate();
		model.addAttribute("message","You have been logged out !!!");
		return"login";
	}
	

	
}
