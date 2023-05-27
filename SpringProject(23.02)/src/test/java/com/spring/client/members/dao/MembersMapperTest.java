package com.spring.client.members.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.members.vo.MembersVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MembersMapperTest {

	@Setter(onMethod_= @Autowired)
	private MembersDAO membersDao;
	
	@Test
	public void testSignup() {
		log.info("----------------------------");
		log.info("testSignup() 메서드 실행");
		
		MembersVO vo = new MembersVO();
		
		vo.setId("testId");
		vo.setPw("testPw");
		vo.setName("testName");
		vo.setPhone("testPhone");
		vo.setEmail("testeEmail");
		vo.setAddress("testAddress");
		
		int result = membersDao.signUp(vo);
		log.info("result : "+result);
		log.info("----------------------------");
	}
}
