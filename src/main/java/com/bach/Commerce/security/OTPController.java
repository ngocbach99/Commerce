package com.bach.Commerce.security;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class OTPController {

    @PostMapping("/otp-login")
    public String viewOTPLoginForm(){

        return "otp-login";
    }

}
