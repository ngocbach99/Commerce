package com.bach.Commerce.controller.admin;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bach.Commerce.dao.UserRepository;
import com.bach.Commerce.entity.User;
import com.bach.Commerce.model.UserDTO;
import com.bach.Commerce.service.UserService;

@Controller
public class AdminUserController {
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/admin/user")
	public String getAllUser(Model model) {
		
		List<UserDTO> users = userService.getAllUser();
				
		System.out.println(users);
				
		model.addAttribute("users",users );
		
		model.addAttribute("u", new User());
			
		return "/admin/viewAddUser";
	}
	
	@PostMapping("/admin/user")
	public String addNewUser(Model model,@ModelAttribute("userDTO") UserDTO userDTO, @RequestParam("avatarImage") MultipartFile file) throws IOException {
		
		String fileName = org.springframework.util.StringUtils.cleanPath(file.getOriginalFilename());
		
		if(fileName != "") {
			
			userDTO.setAvatar(fileName);
			
			User user =  userService.addUser(userDTO);
			
			String uploadDir = "./avatar-images/" + user.getId();
			
			Path uploadPath = Paths.get(uploadDir);
			
			if(!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}
			
			try(InputStream inputStream = file.getInputStream()){
				Path filePathMain = uploadPath.resolve(fileName);
				System.out.println("Check : " + filePathMain.toFile().getAbsolutePath());
				
				Files.copy(inputStream, filePathMain, StandardCopyOption.REPLACE_EXISTING);
			}catch(IOException e) {
				throw new IOException("Could not save upload file : " + fileName);
			}
		}else {
			userService.addUser(userDTO);
		}
			
		model.addAttribute("users",userRepo.findAll());
		
		return "/admin/viewAddUser";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteUser(@PathVariable("id") int id, Model model,@ModelAttribute("userDTO") UserDTO userDTO ) {
		
		userRepo.delete(userRepo.getById(id));
		
		return "redirect:/admin/user";
	}
	
	@PostMapping("/edit")
	public String editUser(@RequestParam("id") int id, Model model, @ModelAttribute("user") UserDTO userDTO,
			@RequestParam(value="password") String password,
			@RequestParam(value="username") String username,
			@RequestParam(value="role") String role,
			@RequestParam(value="name") String name,
			@RequestParam(value="avatarImage2")MultipartFile file) throws IOException {
		
		userDTO = userService.getUserById(id);
		
		BCryptPasswordEncoder endcoder = new BCryptPasswordEncoder();
		String endcodedPassword = endcoder.encode(password);
		
		System.out.println(endcodedPassword);
		userDTO.setPassword(endcodedPassword);
		
		userDTO.setUsername(username);
		userDTO.setName(name);
		userDTO.setRole(role);
		
		String fileName = org.springframework.util.StringUtils.cleanPath(file.getOriginalFilename());
		
		if(fileName != "") {
			
			userDTO.setAvatar(fileName);
			
			User user =  userService.editUser(userDTO);
			
			String uploadDir = "./avatar-images/" + user.getId();
			
			Path uploadPath = Paths.get(uploadDir);
			
			if(!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}
			
			try(InputStream inputStream = file.getInputStream()){
				Path filePathMain = uploadPath.resolve(fileName);
				System.out.println("Check : " + filePathMain.toFile().getAbsolutePath());
				
				Files.copy(inputStream, filePathMain, StandardCopyOption.REPLACE_EXISTING);
			}catch(IOException e) {
				throw new IOException("Could not save upload file : " + fileName);
			}
		}else {
			userService.editUser(userDTO);
		}
		
		//model.addAttribute("users",userRepo.findAll());
		
		return "redirect:/admin/user";
	}
}


