@Extend(Button)
function fancyButton(isfo:boolean){
  .width(46)
  .height(32)
  .fontSize(12)
  .padding({left:5,right:5})
  .backgroundColor(isfo ? '#FFFFFF' : '#F7F8FA')
  .fontColor(isfo ? '1C1C1C' : '8e9298')
  .border({width:1,color:isfo ? '#e4e5e6' : '#F7F8FA'})
}
@Component
struct infotop{
  @State but1:boolean = true
  @State but2:boolean = false
  build() {
    Row(){
      Text('全部评论')
        .fontSize(20)
        .fontColor('#222')
        .fontWeight(FontWeight.Bold)
      Row(){
        Button("最新",{stateEffect:false})
          .onClick(()=>{
            this.but1 =true
            this.but2 =false
          })
          .fancyButton(this.but1)
        Button("最热",{stateEffect:false})
          .onClick(()=>{
            this.but1 =false
            this.but2 =true
          })
          .fancyButton(this.but2)
      }.backgroundColor('#F7F8FA')
    }
    .width('100%')
    .height(60)
    .padding({ left:10,right:10 })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
export { infotop }