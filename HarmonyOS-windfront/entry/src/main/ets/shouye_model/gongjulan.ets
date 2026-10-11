export {gongju}
@Preview
@Component
struct gongju{
  @State imgs:string[] = ['app.media.1_2_1','app.media.1_2_2','app.media.1_2_3','app.media.1_2_4','app.media.1_2_5','app.media.1_2_6']
  @State names:string[] =["扫一扫","3C会议","全球企业库","组合管理","研报平台","更多",]
  @Builder
  zujian(item:number){
    ListItem(){
      Column(){
        Image($r(this.imgs[item]))
          .width(45)
          .margin({bottom:3})
        Row(){
          Text(this.names[item])
            .fontColor(Color.White)
        }
      }
    }
  }
  build() {
    List(){
      this.zujian(0)
      this.zujian(1)
      this.zujian(2)
      this.zujian(3)
      this.zujian(4)
      this.zujian(5)
    }.width("100%")
    .lanes(4,25)
    .padding({left:10,right:10})
    .alignListItem(ListItemAlign.Center)
    // .backgroundColor('#4D7EE1')
  }
}