package com.task_management.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.task_management.entity.User;
import com.task_management.entity.UserTask;
import com.task_management.repositories.UserTaskRepository;
import com.task_management.repositories.UsersRepository;

@Service
public class ServicesImpl implements Services {

	@Autowired
	UsersRepository usersRepo;
	
	@Autowired
	UserTaskRepository userTaskRepo;

	@Override
	public User addOneUser(User user) {
		String userName=user.getUserName();
		Optional<User> users = usersRepo.findByUserName(userName);
		if(users.isPresent()) {
			return null;
		}
		return usersRepo.save(user);
		
	}

	@Override
	public String userLogin(String username, String password) {
		String pass = null;
		String username1=null;
		Optional<User> userName  = usersRepo.findByUserName(username);
		if(userName.isPresent()) {
			User user = userName.get();
			username1=user.getUserName();
			pass = user.getPassword();
		}
		if(pass.equals(password)&& username1.equals(username)) {
			return"welcome";		
		}		
	return null;	
	}

	@Override
	public void addOneTask(UserTask userTask) {
		userTaskRepo.save(userTask);
	}

	@Override
	public List<UserTask> getOneUserAllTasks(String userName) {
		List<UserTask> list = userTaskRepo.findByUserName(userName);
		for(UserTask user:list) {
			user.getDueDate();
			System.out.println(user.getUserName());
		}
		return list;
	}

	@Override
	public UserTask getOneTask(long id) {
		Optional<UserTask> oneTask = userTaskRepo.findById(id);
		return oneTask.get();
	}

	@Override
	public void deleteOneTask(long id) {
		userTaskRepo.deleteById(id);
	}

	@Override
	public List<UserTask> getALLUserTasks() {
		List<UserTask> allTask = userTaskRepo.findAll();
		return allTask;
	}

	@Override
	public List<UserTask> getSearchedTask(String key) {
		List<UserTask> searchedTask = userTaskRepo.findAll(key);
		return searchedTask;
	}

	@Override
	public List<UserTask> getOneDueDateTasks(String key) {
		List<UserTask> findByDueDate = userTaskRepo.findByDueDate(key);
		return findByDueDate;
	}

	@Override
	public List<UserTask> getSameStatusTasks(String taskStatus) {
		List<UserTask> findByStatus=userTaskRepo.findByTaskStatus(taskStatus);
		return findByStatus;
	}
	
	

}
