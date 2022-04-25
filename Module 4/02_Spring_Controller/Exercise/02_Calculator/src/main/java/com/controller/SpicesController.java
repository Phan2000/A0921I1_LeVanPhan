package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SpicesController {
    @GetMapping("/sandwich")
    public String showSandwichCondiments(){
        return "select";
    }

    @PostMapping("/sandwich")
    public String showChoiceList(@RequestParam("data") String[] data, Model model){
        model.addAttribute("listChoice", data);
        return "result";
    }
}
