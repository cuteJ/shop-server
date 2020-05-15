package com.onlythinking.shop;

import com.onlythinking.shop.apidocs.SwaggerConfiguration;
import com.onlythinking.shop.core.constant.AppSystem;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Profile;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Profile(AppSystem.SPRING_PROFILE_DOC)
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@AutoConfigureMockMvc
@SpringBootTest(classes = {MonolithicApplication.class, SwaggerConfiguration.class})
public abstract class BaseTest {

    static {
        System.setProperty("spring.config.name", "application");
    }
}
