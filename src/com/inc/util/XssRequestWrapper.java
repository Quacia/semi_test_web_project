package com.inc.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;

import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class XssRequestWrapper extends HttpServletRequestWrapper {

	public XssRequestWrapper(HttpServletRequest request) {
		super(request);
		// 객체 생성 시 상위 클래스인 HttpServletRequestWrapper 생성자 호출.
	}

	@Override
	public String getParameter(String parameter) {
		String value = super.getParameter(parameter);
					//request.getParameter(parameter)와 동일.
		if(value == null) { //넘어온 파라미터값이 없으면 null 리턴
			return null;
		}else {
			// cleanXSS메서드로 필터링한 값을 리턴.
			return cleanXSS(value);
		}
	}

	@Override
	public String[] getParameterValues(String parameter) {
		String[] values = super.getParameterValues(parameter);
		if(values == null) {
			return null;
		}
		// 인코딩한 값을 저장할 배열 생성.
		String[] encodedValues = new String[values.length];
		for(int i = 0; i < values.length ; i++) {
			encodedValues[i] = cleanXSS(values[i]);
		}
		return encodedValues;
	}
	
	private String cleanXSS(String value) {
		value = value.replaceAll("<", "&lt;");
		value = value.replaceAll("<", "&gt;");
		value = value.replaceAll("eval\\((.*)\\)", "");
		value = value.replaceAll("\\(", "&#40;");
		value = value.replaceAll("\\)", "&#41;");
		value = value.replaceAll("'", "&#39;");
		value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
		//"javascript:'*'"구문을 ""로 변환
		value = value.replaceAll("script", "");
		
		return value;
	}
	
}
