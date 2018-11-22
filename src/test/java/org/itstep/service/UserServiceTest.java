package org.itstep.service;

import org.hamcrest.CoreMatchers;
import org.itstep.domain.Role;
import org.itstep.domain.User;
import org.itstep.repository.UserRepository;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatcher;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Collections;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserServiceTest {

    @Autowired
    private UserService userService;

    @MockBean
    private UserRepository userRepository;

    @MockBean
    private MailSender sender;

    @MockBean
    private PasswordEncoder encoder;

    @Test
    public void addUser() {

        User user = new User();
        user.setEmail("some@mail.com");

        boolean isUserCreated = userService.addUser(user);

        Assert.assertTrue(isUserCreated);
        Assert.assertNotNull(user.getActivationCode());
        Assert.assertTrue(CoreMatchers.is(user.getRoles()).matches(Collections.singleton(Role.USER)));

        verify(userRepository, times(1)).save(user);
        verify(sender, times(1)).send(
                ArgumentMatchers.eq(user.getEmail()),
                ArgumentMatchers.eq("Activation Code"),
                ArgumentMatchers.contains("Welcome to Twiter.")
        );
    }

    @Test
    public void addUserFailTest() {

        User user = new User();

        user.setUsername("some");

        doReturn(new User())
                .when(userRepository)
                .findByUsername("some");

        boolean isUserCreated = userService.addUser(user);

        Assert.assertFalse(isUserCreated);

        verify(userRepository, times(0)).save(ArgumentMatchers.any(User.class));
        verify(sender, times(0)).send(
                ArgumentMatchers.anyString(),
                ArgumentMatchers.anyString(),
                ArgumentMatchers.anyString()
        );
    }

    @Test
    public void activateUser() {

        User user = new User();
        user.setActivationCode("code");

        doReturn(user)
                .when(userRepository)
                .findByActivationCode("activate");

        boolean isActivated = userService.activateUser("activate");

        Assert.assertTrue(isActivated);
        Assert.assertNull(user.getActivationCode());
        verify(userRepository, times(1)).save(user);
    }

    @Test
    public void activateUserFailTest() {
        boolean isActivated = userService.activateUser("activate me");

        Assert.assertFalse(isActivated);

        verify(userRepository, times(0)).save(any(User.class));
    }
}