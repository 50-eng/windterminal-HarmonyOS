package com.example.springbootwind.demand;

public class YingKui {
    /**
     * 自增主键
     */
    private Integer id;

    /**
     * 股票名称（来自hangqing表）
     */
    private String stockName;

    /**
     * 股票代码（来自hangqing表）
     */
    private String stockCode;

    /**
     * 今日盈亏：(现价-成本价)*持仓数（百分位）
     */
    private float todayProfitLoss;

    /**
     * 总市值：现价*持仓数（百分位）
     */
    private float totalMarketValue;

    /**
     * 成本价：现价/(1+今日涨跌)（百分位）
     */
    private float costPrice;

    /**
     * 现价（来自hangqing表）
     */
    private float currentPrice;

    /**
     * 今日涨跌（百分数转小数）
     */
    private float todayPriceChange;

    /**
     * 持仓数固定为1
     */
    private Integer holdQuantity;

    public void setId(Integer id) {
        this.id = id;
    }

    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    public void setStockCode(String stockCode) {
        this.stockCode = stockCode;
    }

    public void setTodayProfitLoss(float todayProfitLoss) {
        this.todayProfitLoss = todayProfitLoss;
    }

    public void setTotalMarketValue(float totalMarketValue) {
        this.totalMarketValue = totalMarketValue;
    }

    public void setCostPrice(float costPrice) {
        this.costPrice = costPrice;
    }

    public void setCurrentPrice(float currentPrice) {
        this.currentPrice = currentPrice;
    }

    public void setTodayPriceChange(float todayPriceChange) {
        this.todayPriceChange = todayPriceChange;
    }

    public void setHoldQuantity(Integer holdQuantity) {
        this.holdQuantity = holdQuantity;
    }

    public Integer getId() {
        return id;
    }

    public String getStockName() {
        return stockName;
    }

    public String getStockCode() {
        return stockCode;
    }

    public float getTodayProfitLoss() {
        return todayProfitLoss;
    }

    public float getTotalMarketValue() {
        return totalMarketValue;
    }

    public float getCostPrice() {
        return costPrice;
    }

    public float getCurrentPrice() {
        return currentPrice;
    }

    public float getTodayPriceChange() {
        return todayPriceChange;
    }

    public Integer getHoldQuantity() {
        return holdQuantity;
    }

    @Override
    public String toString() {
        return "YingKui{" +
                "id=" + id +
                ", stockName='" + stockName + '\'' +
                ", stockCode='" + stockCode + '\'' +
                ", todayProfitLoss=" + todayProfitLoss +
                ", totalMarketValue=" + totalMarketValue +
                ", costPrice=" + costPrice +
                ", currentPrice=" + currentPrice +
                ", todayPriceChange=" + todayPriceChange +
                ", holdQuantity=" + holdQuantity +
                '}';
    }
}

