package com.example.springbootwind.controller;

import com.example.springbootwind.demand.HangQing;
import com.example.springbootwind.demand.YingKui;
import com.example.springbootwind.mapper.HangQingXmlMapper;
import com.example.springbootwind.mapper.YingKuiXmlMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class YingKuiController {
    @Autowired
    YingKuiXmlMapper yingkuixmlmapper;

    @Autowired
    HangQingXmlMapper hangqingxmlmapper;

    @RequestMapping("/ykall")
    public List<YingKui> all(){
        List<YingKui> result = yingkuixmlmapper.selectAllYingKui();
        return result;
    }

    @RequestMapping("/hqall")
    public List<HangQing> finall(){
        List<HangQing> hqresult = hangqingxmlmapper.finall();
        return hqresult;
    }

    /**
     * 条件查询股票盈亏数据
     */
    @PostMapping("/ykcondition")
    public List<YingKui> getconditionYingKui(@RequestBody YingKui yingkui) {
        // 打印传入的参数（便于调试）
        System.out.println("传入的查询参数：stockName=" + yingkui.getStockName() + ", stockCode=" + yingkui.getStockCode());
        System.out.println(yingkui.toString());
        // 调用带参数的查询方法
        List<YingKui> result = yingkuixmlmapper.selectYingKuiBycondition(yingkui);
        return result;
    }

    @PostMapping("/ykdelete")
    public List<YingKui> getdelYingKui(@RequestBody YingKui yingkui){
        // 打印传入的参数（便于调试）
        System.out.println("传入的查询参数：stockName=" + yingkui.getStockName() + ", stockCode=" + yingkui.getStockCode());
        System.out.println(yingkui.toString());
        int bool = yingkuixmlmapper.deleteByStockNameAndCode(yingkui);//删除结果
        //删完再全部查询
        List<YingKui> result = yingkuixmlmapper.selectAllYingKui();
        return result;
    }

    @PostMapping("/ykbianji")
    public List<YingKui> getbianjiYingKui(@RequestBody YingKui yingkui){
        // 打印传入的参数（便于调试）
        System.out.println("传入的查询参数：stockName=" + yingkui.getStockName() + ", stockCode=" + yingkui.getStockCode());
        System.out.println(yingkui.toString());

        int bool = yingkuixmlmapper.insertYingKui(yingkui);
        //新增完再全部查询
        List<YingKui> result = yingkuixmlmapper.selectAllYingKui();
        return result;
    }

    @PostMapping("/exits")
    public List<YingKui> exYingKui(@RequestBody YingKui yingkui){//只会有三个参数，
        // 打印传入的参数（便于调试）
        System.out.println("传入的查询参数："+yingkui.toString());

        String stockName = yingkui.getStockName();//传入参数的两个值
        String stockCode = yingkui.getStockCode();
        HangQing hangqing = new HangQing();//传入行情表进行搜索的对象
        hangqing.setStockName(stockName);
        hangqing.setStockCode(stockCode);

        YingKui cha = yingkuixmlmapper.selectByStockNameAndCode(yingkui);//yingkui表精准查找，根据返回值判断是否存在
        if (cha ==null){//新增要去凑参数
            HangQing fan_hangqing = hangqingxmlmapper.selectByStockNameAndCode(hangqing);//返回要用的行情表数据
            System.out.println("fan_hangqing"+fan_hangqing);

            yingkui.setCurrentPrice(fan_hangqing.getCurrentPrice());//新增设置传入现价
            yingkui.setTodayPriceChange(fan_hangqing.getPriceChangeRate());//新增设置传入涨跌幅度
            Float yingkui_chengbenjia = yingkui.getCurrentPrice()/(1+yingkui.getTodayPriceChange());//成本价计算
            yingkui.setCostPrice(yingkui_chengbenjia);

            Float yingkui_todayyingkui = (yingkui.getCurrentPrice()-yingkui.getCostPrice())*yingkui.getHoldQuantity();//今日盈亏计算
            yingkui.setTodayProfitLoss(yingkui_todayyingkui);

            Float yingkui_shizhi = yingkui.getCurrentPrice()*yingkui.getHoldQuantity();//计算总市值
            yingkui.setTotalMarketValue(yingkui_shizhi);

            System.out.println("yingkui"+yingkui);

            int bool1 = yingkuixmlmapper.insertYingKui(yingkui);//不存在进行新增
            System.out.println("bool1"+bool1);
        }
        else {//存在进行修改
            int bool2 = yingkuixmlmapper.updateHoldQuantityByStockNameAndCode(yingkui);
            System.out.println("bool2"+bool2);
        }
        //新增完再全部查询
        List<YingKui> result = yingkuixmlmapper.selectAllYingKui();
        return result;
    }
}
