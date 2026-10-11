interface annamil{
  name:string
  age:number
  pr():void
}
class b implements  annamil{
  name:string
  age:number
  constructor(name:string,age:number) {
    this.name = name
    this.age =age
  }
  pr():void{
    console.log("实现父类")
  }
}
let gou:b = new b("小狗",12)
console.log("a"+gou.pr())

interface Ilenth{
  length:number
}
function fn<T extends Ilenth>(arr:T){
  console.log(""+arr.length)
}
fn<string>("qqq")
// console.log(""+fn<number>(2))