package com.util;

import javax.servlet.ServletContextEvent;

import org.springframework.web.context.ContextLoaderListener;

public class AutoRunInit extends ContextLoaderListener{

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// TODO Auto-generated method stub
		System.out.println("***************init start********************");
		
		System.out.println("***************init finish*******************");
	}

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		// TODO Auto-generated method stub
	}

	
}
