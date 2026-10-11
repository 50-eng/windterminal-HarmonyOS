import {router} from '@kit.ArkUI'
import {zixun} from './zixun'
import {shichang1} from './shichang'
import {zixuangu} from './zi_xuangu'
import {gongju} from '../shouye_model/gongjulan'
import {renmen} from '../shouye_model/renmengupiao'
import {chuiyi} from '../shouye_model/huiyi'
import {yanbao} from '../shouye_model/yanbaojinxuan'
import {Ai} from './ai'

@Entry
@Component
struct Index {
  @State name: string = ''//姓名
  @State age: string = ''//年龄

  aboutToAppear(): void {
    //获取路由参数
    let params = router.getParams() as Record<string, string | number>
    this.name = params['name'] as string ?? ''
    this.age =( params['age'] as number ?? 0).toString()
  }


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
          Column(){
            //搜索栏
            Row(){
              //点击跳转栏
              Row(){
                Image($r('app.media.wode'))
                  .width(45)
                  .onClick(()=>{
                    router.pushUrl({url:'pages/people_center',
                      params:{
                        name:this.name,
                        age:20
                      }
                    })
                  })
              }.width(0)
              .layoutWeight(1)
              //输入框栏
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
                  .onClick(()=>{
                    console.log("",this.name)
                  })
              }.border({color:'#F70A13',width:4})
              .borderRadius(25)
              .justifyContent(FlexAlign.SpaceBetween)
              .height(40)
              .width(0)
              .layoutWeight(5)


            }.width("100%")

            //工具栏
            gongju()
              .margin({top:15})

            //固定图片
            Image($r('app.media.1_3'))
              .width("95%")
              .borderRadius(10)
              .margin({top:25})

            //热门股票
            renmen()
              .margin({top:25})

            //3c会议
            chuiyi()
              .margin({top:25})

            //研报精选
            yanbao()
              .margin({top:25})

          }
        }
        .height("100%")
        .onReachEnd(() => {
          console.log('触底')
        })
      }.tabBar(this.myBuilder(0, '首页', $r('app.media.1_1'), $r('app.media.1_2')))
      //市场
      TabContent(){
        shichang1()
      }.tabBar(this.myBuilder(1,"市场",$r('app.media.2_1'),$r('app.media.2_2')))

      //ai
      TabContent(){
        Ai()
      }.tabBar(this.myBuilder(2,"ai",$r('app.media.zhushou'),$r('app.media.zhushou')))


      //自选
      TabContent(){
        zixuangu()
      }.tabBar(this.myBuilder(3,"自选",$r('app.media.3_1'),$r('app.media.3_2')))

      //资讯
      TabContent(){
        zixun()
      }.tabBar(this.myBuilder(4,"咨讯",$r('app.media.4_11'),$r('app.media.4_22')))

    }.onChange((index: number) => {
      // console.log('激活的索引', index)
      this.selectedIndex = index
    })
    .animationDuration(1)
    .backgroundColor(Color.Black)
    .expandSafeArea([SafeAreaType.SYSTEM])
    .height("100%")
  }

}
