package com.example.springbootwind.demand;

public class HangQing {
    /**
     * 自增主键（对应数据库id字段）
     */
    private Integer id;

    /**
     * 股票名称（对应数据库stock_name字段，非空、唯一）
     */
    private String stockName;

    /**
     * 股票代码（6位A股格式，对应数据库stock_code字段，非空、唯一）
     */
    private String stockCode;

    /**
     * 股票现价（对应数据库current_price字段，非空，精度10,2）
     */
    private float currentPrice;

    /**
     * 涨跌幅（小数，精度到百分位，对应数据库price_change_rate字段，非空）
     */
    private float priceChangeRate;

    /**
     * 换手率（小数，精度到百分位，对应数据库turnover_rate字段，非空）
     */
    private float turnoverRate;

    /**
     * 涨跌数值（对应数据库price_change字段，非空）
     */
    private float priceChange;

    /**
     * 5日涨跌幅（小数，精度到百分位，对应数据库five_day_change_rate字段，非空）
     */
    private float fiveDayChangeRate;

    /**
     * 年初至今涨跌幅（小数，精度到百分位，对应数据库year_to_date_change字段，非空）
     */
    private float yearToDateChange;

    /**
     * 买一价格（对应数据库buy_one_price字段，非空）
     */
    private float buyOnePrice;

    public Integer getId() {
        return id;
    }

    public String getStockName() {
        return stockName;
    }

    public String getStockCode() {
        return stockCode;
    }

    public float getCurrentPrice() {
        return currentPrice;
    }

    public float getPriceChangeRate() {
        return priceChangeRate;
    }

    public float getTurnoverRate() {
        return turnoverRate;
    }

    public float getPriceChange() {
        return priceChange;
    }

    public float getFiveDayChangeRate() {
        return fiveDayChangeRate;
    }

    public float getYearToDateChange() {
        return yearToDateChange;
    }

    public float getBuyOnePrice() {
        return buyOnePrice;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    public void setStockCode(String stockCode) {
        this.stockCode = stockCode;
    }

    public void setCurrentPrice(float currentPrice) {
        this.currentPrice = currentPrice;
    }

    public void setPriceChangeRate(float priceChangeRate) {
        this.priceChangeRate = priceChangeRate;
    }

    public void setTurnoverRate(float turnoverRate) {
        this.turnoverRate = turnoverRate;
    }

    public void setPriceChange(float priceChange) {
        this.priceChange = priceChange;
    }

    public void setFiveDayChangeRate(float fiveDayChangeRate) {
        this.fiveDayChangeRate = fiveDayChangeRate;
    }

    public void setYearToDateChange(float yearToDateChange) {
        this.yearToDateChange = yearToDateChange;
    }

    public void setBuyOnePrice(float buyOnePrice) {
        this.buyOnePrice = buyOnePrice;
    }

    @Override
    public String toString() {
        return "HangQing{" +
                "id=" + id +
                ", stockName='" + stockName + '\'' +
                ", stockCode='" + stockCode + '\'' +
                ", currentPrice=" + currentPrice +
                ", priceChangeRate=" + priceChangeRate +
                ", turnoverRate=" + turnoverRate +
                ", priceChange=" + priceChange +
                ", fiveDayChangeRate=" + fiveDayChangeRate +
                ", yearToDateChange=" + yearToDateChange +
                ", buyOnePrice=" + buyOnePrice +
                '}';
    }
}

