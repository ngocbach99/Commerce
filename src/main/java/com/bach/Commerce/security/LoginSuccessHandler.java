package com.bach.Commerce.security;

import com.bach.Commerce.dao.UserDAO;
import com.bach.Commerce.dao.UserRepository;
import com.bach.Commerce.entity.User;
import com.bach.Commerce.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Qualifier("loginSuccessHandler")
@Component
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    @Autowired
    UserDAO userDAO;

    //Khi xác thực thành công, phương thức này sẽ gọi lại vào spring security (xử lí cho phương thức otp)
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        System.out.println("onAuthenticationSuccess");

        LoginService userDetails = (LoginService) authentication.getPrincipal();

        User user = userDetails.getUser();

        if(user.isOTPRequired()){
            user.setOneTimePassword(null);
            user.setOtpRequestedTime(null);
            userDAO.editUser(user);
            logger.info("Cleared OTP successfully");
        }

        super.onAuthenticationSuccess(request, response, authentication);
    }
}
