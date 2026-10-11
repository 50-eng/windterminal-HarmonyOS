import {Agu} from '../shichang_model/A_gu'
import {gangu} from '../shichang_model/gan_gu'
import {meigu} from '../shichang_model/mei_gu'
import {quanqiu} from '../shichang_model/quan_qiu'
import {shangpin} from '../shichang_model/shang_ping'
export {shichang1}

@Component
struct shichang1{
  @State head:string[]=['A股','港股','美股','全球','商品']
  @State selectedIndex:number = 0
  @Builder
  head_styel(name:string,itemIndex: number){
    Text(name)
      .fontColor(itemIndex == this.selectedIndex ? Color.White : '#C5C5C5')
      .fontWeight(itemIndex == this.selectedIndex ? FontWeight.Bold : FontWeight.Normal)
  }


  build() {
    Tabs(){
      //'A股'
      TabContent(){
        Agu()
      }
      .tabBar(this.head_styel(this.head[0],0))


      //'港股'
      TabContent(){
        gangu()
      }.tabBar(this.head_styel(this.head[1],1))

      //'美股'
      TabContent(){
        meigu()
      }.tabBar(this.head_styel(this.head[2],2))

      //'全球'
      TabContent(){
        quanqiu()
      }.tabBar(this.head_styel(this.head[3],3))

      //'商品'
      TabContent(){
        shangpin()
      }.tabBar(this.head_styel(this.head[4],4))

    }.onChange((index: number) => {
      // console.log('激活的索引', index)
      this.selectedIndex = index
    })
  }
}