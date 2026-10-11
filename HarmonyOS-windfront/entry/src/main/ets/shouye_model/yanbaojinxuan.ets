export {yanbao}
@Component
struct yanbao{
  @State names:string[][] =[["aaa",'bbb','sss','aaaa',"qqqq"],["aaaaaa",'bbb','sss','aaaa',"qqqq"]]
  @State yanbao_citiao:string[][] = [["浦银国际2026年市场展望：拥抱新资产","策略研究","林闻嘉 金晓雯 赖烨烨","浦银国际 12-01"]
    ,["国金证券2026年年度中国权益市场展望策略：世界的中国","策略研究","牟一凌 王况炜 方智勇","国金证券 12-03"]
    ,["方正证券国防军工行业深度报告：商业航天，火箭先行","行业研究","李鲁靖 刘明洋 黄凯伦","方正证券 11-29"]]
  //市场
  build() {
    Column(){
      //头行
      Row(){
        Row(){
          Text("研报精选")
            .fontColor(Color.White)
          Image($r('app.media.zhuanfa'))
            .width(25)
            .padding({left:10})
        }
        Row(){
          Image($r('app.media.fanhui'))
            .width(20)
        }
      }
      .width("95%")
      .justifyContent(FlexAlign.SpaceBetween)

      List(){
        ForEach(this.yanbao_citiao,(item:string[],index:number)=>{
          ListItem(){
            Column(){
              //第一行
              Row(){
                Text(item[0])
                  .fontColor("#FAFAFA")
              }.width("95%")
              .margin({bottom:15})
              //第二行
              Row(){
                Row(){
                  Text(`${item[1]} `)
                    .fontColor("#595959")
                    .fontSize(12)
                    .backgroundColor("#242424")
                  Text(item[2])
                    .fontColor("#595959")
                    .fontSize(12)
                }
                Row(){
                  Text(`${item[3]} `)
                    .fontColor("#595959")
                    .fontSize(12)

                }
              }.width("95%")
              .justifyContent(FlexAlign.SpaceBetween)
            }
            // .backgroundColor('#EC08EE')
          }.width("95%")
          .padding({top:5,bottom:5,left:2,right:2})//子元素与背景色，显出灰色底色
          .backgroundColor('#1C1C1C')
          .margin({left:5,right:5,top:5})//控制与屏幕边，显出黑色

        })
      }.width("95%")
      .alignListItem(ListItemAlign.Center)
      .margin({top:5})
    }
  }
}
