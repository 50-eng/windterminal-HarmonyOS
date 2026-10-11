import {hanqing} from '../zi_xuangu_model/hangqing'
import {yinkui} from '../zi_xuangu_model/yingkui'
export {zixuangu}
@Component
struct zixuangu{
  @State head:string[]=['行情','盈亏']
  @State selectedIndex:number = 0
  @Builder
  head_styel(name:string,itemIndex: number){
    Text(name)
      .fontColor(itemIndex == this.selectedIndex ? Color.White : '#C5C5C5')
      .fontWeight(itemIndex == this.selectedIndex ? FontWeight.Bold : FontWeight.Normal)
  }
  build() {
    Scroll(){
      Column(){
        Row(){
          Image($r("app.media.app_fengmian"))
            .width(25)
          Text(" 我的自选股")
            .fontSize(23)
            .fontColor(Color.White)
        }
        .height(35)
        .width("100%")
        .justifyContent(FlexAlign.Center)
        Tabs(){
          //'行情'
          TabContent(){
            hanqing()
          }
          .tabBar(this.head_styel(this.head[0],0))

          //'盈亏'
          TabContent(){
            yinkui()
          }
          .tabBar(this.head_styel(this.head[1],1))
        }.onChange((index: number) => {
          // console.log('激活的索引', index)
          this.selectedIndex = index
        })
      }
    }.height("100%")
  }
}