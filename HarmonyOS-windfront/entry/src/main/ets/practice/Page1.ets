import {router} from '@kit.ArkUI'
@Entry
@Component
struct Index {
  @State texnam:string =''
  build() {
    Column(){
      Text('首页')
      TextInput({
        text:$$this.texnam,
        placeholder:"请输入姓名"
      })
      Button('跳转')
        .onClick(()=>{
          router.pushUrl({
            url:'practice/Page2',
            params:{
              name:this.texnam,
              mes:"传递成功"
            }
          })
        })
    }

  }
}