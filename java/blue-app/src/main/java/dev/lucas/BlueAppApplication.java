package dev.lucas;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@SpringBootApplication
@Controller
@RequestMapping("/")
public class BlueAppApplication implements CommandLineRunner {

	String host = null;

	public static void main(String[] args) {
		SpringApplication.run(BlueAppApplication.class, args);
	}

	@GetMapping
	public ModelAndView blue(HttpServletRequest request) {
		var ip = request.getRemoteAddr();
		var model = new ModelAndView("index.html");
		model.addObject("host", host);
		model.addObject("ip", request.getRemoteHost());
		model.addObject("ip2", ip);

		return model;
	}

	@Override
	public void run(String... args) throws Exception {
		host = InetAddress.getLocalHost().getHostName();
	}

}
