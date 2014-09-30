package edu.mit.kc.common;

import java.util.List;

public interface DbFunctionExecuteService {
	
	public String executeFunction(String packageName,String functionName,List<Object> params);
}
