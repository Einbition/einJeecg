package org.jeecg.modules.demo.goods.controller;


import java.util.Arrays;


import javax.servlet.http.HttpServletRequest;

import org.jeecg.common.api.vo.Result;
import org.jeecg.common.api.vo.TablePage;
import org.jeecg.common.aspect.annotation.AutoLog;
import org.jeecg.common.aspect.annotation.PermissionData;
import org.jeecg.common.constant.CommonConstant;

import org.jeecg.common.system.query.QueryGenerator;
import org.jeecg.common.util.RedisUtil;
import org.jeecg.modules.demo.goods.entity.Goods;
import org.jeecg.modules.demo.goods.service.IGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Api(tags="商品管理")
@RestController
@RequestMapping("/test/goods")
public class GoodsController  {
	@Autowired
	private IGoodsService goodsService;

	@Autowired
	private RedisUtil redisUtil;

	/**
	 * 分页列表查询
	 * 
	 * @param
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	@ApiOperation(value = "获取goods数据列表", notes = "获取所有goods数据列表")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent="jeecg/JeecgDemoList")
	public Result<TablePage<Goods>> list(Goods goods, @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo, @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
									 HttpServletRequest req) {
		Result<TablePage<Goods>> result = new Result<TablePage<Goods>>();
		QueryWrapper<Goods> queryWrapper = QueryGenerator.initQueryWrapper(goods, req.getParameterMap());
		Page<Goods> page = new Page<>(pageNo, pageSize);
		IPage<Goods> pageList = goodsService.page(page, queryWrapper);
		TablePage<Goods> goodsPage=new TablePage<>();
        goodsPage.setData(pageList.getRecords());
        goodsPage.setPageNo(pageNo);
        goodsPage.setPageSize(pageSize);
        goodsPage.setTotalCount((int)pageList.getTotal());
        goodsPage.setTotalPage((int)pageList.getPages());
		result.setSuccess(true);
		result.setResult(goodsPage);
		return result;
	}

	/**
	 * 添加
	 * 
	 * @param
	 * @return
	 */
	@PostMapping(value = "/add")
	@AutoLog(value = "添加商品")
	@ApiOperation(value = "添加商品", notes = "添加商品")
	public Result<Goods> add(@RequestBody Goods goods) {
		Result<Goods> result = new Result<Goods>();
		try {
			goodsService.save(goods);
			result.success("添加成功！");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			result.error500("操作失败");
		}
		return result;
	}

	/**
	 * 编辑
	 * 
	 * @param jeecgDemo
	 * @return
	 */
	@PutMapping(value = "/edit")
	@ApiOperation(value = "编辑商品", notes = "编辑商品")
	@AutoLog(value = "编辑商品",operateType= CommonConstant.OPERATE_TYPE_3)
	public Result<Goods> edit(@RequestBody Goods goods) {
		Result<Goods> result = new Result<Goods>();
		Goods goodsRes = goodsService.getById(goods.getId());
		if (goodsRes == null) {
			result.error500("未找到对应实体");
		} else {
			boolean ok = goodsService.updateById(goods);
			// TODO 返回false说明什么？
			if (ok) {
				result.success("修改成功!");
			}
		}
		return result;
	}

	/**
	 * 通过id删除
	 * 
	 * @param id
	 * @return
	 */
	@AutoLog(value = "删除商品")
	@DeleteMapping(value = "/delete")
	@ApiOperation(value = "通过id删除商品", notes = "通过id删除商品")
	public Result<?> delete(@RequestParam(name = "id", required = true) String id) {
		try {
			goodsService.removeById(id);
		} catch (Exception e) {
			log.error("删除失败",e.getMessage());
			return Result.error("删除失败!");
		}
		return Result.ok("删除成功!");
	}

	/**
	 * 批量删除
	 * 
	 * @param ids
	 * @return
	 */
	@DeleteMapping(value = "/deleteBatch")
	@ApiOperation(value = "批量删除", notes = "批量删除")
	public Result<Goods> deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
		Result<Goods> result = new Result<Goods>();
		if (ids == null || "".equals(ids.trim())) {
			result.error500("参数不识别！");
		} else {
			this.goodsService.removeByIds(Arrays.asList(ids.split(",")));
			result.success("删除成功!");
		}
		return result;
	}

	/**
	 * 通过id查询
	 * 
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/queryById")
	@ApiOperation(value = "通过ID查询DEMO", notes = "通过ID查询DEMO")
	public Result<Goods> queryById(@ApiParam(name = "id", value = "示例id", required = true) @RequestParam(name = "id", required = true) String id) {
		Result<Goods> result = new Result<Goods>();
		Goods goods = goodsService.getById(id);
		if (goods == null) {
			result.error500("未找到对应实体");
		} else {
			result.setResult(goods);
			result.setSuccess(true);
		}
		return result;
	}



/*
	// ================================================================================================================
	*//**
	 * redis操作 -- set
	 *//*
	@GetMapping(value = "/redisSet")
	public void redisSet() {
		redisUtil.set("name", "张三" + DateUtils.now());
	}

	*//**
	 * redis操作 -- get
	 *//*
	@GetMapping(value = "/redisGet")
	public String redisGet() {
		return (String) redisUtil.get("name");
	}

	*//**
	 * redis操作 -- setObj
	 *//*
	@GetMapping(value = "/redisSetObj")
	public void redisSetObj() {
		Goods p = new Goods();
		p.setAge(10);
		p.setBirthday(new Date());
		p.setContent("hello");
		p.setName("张三");
		p.setSex("男");
		redisUtil.set("user-zdh", p);
	}

	*//**
	 * redis操作 -- setObj
	 *//*
	@GetMapping(value = "/redisGetObj")
	public Object redisGetObj() {
		return redisUtil.get("user-zdh");
	}

	*//**
	 * redis操作 -- get
	 *//*
	@GetMapping(value = "/redisDemo/{id}")
	public JeecgDemo redisGetJeecgDemo(@PathVariable("id") String id) {
		JeecgDemo t = jeecgDemoService.getByIdCacheable(id);
		System.out.println(t);
		return t;
	}

	*//**
	 * freemaker方式 【页面路径： src/main/resources/templates】
	 * 
	 * @param modelAndView
	 * @return
	 *//*
	@RequestMapping("/demo3")
	public ModelAndView demo3(ModelAndView modelAndView) {
		modelAndView.setViewName("demo3");
		List<String> userList = new ArrayList<String>();
		userList.add("admin");
		userList.add("user1");
		userList.add("user2");
		log.info("--------------test--------------");
		modelAndView.addObject("userList", userList);
		return modelAndView;
	}*/

	// ================================================================================================================

	// ==========================================动态表单
	// JSON接收测试===========================================//
	@PostMapping(value = "/testOnlineAdd")
	public Result<Goods> testOnlineAdd(@RequestBody JSONObject json) {
		Result<Goods> result = new Result<Goods>();
		log.info(json.toJSONString());
		result.success("添加成功！");
		return result;
	}

}
