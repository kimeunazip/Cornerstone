package com.spring.client.reply.dao;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.reply.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {
	@Setter(onMethod_= @Autowired)
	private ReplyDAO replyDao;
	
	/*
	@Test
	public void testReplyList() {
		log.info("testReplyList() 호출");
		BoardVO bvo = new BoardVO();
		bvo.setB_num(5);
		
		List<ReplyVO> list = replyDao.replyList(bvo.getB_num());;
		
		for(ReplyVO vo : list) {
			log.info("list 출력 : "+vo);
		}
		
	}*/
	
	/*
	@Test
	public void testReplyInsert() {
		log.info("testReplyInsert() 호출");
		ReplyVO rvo = new ReplyVO();
		rvo.setB_num(2);
		rvo.setR_num(1);
		rvo.setR_name("test1");
		rvo.setR_pwd("1234");
		rvo.setR_content("test1 content");
		
		int result = replyDao.replyInsert(rvo);;
		log.info("result : "+result);
		
	}
	*/
	/*
	@Test
	public void testCheckPwd() {
		log.info("testCheckPwd() 호출");
		ReplyVO rvo = new ReplyVO();
		rvo.setR_num(2);
		rvo.setR_pwd("1234"); 
		
		int result = replyDao.checkPwd(rvo);;
		log.info("result : "+result);
		
	}*/
	@Test
	public void testReplyUpdate() {
		log.info("testReplyUpdate() 호출");
		ReplyVO rvo = new ReplyVO();
		rvo.setR_content("update test");
		rvo.setB_num(143);
		rvo.setR_num(1);
		
		int result = replyDao.replyUpdate(rvo);;
		log.info("result : "+result);
		
	}
}
