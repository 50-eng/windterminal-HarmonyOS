import http from '@ohos.net.http';
export {Ai}
@Entry
@Component
struct Ai {
  @State message: string = '你好';
  @State index:number=0
  @State reques:string[] = [];
  @State respon: string[] = [];

  @Builder
  zujian(){
    Column(){
      ForEach(this.reques,(it:string,index:number)=>{
        Column(){
          Row(){
            Row(){
              Text(this.reques[index])
                .fontSize(20)
                .fontColor(Color.White)
            }.backgroundColor("#575353")
            .border({width:1,color:"#575353"})
            .borderRadius(10)
            .padding({left:3,right:3,top:5,bottom:5})
          }.justifyContent(FlexAlign.End)
          .alignItems(VerticalAlign.Center)
          .margin({right:15,left:15})
          .width("90%")

          Row(){
            Image($r("app.media.zhushou"))
              .width(30)
            Row(){
              Text(this.respon[index])
                .fontSize(20)
                .fontColor(Color.White)
            }.backgroundColor("#575353")
            .border({width:1,color:"#575353"})
            .borderRadius(10)
            .padding({left:3,right:3,top:5,bottom:5})
            .margin({left:5})
          }.
          justifyContent(FlexAlign.Start)
          .alignItems(VerticalAlign.Center)
          .width("80%")
          .margin({top:10,left:15,right:15})
          // .backgroundColor(Color.Blue)
        }.margin({top:10})
      })
    }
  }

  build() {
    Column(){
      Row(){
        Image($r("app.media.app_fengmian"))
          .width(25)
        Text(" Alice Chat")
          .fontSize(23)
          .fontColor(Color.White)
      }
      .height(35)
      .width("100%")
      .justifyContent(FlexAlign.Center)

      Row(){
        Text("我是你的金融助手小鱼，有需求随时问我呀")
          .fontSize(25)
          .fontColor(Color.White)
      }
      .backgroundColor("#575353")
      .border({width:1,color:"#575353"})
      .borderRadius(10)
      .padding({left:3,right:3,top:5,bottom:5})
      .width("90%")
      .justifyContent(FlexAlign.Center)
      .margin({top:10})

      Scroll(){
        this.zujian()
      }
      .margin({top:10})
      // .backgroundColor(Color.Blue)
      Row(){
        TextInput({
          placeholder: '编辑持仓', // 占位提示
          text: this.message // 绑定输入值（单向，需配合 onChange 双向更新）
        })
          .onClick(() => {
            // // 点击后显示下拉弹窗
            // this.isDropDownShow2 = true;
            console.log('shuru_biaji编辑实时输入内容');
          })
          .layoutWeight(8)
          .height(50)
          .border({width:1,color:"#595959"})
          .fontColor("#F3F3F3")
          .fontSize(12)
          .placeholderColor('#595959') //提示词颜色
          .onChange((value: string) => {  // 监听输入变化，更新状态变量
            this.message = value;
            console.log('实时输入内容：', value);
          });
        Button("发送")
          .layoutWeight(3)
          .height(50)
          .fontSize(16)
          .fontColor('#fff')
          .backgroundColor('#007dff') // 实心背景
          .onClick(()=>{
            console.log("点击了");
            console.log("序号",this.index);
            this.reques[this.index]=(this.message);
            console.log("所有发出的请求",this.reques);
            //请求接口
            // 创建http请求实例
            const httpReq = http.createHttp();

            // 拼接URL和GET参数（将prompt参数拼接到URL的查询字符串中）
            const requestUrl = `http://localhost:9999/ai/chat?prompt=${encodeURIComponent(this.message)}`;

            // 发起GET请求
            const serve = httpReq.request(requestUrl, {
              method: http.RequestMethod.GET, // 改为GET请求
              // GET请求不需要Content-Type为application/json的请求头，也不需要extraData，因此删除对应配置
            })

            serve.then(res => {//返回结果带着之前的
              console.log("单个请求结果", res.result)
              console.log("序号",this.index)
              this.respon[this.index] = res.result as string
              // this.respon[this.index] = JSON.parse(res.result as string)

              console.log("所有请求结果", this.respon)
              this.index = this.index+1;
              // 注意：使用完http实例后建议销毁，避免资源泄漏
              httpReq.destroy();
            })
          })
          .margin({left:6})
      }.justifyContent(FlexAlign.SpaceAround)
      .alignItems(VerticalAlign.Center)
      .width("95%")
      .justifyContent(FlexAlign.Center)
      .position({x:0, y:605})
      .padding({left:5,right:5})
      // .backgroundColor(Color.Green)
    }.height("100%")
    .backgroundColor(Color.Black)
  }
}