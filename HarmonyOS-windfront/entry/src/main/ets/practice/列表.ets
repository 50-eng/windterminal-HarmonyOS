import {infotop} from '../juejin_model/Infotop'

@Entry
@Component
struct Index {

  build() {
    Column(){
      //头部
      infotop()//放置自定义头部组件
        .width('100%')
        .height(60)

      //中间
      Column(){

      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor(Color.Orange)
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