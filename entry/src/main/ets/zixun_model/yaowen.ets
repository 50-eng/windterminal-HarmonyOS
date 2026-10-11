import promptAction from '@ohos.promptAction';

@Component
export struct yaoweng {
  // 1. 定义全部数据源 (原数据保留在此)
  private allData: string[][] = [
    ["吴清最新发声!事关证券业未来", "Wind", "17:07", "app.media.4_1_1"],
    ["中国房地产报社评：楼市消费有活力，高质量发展就有底气", "Wind", "16:30", "app.media.4_1_2"],
    ["基金经理薪酬重大改革征求意见，强化薪酬与业绩绑定", "Wind", "16:13", "app.media.4_1_3"],
    ["一场由贸易巨头引爆的“新石油”争夺战", "Wind", "15:12", "app.media.4_1_4"],
    ["监事会正退出A股舞台", "Wind", "14:18", "app.media.4_1_5"],
    ["全球市场一周复盘(12月6日)", "Wind Al", "14:15", "app.media.4_1_6"],
    ["流感病毒进化能力变强了吗?张文宏团队发声", "Wind", "13:57", "app.media.4_1_7"],
    ["估值5.66万亿!SpaceX，重磅传来", "Wind", "13:19", "app.media.4_1_8"],
    ["固定收益统计周报：机构预期2026年一季度可能降准降息", "Wind", "11:43", "app.media.4_1_9"],
    ["氧化铝期货跌破2600元/吨关口!高成本产能面临出清", "Wind", "11:39", "app.media.4_1_10"]
  ]

  // 2. 定义当前显示的列表数据 (State)
  @State yaowen_xiao: string[][] = []

  // 3. 分页控制变量
  @State isLoading: boolean = false // 是否正在加载中
  @State isEnd: boolean = false // 是否已加载全部数据
  private pageSize: number = 4 // 限制一次显示几条 (例如4条)
  private currentIndex: number = 0 // 记录当前加载到了第几条数据

  // 组件加载时初始化第一批数据
  aboutToAppear() {
    this.loadMoreData()
  }

  // 加载更多数据的逻辑
  loadMoreData() {
    // 如果正在加载或已经没有数据，直接返回
    if (this.isLoading || this.isEnd) {
      return
    }

    this.isLoading = true

    // 模拟网络延迟，让加载过程更自然
    setTimeout(() => {
      // 计算截取的结束位置
      let nextIndex = this.currentIndex + this.pageSize

      // 如果计算的结束位置超过了总数据长度，则取总长度
      if (nextIndex >= this.allData.length) {
        nextIndex = this.allData.length
        this.isEnd = true // 标记没有更多数据了
      }

      // 截取新数据并追加到显示列表中
      // 注意：这里使用 concat 创建新数组以触发UI刷新
      const newItems = this.allData.slice(this.currentIndex, nextIndex)
      this.yaowen_xiao = this.yaowen_xiao.concat(newItems)

      // 更新当前索引
      this.currentIndex = nextIndex
      this.isLoading = false
    }, 500) // 500毫秒延迟
  }

  // 底部加载状态显示组件
  @Builder LoadingFooter() {
    Row() {
      if (this.isEnd) {
        Text("—— 我是有底线的 ——")
          .fontSize(12)
          .fontColor("#666666")
          .margin({ top: 10, bottom: 20 })
      } else if (this.isLoading) {
        Text("正在加载更多...")
          .fontSize(12)
          .fontColor("#999999")
          .margin({ top: 10, bottom: 20 })
      }
    }
    .width("100%")
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      // 头行 (保持原样)
      Row() {
        Stack({ alignContent: Alignment.Bottom }) {
          Image($r("app.media.4_1"))
            .width("100%")
            .height(200)
          Row() {
            Text("中金点评12月政治局会议：适度加力，增减并行")
              .fontColor(Color.White)
              .fontSize(17)
          }
          .width("100%")
          .backgroundColor('#80000000')
          .justifyContent(FlexAlign.Center)
          .padding({ top: 5, bottom: 5 })
        }.width("100%")
      }
      .width("95%")
      .justifyContent(FlexAlign.SpaceBetween)

      // 列表部分
      List() {
        ForEach(this.yaowen_xiao, (item: string[], index: number) => {
          ListItem() {
            Row() {
              Column() {
                // 第一行
                Row() {
                  Text(item[0])
                    .fontColor("#FAFAFA")
                }
                .width("95%")
                .margin({ bottom: 15 })

                // 第二行
                Row() {
                  Row() {
                    Text(`${item[1]} `)
                      .fontColor("#595959")
                      .fontSize(12)
                      .backgroundColor("#242424")
                    Text(item[2])
                      .fontColor("#595959")
                      .fontSize(12)
                  }
                }.width("95%")
              }
              .layoutWeight(3)

              Row() {
                Image($r(item[3]))
              }.layoutWeight(1)
            }
            .width("95%")
            .padding({ top: 5, bottom: 5, left: 2, right: 2 }) // 子元素与背景色，显出灰色底色
            .backgroundColor('#1C1C1C')
            .margin({ left: 5, right: 5, top: 5 }) // 控制与屏幕边，显出黑色
            .justifyContent(FlexAlign.SpaceBetween)
          }
        })

        // 在列表末尾添加加载状态提示
        ListItem() {
          this.LoadingFooter()
        }
      }
      .width("95%")
      .alignListItem(ListItemAlign.Center)
      .margin({ top: 5 })
      .layoutWeight(1) // 确保List占据剩余空间，这是滑动的关键
      // 核心：触底加载事件
      .onReachEnd(() => {
        this.loadMoreData()
      })
    }
    .height("100%")
    .backgroundColor(Color.Black) // 建议加上背景色以匹配深色模式
  }
}
