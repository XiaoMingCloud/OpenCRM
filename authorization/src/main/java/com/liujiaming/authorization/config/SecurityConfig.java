package com.liujiaming.authorization.config;

import com.liujiaming.authorization.common.AuthenticationTokenFilter;
import com.liujiaming.authorization.common.AuthorizedFilter;
import com.liujiaming.authorization.config.password.AuthenticationProvider;
import com.liujiaming.authorization.service.impl.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.OncePerRequestFilter;

/**  Security配置
 * @author
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private static String[] permitUrl = new String[]{"/login","/logout", "/v2/**","/permission","/reLogin"};

    @Autowired
    private UserDetailsServiceImpl userDetailsService;


    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BasePasswordEncoder();

    }

    @Bean
    public AbstractUserDetailsAuthenticationProvider authenticationProvider() {
        return new AuthenticationProvider();
    }

    @Bean
    public OncePerRequestFilter authenticationTokenFilter() {
        return new AuthenticationTokenFilter();
    }

    @Bean
    public AuthenticationEntryPoint authenticationEntryPoint() {
        return new AuthorizedFilter();
    }


    /**
     * @param http the {@link HttpSecurity} to modify
     * @throws Exception if an error occurs
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .sessionManagement().disable()
                .authorizeRequests()
                //不需要身份认证的路径
                .antMatchers(permitUrl).permitAll()
                .anyRequest().authenticated().and()
                .formLogin().disable()
                .logout().disable()
                .exceptionHandling().authenticationEntryPoint(authenticationEntryPoint()).and()
                .csrf().disable()
                .addFilterAt(authenticationTokenFilter(), CsrfFilter.class);

    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder())
                .and()
                .authenticationProvider(authenticationProvider());
    }


}
