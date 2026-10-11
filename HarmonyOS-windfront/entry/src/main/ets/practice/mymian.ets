@Preview
@Component
export struct mymian{
  @State biao:string =''
  @State num:number = 0
  build() {
    Column(){
      Text(this.biao)
      Row(){
        Text(this.num.toString())
        Button('按钮')
          .onClick(()=>{
            this.num = this.num+1
            console.log(''+this.num)
          })
      }
    }.margin({bottom:20})
  }
}