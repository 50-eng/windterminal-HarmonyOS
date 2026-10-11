package com.example.springbootwind.mapper;

import com.example.springbootwind.demand.HangQing;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HangQingXmlMapper {
    /**
     * 根据股票名称和代码精准查询单条记录
     * @param hangQing 实体类参数（仅需设置stockName和stockCode属性）
     * @return 匹配的HangQing对象，无匹配则返回null
     */
    HangQing selectByStockNameAndCode(HangQing hangQing);
    List<HangQing> finall();
}
