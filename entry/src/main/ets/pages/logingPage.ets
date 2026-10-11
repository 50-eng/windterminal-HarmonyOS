import {router} from '@kit.ArkUI'
import { url } from '@kit.ArkTS';
@Entry
@Component
struct logepage{
  @State zhanghao: string = '';
  @State mima: string = '';
  build() {
    Column(){
      Column(){
        Image($r("app.media.tubiao"))
          .width(90)
        Text("Wind金融终端")
      }
      Column(){
        //第一行
        Row(){
          Text("+86")
            .fontColor("#FEFEFE")
          Text("   |")
            .fontColor("#595959")
            .fontWeight(FontWeight.Bold)
          //手机号
          TextInput({
            placeholder: '手机号', // 占位提示
            text: this.zhanghao // 绑定输入值（单向，需配合 onChange 双向更新）
          })
            .width('90%')
            .height(40)
            .fontColor("#F3F3F3")
            .placeholderColor('#595959') //提示词颜色
            .maxLength(10) // 限制最大长度为11
              // 监听输入变化，更新状态变量
            .onChange((value: string) => {
              this.zhanghao = value;
              console.log('实时输入内容：', value);
            });
        }.width("80%")
        .border({width: {bottom:1},color:{bottom:"#595959"}})

        //第二行
        Row(){
          Text("密码")
            .fontColor("#FEFEFE")
          Text("   |")
          //请输入密码
          TextInput({
            placeholder: '请输入密码', // 占位提示
            text: this.mima // 绑定输入值（单向，需配合 onChange 双向更新）
          })
            .width('90%')
            .height(40)
            .fontColor("#F3F3F3")
            .placeholderColor('#595959') //提示词颜色
            .type(InputType.Password) // 密码类型，输入内容隐藏为●
              // 监听输入变化，更新状态变量
            .onChange((value: string) => {
              this.mima = value;
              console.log('实时输入内容：', value);
              console.log('inputValue：', this.mima);
            });
        }.width("80%")
        .border({width: {bottom:1},color:{bottom:"#595959"}})
      }.margin({top:40})

      Button("登录")
        .width("80%")
        .height(40)
        .fontSize(16)
        .fontColor('#fff')
        .backgroundColor('#007dff') // 实心背景
        .borderRadius(0)
        .margin({top:40})

    }.height("100%")
    .width("100%")
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Black)
  }
}



