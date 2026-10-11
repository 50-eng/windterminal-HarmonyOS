import {router} from '@kit.ArkUI'
@Entry
@Component
struct Index {
  // 准备状态, 存储激活的索引
  @State selectedIndex: number = 0
  @Builder
  myBuilder (itemIndex: number, title: string, img: ResourceStr, selImg:
    ResourceStr) {
    // 如果激活的是自己, 图片/文本 都需要调整样式 → 需要区分不同的 tabBar
    Column() {
      Image(itemIndex == this.selectedIndex ? selImg : img)
        .width(30)
        .margin({bottom:3})
      Text(title)
        .fontColor(itemIndex == this.selectedIndex ? Color.White : '#C5C5C5')
    }
  }
  build() {
    //Tabs分类展示
    Tabs({barPosition:BarPosition.End}){
      //首页
      TabContent(){
        //可滚动
        Scroll(){
          //首页搜索栏
          Column(){
            //搜索栏
            Row(){
              Row(){
                Image($r('app.media.wode'))
                  .width(45)
                  .onClick(()=>{
                    router.pushUrl({url:'pages/logingPage'})
                  })
              }.width(0)
              .layoutWeight(1)
              Row(){
                Row(){
                  Image($r('app.media.suo'))
                    .width(25)
                  Text("中金研究")
                    .fontColor('#FEFEFE')
                }
                Button('搜索')
                  .fontSize(18)
                  .fontColor('#FEFEFE')
                  .backgroundColor("#F70A13")
                  .borderRadius(5)
              }.border({color:'#F70A13',width:4})
              .borderRadius(25)
              .justifyContent(FlexAlign.SpaceBetween)
              .height(40)
              .width(0)
              .layoutWeight(5)


            }.width("100%")
          }.height("100%")
        }

      }.tabBar(this.myBuilder(0, '首页', $r('app.media.1_1'), $r('app.media.1_2')))
      //市场
      TabContent(){
        Text("")
      }.tabBar(this.myBuilder(1,"市场",$r('app.media.2_1'),$r('app.media.2_2')))
      //资讯
      TabContent(){
        Text("咨讯")
      }.tabBar(this.myBuilder(2,"咨讯",$r('app.media.3_1'),$r('app.media.3_2')))
    }.onChange((index: number) => {
      // console.log('激活的索引', index)
      this.selectedIndex = index
    })
    .animationDuration(1)
    .backgroundColor(Color.Black)
  }

}
