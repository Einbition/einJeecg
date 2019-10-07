package org.jeecg.modules.demo.goods.service.impl;

import org.jeecg.common.system.base.service.impl.JeecgServiceImpl;
import org.jeecg.modules.demo.goods.entity.Goods;
import org.jeecg.modules.demo.goods.mapper.GoodsMapper;
import org.jeecg.modules.demo.goods.service.IGoodsService;
import org.jeecg.modules.demo.test.entity.JeecgDemo;
import org.jeecg.modules.demo.test.mapper.JeecgDemoMapper;
import org.jeecg.modules.demo.test.service.IJeecgDemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Description: jeecg 测试demo
 * @Author: jeecg-boot
 * @Date:  2018-12-29
 * @Version: V1.0
 */
@Service
public class GoodsServiceImpl extends JeecgServiceImpl<GoodsMapper, Goods> implements IGoodsService {
	@Autowired
	GoodsMapper goodsMapper;



}
