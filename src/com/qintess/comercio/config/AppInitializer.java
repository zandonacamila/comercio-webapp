package com.qintess.comercio.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer { // extende o método que vai inicializar a app

	@Override
	protected Class<?>[] getRootConfigClasses() { //configura componentes externos (ex: hibernate)
		return new Class[] {
				HibernateConfig.class
		};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() { //configura o mvc do spring
		return new Class[] {
				WebMvcConfig.class
		};
	}

	@Override
	protected String[] getServletMappings() { //configura o mapeamento do servlet do spring
		return new String[] {
				"/"
		};
	}

}
