package com.aita.emp;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class EmpInitializer extends AbstractAnnotationConfigDispatcherServletInitializer
{
	@Override
	protected Class<?>[] getRootConfigClasses() 
	{
	
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() 
	{
		Class[] configFiles = {EmpConfig.class};
		return configFiles;
	}

	@Override
	protected String[] getServletMappings() 
	{
		String [] mappings = {"/"};
		return mappings;
	}
}
