package com.example.springbootwind.mapper;

import com.example.springbootwind.demand.YingKui;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface YingKuiXmlMapper {
    //查询盈亏表所有数值
    List<YingKui> selectAllYingKui();

    //条件查询
    List<YingKui> selectYingKuiBycondition(YingKui yingKui);

    //删除
    int deleteByStockNameAndCode(YingKui yingKui);

    //新增插入
    int insertYingKui(YingKui yingKui);

    //精准查询
    YingKui selectByStockNameAndCode(YingKui yingKui);

    /**
     * 更新：根据实体类中的stockName和stockCode更新holdQuantity字段
     * @return 受影响的行数（更新成功返回1，无匹配返回0）
     */
    int updateHoldQuantityByStockNameAndCode(YingKui yingKui);
}
