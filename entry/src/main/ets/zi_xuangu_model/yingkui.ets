import http from '@ohos.net.http';
export { yinkui }

let num1: number[] = []
let num2: number[] = []
let num3: number[] = []
for (let i: number = 0; i < 50; i++) {
  num1[i] = Math.floor(Math.random() * (2 - 0) + 0)
  num2[i] = Math.floor(Math.random() * (2 - 0) + 0)
  num3[i] = Math.floor(Math.random() * (2 - 0) + 0)
}

interface gu {
  stockName: string,
  stockCode: string,
  stockHold: string
}

interface YingKui {
  id: number;
  stockName: string;
  stockCode: string;
  todayProfitLoss: number;
  totalMarketValue: number;
  costPrice: number;
  currentPrice: number;
  todayPriceChange: number;
  holdQuantity: number;
}

@Component
struct yinkui {
  // ===== 全量数据源（接口返回后更新这里）=====
  @State han: string[][] = [
    ["诺德半导体", "002456", "-1.45", "412.78", "28.90", "28.76", "-0.48%", "0.25"],
    ["腾远科技", "688123", "12.34", "569.87", "8.92", "9.05", "1.56%", "0.02"]
  ]

  // ===== 实际展示数据（分页后）=====
  @State private showHan: string[][] = []

  // 一次显示/加载几条
  private readonly batchSize: number = 6
  @State private cursor: number = 0
  @State private loadingMore: boolean = false
  @State private hasMore: boolean = true

  @State touhang_name: string[] = ["股票名称", "今日盈亏", "总市值", "成本价", "现价", "今日涨跌", "持仓"]
  @State zong_name: string[] = ["今日盈亏", "总市值", "成本价", "现价", "今日涨跌", "持仓"]
  @State chazhao: string = ''
  @State bianji: string = ''
  @State shanchu: string = ''

  // 控制下拉弹窗显示
  @State isDropDownShow: boolean = false
  @State isDropDownShow2: boolean = false
  @State isDropDownShow3: boolean = false

  shuru_chazhao: gu = { stockName: '', stockCode: '', stockHold: '' }
  shuru_bianji: gu = { stockName: '', stockCode: '', stockHold: '' }
  shuru_shanchu: gu = { stockName: '', stockCode: '', stockHold: '' }

  aboutToAppear() {
    // 首屏只显示部分
    this.resetPagingAndLoadFirstPage()
  }

  // ===== 重置分页（每次 han 更新后调用）=====
  private resetPagingAndLoadFirstPage() {
    this.cursor = 0
    this.showHan = []
    this.hasMore = true
    this.loadingMore = false
    this.loadMore()
  }

  // ===== 触底加载更多（先显示提示，再追加数据）=====
  private loadMore() {
    if (this.loadingMore || !this.hasMore) {
      return
    }

    // 先打开“加载更多...”提示，让 UI 立刻可见
    this.loadingMore = true

    setTimeout(() => {
      const start = this.cursor
      const end = Math.min(start + this.batchSize, this.han.length)
      const next = this.han.slice(start, end)

      if (next.length > 0) {
        this.showHan = this.showHan.concat(next)
        this.cursor = end
      }

      if (this.cursor >= this.han.length) {
        this.hasMore = false
      }

      // 关闭提示
      this.loadingMore = false
    }, 500)
  }

  // ===== 接口返回 -> 转二维数组 -> 更新 han -> 重置分页 =====
  private applyResultToHan(resText: string) {
    const yingKuiList = JSON.parse(resText as string) as YingKui[]
    const twoDimensionalArray: string[][] = []

    yingKuiList.forEach((item) => {
      const oneDimensionalArray: string[] = [
        item.stockName,
        item.stockCode,
        item.todayProfitLoss.toString(),
        item.totalMarketValue.toFixed(2),
        item.costPrice.toFixed(2),
        item.currentPrice.toFixed(2),
        (item.todayPriceChange * 100).toFixed(2) + "%",
        item.holdQuantity.toString()
      ]
      twoDimensionalArray.push(oneDimensionalArray)
    })

    this.han = twoDimensionalArray
    this.resetPagingAndLoadFirstPage()
  }

  // ===== 左列 =====
  @Builder
  jujian1() {
    Column() {
      Row() {
        Text(this.touhang_name[0]).fontColor("#595959")
      }
      .width(120)
      .height(35)
      .justifyContent(FlexAlign.Start)
      .border({ width: { top: 1 }, color: { top: "#595959" } })

      ForEach(this.showHan, (item: string[], index: number) => {
        Column() {
          Text(item[0]).fontColor(Color.White)
          Text(item[1]).fontColor("#595959").fontSize(12)
        }
        .width(120)
        .height(55)
        .justifyContent(FlexAlign.Center)
        .border({ width: { top: 1 }, color: { top: "#595959" } })
      })
    }
  }

  // ===== 右侧列 =====
  @Builder
  jujian2(num: number) {
    Column() {
      Row() {
        Text(this.zong_name[num]).fontColor("#595959")
      }
      .width(120)
      .height(35)
      .justifyContent(FlexAlign.End)
      .padding({ right: 5 })
      .border({ width: { top: 1 }, color: { top: "#595959" } })

      ForEach(this.showHan, (it: string[], index: number) => {
        Row() {
          Text(it[num + 2]).fontColor(Color.White)
        }
        .width(120)
        .height(55)
        .justifyContent(FlexAlign.End)
        .padding({ right: 5 })
        .border({ width: { top: 1 }, color: { top: "#595959" } })
      })
    }
  }

  @Builder
  zujian_zong() {
    List() {
      ForEach(this.zong_name, (it: string, index: number) => {
        ListItem() { this.jujian2(index) }.width(120)
      })
    }
    .listDirection(Axis.Horizontal)
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.None)
  }

  // ===== 底部加载提示：文字 +（可选）转圈 =====
  @Builder
  bottomLoadingTip() {
    Row() {
      if (this.loadingMore) {
        Text("加载更多...")
          .fontColor("#8C8C8C")
          .fontSize(12)
          .margin({ right: 8 })

        // 可选：有的版本支持 LoadingProgress()
        // 若你这行报错：直接删除这行即可，文字提示仍然存在
        LoadingProgress()
          .width(18)
          .height(18)

      } else if (!this.hasMore) {
        Text("没有更多了")
          .fontColor("#8C8C8C")
          .fontSize(12)
      } else {
        Text("上拉加载更多")
          .fontColor("#8C8C8C")
          .fontSize(12)
      }
    }
    .width("100%")
    .justifyContent(FlexAlign.Center)
    .padding({ top: 12, bottom: 16 })
  }

  build() {
    Scroll() {
      Column() {

        // ===== 查找 =====
        Stack({ alignContent: Alignment.TopStart }) {
          Row() {
            TextInput({ placeholder: '查找持仓', text: this.chazhao })
              .onClick(() => { this.isDropDownShow = true })
              .width('30%')
              .height(50)
              .border({ width: 1, color: "#595959" })
              .fontColor("#F3F3F3")
              .fontSize(12)
              .placeholderColor('#595959')
              .onChange((value: string) => { this.chazhao = value })

            Button("查找")
              .width("30%")
              .height(50)
              .fontSize(16)
              .fontColor('#fff')
              .backgroundColor('#007dff')
              .onClick(() => {
                this.isDropDownShow = false
                const httpReq = http.createHttp()
                httpReq.request('http://localhost:9999/ykcondition', {
                  method: http.RequestMethod.POST,
                  header: { "Content-Type": "application/json" },
                  extraData: JSON.stringify({
                    stockName: this.shuru_chazhao.stockName,
                    stockCode: this.shuru_chazhao.stockCode
                  })
                }).then(res => {
                  this.applyResultToHan(res.result as string)
                })
              })
              .margin({ left: 6 })
          }
          .width("100%")
          .justifyContent(FlexAlign.Start)
          .margin({ left: 20 })

          if (this.isDropDownShow) {
            Column() {
              Column() {
                TextInput({ placeholder: '股票名称', text: this.shuru_chazhao.stockName })
                  .width('100%')
                  .height(45)
                  .border({ width: 1, color: "#595959", radius: 2 })
                  .fontColor("#F3F3F3")
                  .fontSize(12)
                  .placeholderColor('#595959')
                  .padding(10)
                  .margin({ bottom: 5 })
                  .onChange((value: string) => { this.shuru_chazhao.stockName = value })

                TextInput({ placeholder: '股票代码', text: this.shuru_chazhao.stockCode })
                  .width('100%')
                  .height(45)
                  .border({ width: 1, color: "#595959", radius: 2 })
                  .fontColor("#F3F3F3")
                  .fontSize(12)
                  .placeholderColor('#595959')
                  .padding(10)
                  .margin({ bottom: 5 })
                  .onChange((value: string) => { this.shuru_chazhao.stockCode = value })
              }
              .width('30%')
              .padding(10)
              .border({ width: 1, color: "#595959", radius: 4 })
              .margin({ left: 20, top: 70 })
            }
          }
        }
        .width('100%')

        // ===== 编辑 =====
        Stack({ alignContent: Alignment.TopStart }) {
          Row() {
            TextInput({ placeholder: '编辑持仓', text: this.bianji })
              .onClick(() => { this.isDropDownShow2 = true })
              .width('30%')
              .height(50)
              .border({ width: 1, color: "#595959" })
              .fontColor("#F3F3F3")
              .fontSize(12)
              .placeholderColor('#595959')
              .onChange((value: string) => { this.bianji = value })

            Button("编辑")
              .width("30%")
              .height(50)
              .fontSize(16)
              .fontColor('#fff')
              .backgroundColor('#007dff')
              .onClick(() => {
                this.isDropDownShow2 = false
                this.isDropDownShow = false

                const httpReq = http.createHttp()
                httpReq.request('http://localhost:9999/exits', {
                  method: http.RequestMethod.POST,
                  header: { "Content-Type": "application/json" },
                  extraData: JSON.stringify({
                    stockName: this.shuru_bianji.stockName,
                    stockCode: this.shuru_bianji.stockCode,
                    holdQuantity: Number(this.shuru_bianji.stockHold)
                  })
                }).then(res => {
                  this.applyResultToHan(res.result as string)
                })
              })
              .margin({ left: 6 })
          }
          .width("100%")
          .justifyContent(FlexAlign.Start)
          .margin({ left: 20 })

          if (this.isDropDownShow2) {
            Column() {
              Column() {
                TextInput({ placeholder: '股票名称', text: this.shuru_bianji.stockName })
                  .width('100%')
                  .height(45)
                  .border({ width: 1, color: "#595959", radius: 2 })
                  .fontColor("#F3F3F3")
                  .fontSize(12)
                  .placeholderColor('#595959')
                  .padding(10)
                  .margin({ bottom: 5 })
                  .onChange((value: string) => { this.shuru_bianji.stockName = value })

                TextInput({ placeholder: '股票代码', text: this.shuru_bianji.stockCode })
                  .width('100%')
                  .height(45)
                  .border({ width: 1, color: "#595959", radius: 2 })
                  .fontColor("#F3F3F3")
                  .fontSize(12)
                  .placeholderColor('#595959')
                  .padding(10)
                  .margin({ bottom: 5 })
                  .onChange((value: string) => { this.shuru_bianji.stockCode = value })

                TextInput({ placeholder: '持仓数（数字）', text: this.shuru_bianji.stockHold })
                  .width('100%')
                  .height(45)
                  .border({ width: 1, color: "#595959", radius: 2 })
                  .fontColor("#F3F3F3")
                  .fontSize(12)
                  .placeholderColor('#595959')
                  .padding(10)
                  .onChange((value: string) => { this.shuru_bianji.stockHold = value })
              }
              .width('30%')
              .padding(10)
              .border({ width: 1, color: "#595959", radius: 4 })
              .margin({ left: 20, top: 70 })
            }
          }
        }
        .width('100%')
        .margin({ top: 10 })

        // ===== 删除 =====
        Stack({ alignContent: Alignment.TopStart }) {
          Row() {
            TextInput({ placeholder: '删除 持仓', text: this.shanchu })
              .onClick(() => { this.isDropDownShow3 = true })
              .width('30%')
              .height(50)
              .border({ width: 1, color: "#595959" })
              .margin({ top: 8 })
              .fontColor("#F3F3F3")
              .fontSize(12)
              .placeholderColor('#595959')
              .onChange((value: string) => { this.shanchu = value })

            Button("删除")
              .width("30%")
              .height(50)
              .fontSize(16)
              .fontColor('#fff')
              .backgroundColor('#007dff')
              .onClick(() => {
                this.isDropDownShow3 = false

                const httpReq = http.createHttp()
                httpReq.request('http://localhost:9999/ykdelete', {
                  method: http.RequestMethod.POST,
                  header: { "Content-Type": "application/json" },
                  extraData: JSON.stringify({
                    stockName: this.shuru_shanchu.stockName,
                    stockCode: this.shuru_shanchu.stockCode
                  })
                }).then(res => {
                  this.applyResultToHan(res.result as string)
                })
              })
              .margin({ left: 6 })
          }
          .width("100%")
          .justifyContent(FlexAlign.Start)
          .margin({ left: 20 })

          if (this.isDropDownShow3) {
            Column() {
              Column() {
                TextInput({ placeholder: '股票名称', text: this.shuru_shanchu.stockName })
                  .width('100%')
                  .height(45)
                  .border({ width: 1, color: "#595959", radius: 2 })
                  .fontColor("#F3F3F3")
                  .fontSize(12)
                  .placeholderColor('#595959')
                  .padding(10)
                  .margin({ bottom: 5 })
                  .onChange((value: string) => { this.shuru_shanchu.stockName = value })

                TextInput({ placeholder: '股票代码', text: this.shuru_shanchu.stockCode })
                  .width('100%')
                  .height(45)
                  .border({ width: 1, color: "#595959", radius: 2 })
                  .fontColor("#F3F3F3")
                  .fontSize(12)
                  .placeholderColor('#595959')
                  .padding(10)
                  .margin({ bottom: 5 })
                  .onChange((value: string) => { this.shuru_shanchu.stockCode = value })
              }
              .width('30%')
              .padding(10)
              .border({ width: 1, color: "#595959", radius: 4 })
              .margin({ left: 20, top: 70 })
            }
          }
        }
        .width('100%')
        .margin({ top: 10 })

        // ===== 表格区域 =====
        Row() {
          Column() { this.jujian1() }.layoutWeight(4)
          Column() { this.zujian_zong() }.layoutWeight(6)
        }.margin({ top: 20 })

        // ===== 底部加载提示（始终存在，加载时显示“加载更多...”）=====
        this.bottomLoadingTip()
      }
    }
    .height("100%")
    // Scroll 触底：上拉到底触发
    .onScrollEdge((side: Edge) => {
      if (side === Edge.Bottom) {
        this.loadMore()
      }
    })
  }
}
