package edu.mit.kc.infrastructure;

import java.lang.reflect.Method;

public interface MitKcUnitTestMethodAware {
	public void setTestMethod(Method method);
}
