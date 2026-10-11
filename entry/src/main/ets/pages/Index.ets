import {router} from '@kit.ArkUI';
import { List, url } from '@kit.ArkTS';
import http from '@ohos.net.http';
const API_URL='http://192.168.56.1';
const CARE_API = `${API_URL}/login`
interface Form{
  username:string,
  password:string
}
interface user{
  id:string,
  username:string,
  password:string
}

export interface ResponseResult {
  code: number;
  msg: string;
  data: user | null; // data可以是User对象或null
}

@Entry
@Component
struct logepage{

  @State form:Form = {
    username:'',
    password:''
  }
  @State bool: boolean = true
  build() {
    Column(){
      Column(){
        Image($r("app.media.tubiao"))
          .width(90)
        Text("Wind金融终端")
          .fontColor("#FEFEFE")
          .fontSize(20)
          .margin({top:5})
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
            text: this.form.username // 绑定输入值（单向，需配合 onChange 双向更新）
          })
            .width('90%')
            .height(40)
            .fontColor("#F3F3F3")
            .placeholderColor('#595959') //提示词颜色
            .maxLength(10) // 限制最大长度为11
              // 监听输入变化，更新状态变量
            .onChange((value: string) => {
              this.form.username = value;
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
            text: this.form.password // 绑定输入值（单向，需配合 onChange 双向更新）
          })
            .width('90%')
            .height(40)
            .fontColor("#F3F3F3")
            .placeholderColor('#595959') //提示词颜色
            .type(InputType.Password) // 密码类型，输入内容隐藏为●
              // 监听输入变化，更新状态变量
            .onChange((value: string) => {
              this.form.password = value;
              console.log('实时输入内容：', this.form.password);
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
        // .onClick(()=>{router.replaceUrl({url:'pages/zhuyemian'})})
        .onClick(()=>{

          //请求接口
          const httpReq = http.createHttp()
          const serve =httpReq.request('http://localhost:9999/login',{
            method:http.RequestMethod.POST,
            header:{
              "Content-Type":"application/json"
            },
            extraData:JSON.stringify({
              username:this.form.username,
              password:this.form.password
            })
          })
          serve.then(res=>{
            console.log("",res.result);
            const resultObj = JSON.parse(res.result as string) as ResponseResult;
            console.log('解析后的result对象：', resultObj);

            // ========== 步骤3：打印具体字段 ==========
            console.log('状态码code：', resultObj.code);
            console.log('提示信息msg：', resultObj.msg);
            console.log('业务数据data：', JSON.stringify(resultObj.data?.username));//有用

            if (resultObj.code == 200) {
              router.replaceUrl({
                url:'pages/zhuyemian',
                params:{
                  name:this.form.username,
                  age:20
                }
              },router.RouterMode.Single)

            }
            else {
              AlertDialog.show({
                title: '提示', // 弹窗标题（可选）
                message: '登录失败，请检查账号或密码', // 提示内容
                confirm: {
                  value: '确定',
                  action: () => {
                    // 点击“确定”后的回调（可选，比如清空输入框、返回登录页等）
                    console.log('用户点击了确定');
                  }
                },
                autoCancel: true // 点击弹窗外部是否自动关闭，默认true
              })
            }
          })

        })

      Button("注册")
        .width("80%")
        .height(40)
        .fontSize(16)
        .fontColor('#fff')
        .backgroundColor('#007dff') // 实心背景
        .borderRadius(0)
        .margin({top:20})
        .onClick(()=>{
          //请求接口
          const httpReq = http.createHttp()
          const serve =httpReq.request('http://localhost:9999/add',{
            method:http.RequestMethod.POST,
            header:{
              "Content-Type":"application/json"
            },
            extraData:JSON.stringify({
              username:this.form.username,
              password:this.form.password
            })
          })
          serve.then(res=>{
            console.log("",res.result);
            const resultObj = JSON.parse(res.result as string) as ResponseResult;
            console.log('解析后的result对象：', resultObj);

            // ========== 步骤3：打印具体字段 ==========
            console.log('状态码code：', resultObj.code);
            console.log('提示信息msg：', resultObj.msg);
            console.log('业务数据data：', JSON.stringify(resultObj.data?.username));//有用
          })

        })
    }.height("100%")
    .width("100%")
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Black)
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}
