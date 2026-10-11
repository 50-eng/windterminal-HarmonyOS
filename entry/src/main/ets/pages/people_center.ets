import {router} from '@kit.ArkUI'
import { url } from '@kit.ArkTS';
@Entry
@Component
struct People_center {
  @State name: string = ''//姓名
  @State age: string = ''//年龄

  aboutToAppear(): void {
    //获取路由参数
    let params = router.getParams() as Record<string, string | number>
    this.name = params['name'] as string ?? ''
    this.age =( params['age'] as number ?? 0).toString()
  }

  //登录
  build() {
    Column(){
      //顶部导航栏
      Row(){
        Text('<')
          .fontSize(24)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Medium)
          .margin({left:16})
          .onClick(()=>{
            router.back()
          })

        Image($r('app.media.tubiao'))
          .width(24)
          .height(24)
          .margin({left:10})

        Text('个人中心')
          .fontSize(18)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Medium)
          .margin({left:80})

      }
      .width('100%')
      .height(56)
      .alignItems(VerticalAlign.Center)



      //选项
      Scroll(){
        Column(){
          //头像昵称
          Column(){
            Image($r('app.media.touxiang'))
              .width(80)
              .height(80)
              .borderRadius(5)

            Row(){
              Text(this.name)
                .fontSize(16)
                .fontColor(Color.White)
                .margin({top:15,right:15})

            }
          }
          .width('100%')
          .padding({top:32,bottom:40})

          //基本资料
          Row(){
            Text('基本资料')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          Row(){
            Text('账号安全')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          Row(){
            Text('通用设置')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          Row(){
            Text('我的收藏')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          Row(){
            Text('帮助与反馈')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          //隐私相关
          Row(){
            Text('隐私相关')
              .fontSize(14)
              .fontColor('#6a6a6a')
          }
          .backgroundColor('#373737')
          .width('100%')
          .padding({top:10,bottom:10,left:10})

          Row(){
            Text('隐私设置')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          Row(){
            Text('隐私政策')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          Row(){
            Text('服务协议')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          Row(){
            Text('个人信息收集清单')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          Row(){
            Text('第三方信息共享清单')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          //其他
          Row(){
            Text('其他')
              .fontSize(14)
              .fontColor('#6a6a6a')
          }
          .backgroundColor('#373737')
          .width('100%')
          .padding({top:10,bottom:10,left:10})

          Row(){
            Text('模型备案公示')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          Row(){
            Text('关于')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          Row(){
            Text('推荐此APP给朋友')
              .fontSize(16)
              .fontColor(Color.White)

            Image($r('app.media.yjt'))
              .width(15)
              .height(15)
          }
          .width('100%')
          .padding({top:10,bottom:10,left:10,right:10})
          .justifyContent(FlexAlign.SpaceBetween)

          //退出账号
          Button('退出账号')
            .width('90%')
            .height(44)
            .fontColor('#bc2f3b')
            .fontSize(16)
            .backgroundColor('#131313')
            .margin({top:20,bottom:120})
            .onClick(()=>{
              router.replaceUrl({url:'pages/Index'})
            })
        }
        .width('100%')
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Auto)
      // .scrollBarColor(Color.White)
      // .scrollBarWidth(3)
      .scrollable(ScrollDirection.Vertical)
      .backgroundColor('#131313')

    }
    .height('100%')
    .width('100%')
    .backgroundColor('#131313')
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}
