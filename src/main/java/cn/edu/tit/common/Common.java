/**
 * 存放通用工具
 */
package cn.edu.tit.common;

import java.util.UUID;

import org.springframework.stereotype.Component;

@Component
public class Common {
	
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
}
