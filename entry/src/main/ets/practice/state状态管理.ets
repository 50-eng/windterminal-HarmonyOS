import num from '../model/鸿蒙_index';
import myNum from '../model/鸿蒙_index'
// //'../'是上一级目录查找
// //'./'是同一级目录查找
// console.log(""+num)
// console.log(""+myNum)
import {mymian} from './mymian'
// @Component
// struct mymian{
//   @State biao:string =''
//   @State num:number = 0
//   build() {
//     Column(){
//       Text(this.biao)
//       Row(){
//         Text(this.num.toString())
//         Button('按钮')
//           .onClick(()=>{
//             this.num = this.num+1
//             console.log(''+this.num)
//           })
//       }
//     }.margin({bottom:20})
//   }
// }

@Component
struct Index {
  @State message: string = 'Hello World';
  @State shu:number[][]=[[1,2,3],[1,2]]

  build() {
    // Column(){
    //   mymian({
    //     biao:'我的',
    //     num:21
    //   })
    //   mymian({
    //     biao:'梓渝',
    //     num:23
    //   })
    // }
    Column(){
      Text(JSON.stringify(this.shu))
      Button("按钮")
        .onClick(()=>{
          this.shu[0]=[3,2,3]
          console.log(''+Object.keys(this.shu))
        })

    }
  }
}