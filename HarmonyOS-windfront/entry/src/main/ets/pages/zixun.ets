import {yaoweng} from '../zixun_model/yaowen'
import {tuijiang} from '../zixun_model/tuijian'
import {ai_jian} from '../zixun_model/Ai_jian'
@Preview
@Component
export struct zixun{
  @State head:string[]=['要闻','推荐','AI简报']
  @State selectedIndex:number = 0
  @Builder
  head_styel(name:string,itemIndex: number){
    Text(name)
      .fontColor(itemIndex == this.selectedIndex ? Color.White : '#C5C5C5')
      .fontWeight(itemIndex == this.selectedIndex ? FontWeight.Bold : FontWeight.Normal)
  }


  build() {
    Tabs(){
      //'要闻'
      TabContent(){
        yaoweng()
      }.tabBar(this.head_styel(this.head[0],0))

      //'推荐'
      TabContent(){
        tuijiang()
      }.tabBar(this.head_styel(this.head[1],1))

      //'AI简报'
      TabContent(){
        ai_jian()
      }.tabBar(this.head_styel(this.head[2],2))
      
    }.onChange((index: number) => {
      // console.log('激活的索引', index)
      this.selectedIndex = index
    })
  }
}