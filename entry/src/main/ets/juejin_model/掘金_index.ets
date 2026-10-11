import {infotop} from '../juejin_model/Infotop'
import {infoitem} from '../juejin_model/Infoitem'
@Entry
@Component
struct Index {
  num:number[] =[1,2,3,4,5,0,0,0,0,0,0,0,0,0,0,0,0,0]
  build() {
    Column(){
      //头部
      infotop()//放置自定义头部组件
        .width('100%')
        .height(60)

      //中间
      List(){
        ForEach(this.num,()=>{
          ListItem(){
            //列表项组件
            infoitem()
          }
        })

      }
      .width('100%')
      .layoutWeight(1)
      .padding({bottom:10})

      //底部
      Row(){

      }
      .width('100%')
      .height(60)
      .backgroundColor(Color.Blue)
    }
    .width('100%')
    .height('100%')
  }
}