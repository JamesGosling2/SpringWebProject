package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Buy;
import util.Common;

@Controller
public class MainController {
    @RequestMapping("/")
    public String mainofmain(){
    	System.out.println("main");
        return Common.Main.VIEW_PATH+"main_of_main.jsp";
    } // main of main()

    @RequestMapping(value = {"/main.do"})
    public String main() {
        return Common.Main.VIEW_PATH + "main.jsp";
    } // end of main()
    
    @RequestMapping("/buy.do")
    public String buy() {
    	return Buy.BUY;
    }



} // end of class
