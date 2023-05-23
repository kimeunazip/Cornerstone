package com.spring.common.log;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.log4j.Log4j;

@Log4j 
@Component//스프링에서 빈으로 인식하기위해
@Aspect //이 클래스의 객체가 Aspect를 구현한 것이다 라는 뜻
public class LoggerAdvice {
	
	/*
	@Before("execution(* com.spring..*Impl.*(..)) && args(bvo)")
	public void printLogging(BoardVO bvo) {
		log.info("************************************");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
		log.info("************************************");
		log.info("BoardVO 타입의 bvo 파라미터 값 : " +bvo);
		log.info("************************************");
	}
	*/
	/*
	@Before("execution(* com.spring..*Impl.*(..))")
	public void printLogging(JoinPoint jp) {
		log.info("************************************");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
		log.info("[호출 메서드 명] "+jp.getSignature().getName());
		log.info("[호출 메서드의 파라미터 값] "+Arrays.toString(jp.getArgs()));
		log.info("************************************");
	}
	
	@AfterThrowing(pointcut="execution(* com.spring..*Impl.*(..))",throwing="exception")
	public void exceptionLogging(JoinPoint jp, Throwable exception) {
		log.info("************************************");
		log.info("[예외발생 후]");
		log.info("[예외발생 메서드 명] "+jp.getSignature().getName());
		log.info("[예외메세지] "+exception);
		log.info("************************************");
	}
	
	@AfterReturning(pointcut="execution(* com.spring..*Impl.*(..))",returning = "returnValue")
	public void afterReturningMethod(JoinPoint jp, Object returnValue) {
		log.info("************************************");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 후 동작");
		log.info("[afterReturningMethod() called......] "+jp.getSignature().getName());
		log.info("[리턴 결과] "+returnValue);
		log.info("************************************");
	}
	*/
	
	//위에 두개 역할을 합친
	@Around("execution(* com.liclass..*Impl.*(..))")
	public Object timeLogging(ProceedingJoinPoint pjp) throws Throwable{
		log.info("************************************");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
		
		StopWatch watch = new StopWatch();
		watch.start();
		log.info("[호출 메서드의 파라미터 값] "+Arrays.toString(pjp.getArgs()));
		
		Object result = null;
		result = pjp.proceed();
		
		watch.stop();
		
		log.info("[Class(구현클래스)]"+pjp.getTarget().getClass());
		log.info("[소요시간]"+watch.getTotalTimeMillis()+"ms");
		log.info("[리턴결과]"+result);
		log.info("[공통 로그 Log] 비즈니스 로직 수행 후 동작");
		log.info("************************************");
		
		return result;
	}
}
