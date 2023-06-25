package com.task_management.services;

import java.util.List;

import com.task_management.entity.User;
import com.task_management.entity.UserTask;

public interface Services {

	public User addOneUser(User user);

	public String userLogin(String username, String password);

	public void addOneTask(UserTask userTask);

	public List <UserTask> getOneUserAllTasks(String userName);

	public UserTask getOneTask(long id);

	public void deleteOneTask(long id);

	public List<UserTask> getALLUserTasks();

	public List<UserTask> getSearchedTask(String key);

	public List<UserTask> getOneDueDateTasks(String key);

	public List<UserTask> getSameStatusTasks(String taskStatus);



}
