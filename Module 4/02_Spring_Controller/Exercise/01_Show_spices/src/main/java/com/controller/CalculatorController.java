package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalculatorController {
    @GetMapping("/calculator")
    public String showSandwichCondiments(){
        return "index";
    }

    @PostMapping("/calculator")
    public String showChoiceList(@RequestParam("num_1") int num_1,
                                 @RequestParam("num_2") int num_2,
                                 @RequestParam("select") String calculation,
                                 Model model){
        int result = 0;
        switch (calculation){
            case "+":
                result = num_1+num_2;
                break;
            case  "-":
                result = num_1-num_2;
                break;
            case "*":
                result = num_1*num_2;
                break;
            case ":":
                result = num_1/num_2;
                break;
        }
        model.addAttribute("result", result);
        return "index";
    }
}
