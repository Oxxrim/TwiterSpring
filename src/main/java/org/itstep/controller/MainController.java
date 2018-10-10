package org.itstep.controller;

import org.itstep.domain.Message;
import org.itstep.domain.Role;
import org.itstep.domain.User;
import org.itstep.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.web.JsonPath;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import javax.websocket.server.PathParam;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Controller
public class MainController {

    @Autowired
    private MessageRepository messageRepository;

    @Value("${upload_path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model){
        Iterable<Message> messages;

        if (filter != null && !filter.isEmpty()){
            messages = messageRepository.findByTag(filter);
        } else {
            messages = messageRepository.findAll();
        }

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "main";
    }



    @PostMapping("/main")
    public String add(/*@RequestParam(required = false, defaultValue = "") String filter*/
            @RequestParam("file") MultipartFile file,
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            Model model) throws IOException {

        message.setAuthor(user);

        if (bindingResult.hasErrors()){
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);
        } else {
            if (file != null && !file.getOriginalFilename().isEmpty()) {

                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String uuidFile = UUID.randomUUID().toString();
                String resultFilename = uuidFile + "." + file.getOriginalFilename();

                file.transferTo(new File(uploadPath + "/" + resultFilename));

                message.setFilename(resultFilename);
            }

            messageRepository.save(message);
        }

        Iterable<Message> messages =  messageRepository.findAll();
        model.addAttribute("messages", messages);
        /*model.put("filter", filter);*/

        return "main";
    }





    /*@GetMapping("/login")
    public String login(Map<String, Object> model){
        return "login";
    }*/


    @GetMapping("/login")
    public String login(@AuthenticationPrincipal User user, Model model) {

        if(user != null && user.getRoles().contains(Role.USER)){
            return "redirect:/";
        }


        return "login";
    }

    /*@GetMapping("/login{error}")
    public String error(Model model, @PathVariable String error){

        model.addAttribute("message", "Invalid username or password!");

        return "login";
    }*/

}