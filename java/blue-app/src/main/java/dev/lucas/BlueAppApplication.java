package dev.lucas;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@SpringBootApplication
@Controller
@RequestMapping("/")
public class BlueAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(BlueAppApplication.class, args);
	}

	@GetMapping("/blue")
	public ModelAndView blue() {
		return new ModelAndView("index.html");
	}

}
