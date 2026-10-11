import { router, Router } from '@kit.ArkUI';
//定义好接受的接口和类
interface pelpo{
  name:string
  mes:string
}
class pe implements pelpo{
  name:string
  mes:string
  constructor(name:string,mes:string) {
    this.name=name
    this.mes =mes
  }
  setname(name:string){
    this.name=name
  }
  setmes(mes:string){
    this.mes=mes
  }
}
@Entry
@Component
struct Page2 {
  //新建接收对象
  @State peo:pe = new pe('a','a')
  //一进入页面生命周期函数
  aboutToAppear(): void {
    console.log(""+JSON.stringify(router.getParams()))
    //具体拿到name和mes，传过来对象，准换成本页面对象
    const params = router.getParams() as pe
    //再把具体值传出去
    this.peo.setname(params.name)
    this.peo.setmes(params.mes)
  }

  build() {
    Column(){
      Text("跳转页")
      Text(JSON.stringify(router.getParams()))
      Text(this.peo.name)
      Text(this.peo.mes)
      Button("返回")
        .onClick(()=>{
          router.back()
        })

    }
  }
}