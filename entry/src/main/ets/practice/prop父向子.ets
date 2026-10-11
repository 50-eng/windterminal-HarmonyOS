@Component
struct pr{
  @Prop num:number = 1
  name:string = ''
  change_jia=()=>{}
  change_jian=()=>{}
  build() {
    Row(){
      Text(this.name)
      Button("+").onClick(this.change_jia)
      Text(this.num.toString())
      Button("-").onClick(this.change_jian)
    }
  }
}

//达到子传夫效果
@Preview//样式预览
@Component
struct Index {
  @State Num1:number = 3
  @State Num2:number = 8

  build() {

    Column(){
      pr({name:"苹果",num:this.Num1,
        change_jia:()=>{this.Num1++},
        change_jian: ()=>{this.Num1--}
      })
      pr({name:'芒果',num:this.Num2,
        change_jia:()=>{this.Num2++},
        change_jian: ()=>{this.Num2--}
      })
      Button("按钮").onClick(()=>{
        this.Num1++
        this.Num2++
      })
    }
  }
}