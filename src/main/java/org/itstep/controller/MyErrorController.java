package org.itstep.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class MyErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {

        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());

            if(statusCode == HttpStatus.NOT_FOUND.value()) {
                model.addAttribute("firstMessage", "404");
                model.addAttribute("secondMessage", "This is not the web page you are looking for");
            }
            else if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                model.addAttribute("firstMessage", "Something went wrong!");
                model.addAttribute("secondMessage", "Our Engineers are on it");
            } else {
                model.addAttribute("firstMessage", "Something went wrong!");
                model.addAttribute("secondMessage", "Our Engineers are on it");
            }
        }
        return "error";
    }


    @Override
    public String getErrorPath() {
        return "/error";
    }
}