import { promptAction } from '@kit.ArkUI'

@Component
export struct quanqiu {
  // ==================== 1. 原有数据源 (保持不变) ====================
  @State meishi: string[][] = [["道琼斯", "47882.90", "+408.44", "+0.86%"], ["纳斯达克", "23454.09", "+40.42", "+0.17%"], ["标普500", "6849.72", "+20.35", "+0.30%"]
    , ["多伦多300", "31160.54", "+111.26 ", "+0.36%"], ["巴西", "161766.19", "+673.94", "+0.42%"], ["墨西哥MXX", "63597.44", "-223.17", "-0.35%"]]

  @State ofei: string[][] = [["英国富时", "9693.58", "+1.51", "+0.02%"], ["法国", "8116.76", "+29.34", "+0.36%"], ["德国", "23866.91", "+173.20", "+0.73%"]
    , ["意大利", "43387.52", "+6.88", "+0.02%"], ["俄罗斯", "2659.93", "+8.22", "+0.31%"], ["欧洲", "5714.03", "+19.47", "+0.34%"]]

  @State yatai: string[][] = [["日经225", "51028.42", "+1163.74", "+2.33%"], ["韩国综合", "4028.51", "-7.79", "-0.19%"], ["新加坡海峡", "4535.14", "-19.38", "-0.43%"]
    , ["澳洲标普", "8618.40", "-0.40", "0.00%"], ["印度", "85265.32", "+158.51", "+0.19%"], ["MSCI台湾", "1094.96", "-0.79", "-0.07%"]
    , ["上证指数", "3875.79", "-2.21", "-0.06%"], ["深证成指", "13006.72", "+51.46", "+0.40%"], ["恒生指数", "25935.90", "+175.17", "+0.68%"]]

  @State quanqiu: string[][] = [["全球", "1008.40", "+1.97", "+0.20%"], ["发达市场", "4410.91", "+8.47", "+0.19%"], ["新兴市场", "1375.95", "+3.00", "+0.22%"]
    , ["欧洲", "2556.96", "+14.24", "+0.56%"], ["亚洲", "208.24", "-0.08", "-0.04%"], ["太平洋地区", "3705.71", "+64.31", "+1.77%"]
    , ["欧澳远东", "2840.31", "+22.84", "+0.81%"], ["亚洲新兴市", "758.53", "+1.88", "+0.25%"], ["欧非中东新", "250.03", "+0.53", "+0.21%"]]

  // ==================== 2. 新增：触底加载相关变量 ====================
  @State extraList: string[][] = [] // 存放触底加载出来的更多数据
  @State isLoading: boolean = false // 是否正在加载
  @State pageIndex: number = 0 // 模拟页码

  // 模拟触底加载逻辑：从现有数据中循环提取，模拟“更多真实数据”
  loadMoreData() {
    if (this.isLoading) {
      return
    }
    this.isLoading = true

    // 模拟网络延迟 1秒
    setTimeout(() => {
      // 定义一个包含所有真实数据的大池子用于模拟
      const allRealDataSource = [...this.yatai, ...this.meishi, ...this.ofei, ...this.quanqiu]

      // 每次取 6 条数据模拟一页
      const pageSize = 6
      const start = (this.pageIndex * pageSize) % allRealDataSource.length
      let newData: string[][] = []

      for (let i = 0; i < pageSize; i++) {
        // 使用取模运算循环读取数据，实现无限加载真实数据的效果
        const item = allRealDataSource[(start + i) % allRealDataSource.length]
        // 这里为了区分，我们在名称后面加一个(更)字，实际开发不需要
        newData.push([item[0], item[1], item[2], item[3]])
      }

      this.extraList = [...this.extraList, ...newData]
      this.pageIndex++
      this.isLoading = false
    }, 1000)
  }

  // ==================== 3. 原有 Builder (保持不变) ====================
  @Builder
  zujian(item: number, col1: string, col2: string) {
    Row() {
      Column() {
        Text(this.meishi[item][0])
          .fontColor(Color.White)
          .fontSize(14)
        Text(this.meishi[item][1].toString())
          .fontColor(col1)
          .margin({ top: 3 })
        Row() {
          Text(this.meishi[item][2])
            .fontColor(col2)
            .fontSize(12)
          Text(this.meishi[item][3])
            .fontColor(col2)
            .fontSize(12)
        }.justifyContent(FlexAlign.SpaceBetween)
        .width("100%")
        .margin({ top: 3 })
      }
    }.backgroundColor('#1C1C1C')
    .padding({ left: 12, right: 12, top: 8, bottom: 8 })
  }

  @Builder
  zujian2(item: number, col1: string, col2: string) {
    Row() {
      Column() {
        Text(this.ofei[item][0])
          .fontColor(Color.White)
          .fontSize(14)
        Text(this.ofei[item][1].toString())
          .fontColor(col1)
          .margin({ top: 3 })
        Row() {
          Text(this.ofei[item][2])
            .fontColor(col2)
            .fontSize(12)
          Text(this.ofei[item][3])
            .fontColor(col2)
            .fontSize(12)
        }.justifyContent(FlexAlign.SpaceBetween)
        .width("100%")
        .margin({ top: 3 })
      }
    }.backgroundColor('#1C1C1C')
    .padding({ left: 12, right: 12, top: 8, bottom: 8 })
  }

  @Builder
  zujian3(item: number, col1: string, col2: string) {
    Row() {
      Column() {
        Text(this.yatai[item][0])
          .fontColor(Color.White)
          .fontSize(14)
        Text(this.yatai[item][1].toString())
          .fontColor(col1)
          .margin({ top: 3 })
        Row() {
          Text(this.yatai[item][2])
            .fontColor(col2)
            .fontSize(12)
          Text(this.yatai[item][3])
            .fontColor(col2)
            .fontSize(12)
        }.justifyContent(FlexAlign.SpaceBetween)
        .width("100%")
        .margin({ top: 3 })
      }
    }.backgroundColor('#1C1C1C')
    .padding({ left: 12, right: 12, top: 8, bottom: 8 })
  }

  @Builder
  zujian4(item: number, col1: string, col2: string) {
    Row() {
      Column() {
        Text(this.quanqiu[item][0])
          .fontColor(Color.White)
          .fontSize(14)
        Text(this.quanqiu[item][1].toString())
          .fontColor(col1)
          .margin({ top: 3 })
        Row() {
          Text(this.quanqiu[item][2])
            .fontColor(col2)
            .fontSize(12)
          Text(this.quanqiu[item][3])
            .fontColor(col2)
            .fontSize(12)
        }.justifyContent(FlexAlign.SpaceBetween)
        .width("100%")
        .margin({ top: 3 })
      }
    }.backgroundColor('#1C1C1C')
    .padding({ left: 12, right: 12, top: 8, bottom: 8 })
  }

  // ==================== 4. 新增：通用的数据渲染组件 ====================
  // 这个组件用于渲染加载出来的额外数据，自动根据涨跌判断颜色
  @Builder
  zujianGeneral(data: string[]) {
    Row() {
      Column() {
        Text(data[0]) // 名称
          .fontColor(Color.White)
          .fontSize(14)
          .maxLines(1)
          .textOverflow({overflow: TextOverflow.Ellipsis})

        // 自动判断颜色：包含 '-' 号为绿色，否则为红色
        Text(data[1]) // 指数
          .fontColor(data[2].includes('-') ? "#0AF650" : "#FB0610")
          .margin({ top: 3 })

        Row() {
          Text(data[2]) // 涨跌额
            .fontColor(data[2].includes('-') ? "#0AF650" : "#FB0610")
            .fontSize(12)
          Text(data[3]) // 涨跌幅
            .fontColor(data[3].includes('-') ? "#0AF650" : "#FB0610")
            .fontSize(12)
        }.justifyContent(FlexAlign.SpaceBetween)
        .width("100%")
        .margin({ top: 3 })
      }
    }.backgroundColor('#1C1C1C')
    .padding({ left: 12, right: 12, top: 8, bottom: 8 })
    .width("100%")
  }

  // ==================== 5. 新增：底部 Loading 条 ====================
  @Builder
  LoadingFooter() {
    Row() {
      if (this.isLoading) {
        LoadingProgress().width(20).height(20).color(Color.White)
        Text(" 正在加载更多行情...").fontColor(Color.Gray).fontSize(14)
      } else {
        // 可选：如果不加载时显示提示，可取消注释
        // Text("上拉加载更多").fontColor(Color.Gray).fontSize(12)
      }
    }
    .width("100%")
    .height(40)
    .justifyContent(FlexAlign.Center)
    // .backgroundColor("#1C1C1C")
  }

  build() {
    Scroll() {
      Column() {
        // ################## 原有布局代码 START (完全未动) ##################
        //美洲市场
        Column() {
          //头行
          Row() {
            Row() {
              Text("美洲市场")
                .fontColor(Color.White)
              Image($r('app.media.zhuanfa'))
                .width(25)
                .padding({ left: 10 })
            }
            Row() {
              Image($r('app.media.fanhui'))
                .width(15)
            }
          }
          .width("95%")
          .justifyContent(FlexAlign.SpaceBetween)

          Column() {
            //1-1
            Row() {
              //1-1-1
              Row() {
                this.zujian(0, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5 })
              .backgroundColor('#1C1C1C')
              //1-1-2
              Row() {
                this.zujian(1, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5, right: 5 })
              .backgroundColor('#1C1C1C')
              //1-1-3
              Row() {
                this.zujian(2, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ right: 5 })
              .backgroundColor('#1C1C1C')
            }.margin({ bottom: 5 })
            //1-2
            Row() {
              //1-2-1
              Row() {
                this.zujian(3, "#0AF650", "#0AF650")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5 })
              .backgroundColor('#1C1C1C')
              //1-2-2
              Row() {
                this.zujian(4, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5, right: 5 })
              .backgroundColor('#1C1C1C')
              //1-2-3
              Row() {
                this.zujian(5, "#0AF650", "#0AF650")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ right: 5 })
              .backgroundColor('#1C1C1C')
            }.margin({ bottom: 5 })
          }.width("95%")
          .margin({ top: 10 })
        }
        //欧非中东
        Column() {
          //头行
          Row() {
            Row() {
              Text("欧非中东")
                .fontColor(Color.White)
              Image($r('app.media.zhuanfa'))
                .width(25)
                .padding({ left: 10 })
            }
            Row() {
              Image($r('app.media.fanhui'))
                .width(15)
            }
          }
          .width("95%")
          .justifyContent(FlexAlign.SpaceBetween)

          Column() {
            //1-1
            Row() {
              //1-1-1
              Row() {
                this.zujian2(0, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5 })
              .backgroundColor('#1C1C1C')
              //1-1-2
              Row() {
                this.zujian2(1, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5, right: 5 })
              .backgroundColor('#1C1C1C')
              //1-1-3
              Row() {
                this.zujian2(2, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ right: 5 })
              .backgroundColor('#1C1C1C')
            }.margin({ bottom: 5 })
            //1-2
            Row() {
              //1-2-1
              Row() {
                this.zujian2(3, "#0AF650", "#0AF650")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5 })
              .backgroundColor('#1C1C1C')
              //1-2-2
              Row() {
                this.zujian2(4, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5, right: 5 })
              .backgroundColor('#1C1C1C')
              //1-2-3
              Row() {
                this.zujian2(5, "#0AF650", "#0AF650")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ right: 5 })
              .backgroundColor('#1C1C1C')
            }.margin({ bottom: 5 })
          }.width("95%")
          .margin({ top: 10 })
        }.margin({ top: 15 })
        //亚太市场
        Column() {
          //头行
          Row() {
            Row() {
              Text("亚太市场")
                .fontColor(Color.White)
              Image($r('app.media.zhuanfa'))
                .width(25)
                .padding({ left: 10 })
            }
            Row() {
              Image($r('app.media.fanhui'))
                .width(15)
            }
          }
          .width("95%")
          .justifyContent(FlexAlign.SpaceBetween)

          Column() {
            //1-1
            Row() {
              //1-1-1
              Row() {
                this.zujian3(0, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5 })
              .backgroundColor('#1C1C1C')
              //1-1-2
              Row() {
                this.zujian3(1, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5, right: 5 })
              .backgroundColor('#1C1C1C')
              //1-1-3
              Row() {
                this.zujian3(2, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ right: 5 })
              .backgroundColor('#1C1C1C')
            }.margin({ bottom: 5 })
            //1-2
            Row() {
              //1-2-1
              Row() {
                this.zujian3(3, "#0AF650", "#0AF650")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5 })
              .backgroundColor('#1C1C1C')
              //1-2-2
              Row() {
                this.zujian3(4, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5, right: 5 })
              .backgroundColor('#1C1C1C')
              //1-2-3
              Row() {
                this.zujian3(5, "#0AF650", "#0AF650")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ right: 5 })
              .backgroundColor('#1C1C1C')
            }.margin({ bottom: 5 })
            //1-3
            Row() {
              //1-2-1
              Row() {
                this.zujian3(6, "#0AF650", "#0AF650")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5 })
              .backgroundColor('#1C1C1C')
              //1-2-2
              Row() {
                this.zujian3(7, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5, right: 5 })
              .backgroundColor('#1C1C1C')
              //1-2-3
              Row() {
                this.zujian3(8, "#0AF650", "#0AF650")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ right: 5 })
              .backgroundColor('#1C1C1C')
            }.margin
          }.width("95%")
          .margin({ top: 10 })
        }.margin({ top: 15 })
        //全球指数
        Column() {
          //头行
          Row() {
            Row() {
              Text("全球指数")
                .fontColor(Color.White)
              Image($r('app.media.zhuanfa'))
                .width(25)
                .padding({ left: 10 })
            }
            Row() {
              Image($r('app.media.fanhui'))
                .width(15)
            }
          }
          .width("95%")
          .justifyContent(FlexAlign.SpaceBetween)

          Column() {
            //1-1
            Row() {
              //1-1-1
              Row() {
                this.zujian4(0, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5 })
              .backgroundColor('#1C1C1C')
              //1-1-2
              Row() {
                this.zujian4(1, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5, right: 5 })
              .backgroundColor('#1C1C1C')
              //1-1-3
              Row() {
                this.zujian4(2, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ right: 5 })
              .backgroundColor('#1C1C1C')
            }.margin({ bottom: 5 })
            //1-2
            Row() {
              //1-2-1
              Row() {
                this.zujian4(3, "#0AF650", "#0AF650")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5 })
              .backgroundColor('#1C1C1C')
              //1-2-2
              Row() {
                this.zujian4(4, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5, right: 5 })
              .backgroundColor('#1C1C1C')
              //1-2-3
              Row() {
                this.zujian4(5, "#0AF650", "#0AF650")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ right: 5 })
              .backgroundColor('#1C1C1C')
            }.margin({ bottom: 5 })
            //1-3
            Row() {
              //1-2-1
              Row() {
                this.zujian4(6, "#0AF650", "#0AF650")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5 })
              .backgroundColor('#1C1C1C')
              //1-2-2
              Row() {
                this.zujian4(7, "#FB0610", "#FB0610")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ left: 5, right: 5 })
              .backgroundColor('#1C1C1C')
              //1-2-3
              Row() {
                this.zujian4(8, "#0AF650", "#0AF650")
              }.layoutWeight(2)
              .justifyContent(FlexAlign.Center)
              .margin({ right: 5 })
              .backgroundColor('#1C1C1C')
            }.margin
          }.width("95%")
          .margin({ top: 10 })
        }.margin({ top: 15 })
        // ################## 原有布局代码 END ##################

        // ################## 6. 新增：加载更多数据的展示区域 ##################
        if (this.extraList.length > 0) {
          Column() {
            Row() {
              Text("更多市场资讯")
                .fontColor(Color.White)
                .margin({ left: 10, top: 15, bottom: 5 })
            }.width("100%")

            Grid() {
              ForEach(this.extraList, (item: string[]) => {
                GridItem() {
                  this.zujianGeneral(item)
                }
              })
            }
            .columnsTemplate('1fr 1fr 1fr') // 保持三列布局，和上面一致
            .rowsGap(5)
            .columnsGap(5)
            .width("95%")
            .margin({ top: 5 })
            .height(100 * Math.ceil(this.extraList.length / 3)) // 动态计算Grid高度
          }
        }

        // 底部加载指示器
        this.LoadingFooter()
      }
    }
    .height("100%")
    .align(Alignment.Top)
    // ################## 7. 新增：Scroll 组件触底监听 ##################
    .onScrollEdge((side: Edge) => {
      if (side == Edge.Bottom) {
        // 触底触发加载更多
        this.loadMoreData()
      }
    })
  }
}
