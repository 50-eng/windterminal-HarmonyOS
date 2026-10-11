@Component
struct infoitem{
  build() {
    //头像一行
    Column(){
      Row(){
        Image($r('app.media.startIcon'))
          .width(30)
          .aspectRatio(1)//宽高比一比一
          // .height(30)
          .margin({top:10})
          .borderRadius(15)
        Text("小红")
          .fontSize(13)
          .fontColor(Color.Gray)
          .margin({top:10,left:8})
      }.width('100%')
      Row(){
        Text('人不轻狂罔少年')
          .fontSize(13)
          .fontColor(Color.Black)
          .margin({top:10,left:40,bottom:8})
      }.width('100%')
    }.padding({left:15,right:15})
  }
}
export {infoitem}