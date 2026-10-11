export { tuijiang }

@Component
struct tuijiang {
  // 原始数据源：只用这一份
  @State private tuijian_xiao: string[][] = [
    ["见证历史!刚刚，证监会发布", "中国基金报", "22小时前", "app.media.4_2_1"],
    ["突发!美国调查中国科技巨头", "21IC电子网 ", "1天前", "app.media.4_2_2"],
    ["万科已经死了", "新浪", "22小时前", "app.media.4_2_3"],
    ["IPO雷达|“军品审价+苹果外迁”双重挤压，宏明电子即将上会迎考，大笔分红又补流", "读创", "2小时前", "app.media.4_2_4"],
    ["12月4日下午，有传言称寒武纪明年将大幅提升产能，目标为填补英伟达退出中国市场的空白份额。上述消...", "Wind ", "1天前", "app.media.4_2_5"],
    ["特斯拉人形机器人又进化，美国积极推动机器人发展!详解人形机器人的机遇", "新浪", "18小时前", "app.media.4_2_6"],
    ["2025卓越竞争力金融论坛12月9日召开，9位专家领袖共议金融强国建设", "中国经营报", "2天前", "app.media.4_2_7"],
    ["2026可能是美股企业罕见的一年?", "巨亨网", "8小时前", "app.media.4_2_8"],
    ["产能提升3倍，对标华为抢占市场份额?“小作文”突袭后尾盘猛拉，寒武纪紧急辟谣", "华夏时报", "1天前", "app.media.4_2_9"],
    ["12月5日上午，“豆包手机助手发布最新公告称，已调整其AI操作手机的能力，重点对三类场景作出...", "Wind", "1天前", "app.media.4_2_10"]
  ]

  // 页面展示的数据（分页追加）
  @State private showList: string[][] = []

  // 一次加载/显示几条：改这里
  private readonly batchSize: number = 4

  // 游标：当前加载到哪里
  @State private cursor: number = 0

  // 加载状态
  @State private loading: boolean = false
  @State private hasMore: boolean = true

  aboutToAppear() {
    this.loadMore()
  }

  // 触底加载更多（带“加载更多...”提示 + 延迟模拟）
  private loadMore() {
    if (this.loading || !this.hasMore) {
      return
    }

    this.loading = true

    // 模拟网络请求延迟：你可改成 0 或 300/800 等
    setTimeout(() => {
      const start = this.cursor
      const end = Math.min(start + this.batchSize, this.tuijian_xiao.length)
      const next = this.tuijian_xiao.slice(start, end)

      if (next.length > 0) {
        this.showList = this.showList.concat(next)
        this.cursor = end
      }

      if (this.cursor >= this.tuijian_xiao.length) {
        this.hasMore = false
      }

      this.loading = false
    }, 500)
  }

  build() {
    Column() {
      List() {
        ForEach(this.showList, (item: string[], index: number) => {
          ListItem() {
            Row() {
              Column() {
                // 第一行：标题
                Row() {
                  Text(item[0])
                    .fontColor("#FAFAFA")
                }
                .width("95%")
                .margin({ bottom: 15 })

                // 第二行：来源 + 时间
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
                }
                .width("95%")
              }
              .layoutWeight(3)

              Row() {
                Image($r(item[3]))
              }
              .layoutWeight(1)
            }
            .width("95%")
            .padding({ top: 5, bottom: 5, left: 2, right: 2 })
            .backgroundColor('#1C1C1C')
            .margin({ left: 5, right: 5, top: 5 })
            .justifyContent(FlexAlign.SpaceBetween)
          }
        })

        // 底部：加载更多提示 / 没有更多
        ListItem() {
          Row() {
            if (this.loading) {
              Text("加载更多...")
                .fontColor("#8C8C8C")
                .fontSize(12)
            } else if (!this.hasMore) {
              Text("没有更多了")
                .fontColor("#8C8C8C")
                .fontSize(12)
            } else {
              // 有更多时的提示（可选）
              Text("上拉加载更多")
                .fontColor("#8C8C8C")
                .fontSize(12)
            }
          }
          .width("100%")
          .justifyContent(FlexAlign.Center)
          .padding({ top: 12, bottom: 12 })
        }
      }
      .width("95%")
      .alignListItem(ListItemAlign.Center)
      .margin({ top: 5 })
      // 触底加载：上拉到底触发
      .onReachEnd(() => {
        this.loadMore()
      })
    }
    .height("100%")
  }
}
