package org.jeecg.modules.demo.goods.entity;

import java.io.Serializable;

import org.jeecg.common.system.base.entity.JeecgEntity;
import org.jeecgframework.poi.excel.annotation.Excel;
import org.springframework.format.annotation.DateTimeFormat;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.xml.soap.Text;

/**
 * @Description: jeecg 测试demo 
 * @Author: jeecg-boot 
 * @Date:	2018-12-29 
 * @Version:V1.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Goods", description="商品")
@TableName("goods")
public class Goods extends JeecgEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	/** 商品名称 */
	@ApiModelProperty(value = "商品名称")
	private String name;
	/** 图片 */
	@ApiModelProperty(value = "图片")
	private String img;
	@ApiModelProperty(value = "描述")
	private String description;
	@ApiModelProperty(value = "导游id")
	private String guideId;
	@ApiModelProperty(value = "价格",example = "0")
	private java.math.BigDecimal price;
	@ApiModelProperty(value = "状态")
	private String status;


}
