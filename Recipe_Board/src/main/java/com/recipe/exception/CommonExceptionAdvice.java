package com.recipe.exception;


import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonExceptionAdvice {

	@ExceptionHandler(Exception.class)
	public ModelAndView commonExcepiton(Exception e) {
		
		ModelAndView model = new ModelAndView();
		model.addObject("exception", e);
		model.setViewName("include/error");
		
		return model;
	}
	
}
