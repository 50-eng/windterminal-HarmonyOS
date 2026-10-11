export {ai_jian}
@Component
struct ai_jian{
  //4.AI简报
  @State jianbao:string[][] =[["极端天气","越南庆和省洪灾重创葡萄与苹果种植业，近300公顷果园受损","app.media.4_3_1"],["中国宏观","中国楼市企稳态势逐步显现，法治化处置问题房企成重点","app.media.4_3_2"]
    ,["A股财报速递","诺诚健华-U(688428.SH)：前三季度净亏损6441.49万元，同比亏损缩窄","app.media.4_3_3"],["印度宏观","印度拟全面改革海关税制，推动“无接触”通关","app.media.4_3_4"]
    ,["日本宏观","日本央行或于12月将基准利率上调至0.75%","app.media.4_3_5"],["东南亚宏观","印尼2025年GDP目标设为5.2%-5.4%，DPR呼吁加大财政刺激与投资推动","app.media.4_3_6"]
    ,["澳大利亚宏观","澳大利亚宏观每日简报2025年12月5日","app.media.4_3_7"],["美国宏观","美国股债波动率指数齐跌至低位 市场静待美联储决议","app.media.4_3_8"]
    ,["硬件设备","源杰科技股价年内暴涨348%，硅光芯片突破驱动数据中心业务反超电信市场","app.media.4_3_9"],["医药生物","2025年国家医保药品目录明日发布","app.media.4_3_10"],]
  //市场
  build() {
    Column(){
      List(){
        ForEach(this.jianbao,(item:string[],index:number)=>{
          ListItem(){
            Row(){
              //左边
              Row(){
                Image($r(item[2]))
                  .width(70)
              }.layoutWeight(1)
              //右边
              Column(){
                //第一行
                Row(){
                  Text(item[0])
                    .fontColor("#FAFAFA")
                }.width("95%")
                .margin({bottom:15})
                //第二行
                Row(){
                  Text(`${item[1]} `)
                    .fontColor("#595959")
                    .fontSize(12)
                }.width("95%")
              }
              .layoutWeight(4)
            }
            .width("95%")
            .padding({top:3,bottom:3,left:2,right:2})//子元素与背景色，显出灰色底色
            .backgroundColor('#1C1C1C')
            .margin({left:5,right:5})//控制与屏幕边，显出黑色
            .border({width:{top:0.5,bottom:0.5},color:"#535654"})
            .justifyContent(FlexAlign.SpaceBetween)
          }

        })
      }.width("95%")
      .alignListItem(ListItemAlign.Center)

    }
    .height("100%")
  }
}
