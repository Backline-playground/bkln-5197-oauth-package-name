package com.backline.test;

import io.jsonwebtoken.Jwts;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;

public class App {
    public static String describe(String value) {
        DefaultOAuth2AccessToken token = new DefaultOAuth2AccessToken(value);
        return token.getTokenType() + " " + Jwts.class.getSimpleName();
    }
}
