# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def ms(m)
  # return m*60000
  return m
  end

stops = Stop.create([
  {name:'Majestic Theater', address:'99江宁路', lon:'121.4516', lat:'31.2315',visit_time: ms(30),category:'Entertainment', photo3:'https://fastly.4sqi.net/img/general/width960/131516486_11s3tgdMwqYT7JTZKkU6hEbNPM1eRaKItWWNqRVtwb8.jpg', photo2:'https://ak-d.tripcdn.com/images/0105q120008h6vyufDF5C_C_760_506.jpg', photo1: 'https://ak-d.tripcdn.com/images/0106e120008h6xh84119A_C_760_506.jpg'},
  {name: 'WestGate Mall', address:'1038南京西路', lon:'121.4522', lat:'31.2309', visit_time:ms(20), category:'Shopping', photo3:'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/201907_Westgate_Mall_Shanghai.jpg/3584px-', photo2:'https://www.smartshanghai.com/uploads/repository/2020/07/31/a0d89a52-a6cd-4612-b413-a7f5e6f9366e.jpeg', photo1:'https://www.smartshanghai.com/uploads/repository/2020/07/22/5add2df3-1ab6-41fa-8ab3-5c9b96994525.jpeg'},
  {name: 'Shanghai Natural History Museum', address:'510 北京西路', lon:'121.458', lat:'31.2369', visit_time:ms(40), category:'Museum', photo3:'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Shanghai_Natural_History_Museum_%28New%29_01.JPG/2785px-Mapcarta.jpg', photo2:'https://youimg1.tripcdn.com/target/fd/tg/g2/M08/8C/43/CghzgVWw9JmAPVuAAD1jt4fxYi8104_C_760_506.jpg', photo1:'https://youimg1.tripcdn.com/target/fd/tg/g2/M07/8C/42/CghzgVWw9JWACe16ACr1itQKG6E538_C_760_506.jpg'},
  {name: 'Jing’An Sculpture Park', address:'500 北京西路', lon:'121.4589', lat:'31.2367', visit_time:ms(20), category:'Park', photo3:'https://youimg1.tripcdn.com/target/100j1f000001gps3c40E0_C_760_506.jpg', photo2:'https://youimg1.tripcdn.com/target/fd/tg/g1/M03/CE/8D/CghzflWxGKyAfOHLABL7L00f2qQ407_C_760_506.jpg', photo1:'https://youimg1.tripcdn.com/target/fd/tg/g2/M05/8E/B4/CghzgVWxGLiACIclABmdXPqG9G4643_C_760_506.jpg'},
  {name: 'Shanghai Museum', address:'201 人民大道', lon:'121.471', lat:'31.2302', visit_time:ms(45), category:'Museum', photo3:'https://amazingchinatrip.com/images/shanghaimuseum1l.jpg', photo2:'https://dimg04.c-ctrip.com/images/fd/tg/g1/M06/82/01/CghzfFWxGMaABbo_ABbMGqW5sOQ268_C_750_350.jpg', photo1:'https://dimg02.c-ctrip.com/images/100c190000016t8j9F506_Z_640_10000.jpg'},
  {name: 'Shanghai Grand Theater', address:'人民大道300号', lon:'121.4673', lat:'31.2315', visit_time:ms(40), category:'Theater', photo3:'https://youimg1.tripcdn.com/target/100g1f000001gqwv87860_C_750_500.jpg', photo2:'https://youimg1.tripcdn.com/target/fd/tg/g2/M0B/8A/BB/CghzgFWw0n6AS68yAFLoHmFvOPE851_C_760_506.jpg', photo1:'https://youimg1.tripcdn.com/target/fd/tg/g1/M01/7D/5D/CghzfFWw0nqAfciyADr_4KIo6I8076_C_760_506.jpg'},
  {name: 'Shanghai Municipal History Museum', address:'325 南京西路', lon:'121.4666', lat:'31.2326', visit_time:ms(40), category:'Museum', photo3:'https://www.globaltimes.cn/Portals/0/attachment/2011/f84b5503-36d4-451b-8e38-4173af8b6435.jpeg', photo2:'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Shanghai_Art_Museum.jpg/760px-Mapcarta.jpg', photo1:'https://www.globaltimes.cn/Portals/0/attachment/2011/0116159e-53f8-4e87-a079-862d9df06064.jpeg'},
  {name: 'People’s Park', address:'人民大道185号', lon:'121.4687', lat:'31.2339', visit_time:ms(30), category:'Park', photo1:'https://youimg1.tripcdn.com/target/100h1f000001gruggD1C5_C_760_506.jpg', photo2:'https://youimg1.tripcdn.com/target/10060f0000007go2c7DF8_C_760_506.jpg', photo3:'https://youimg1.tripcdn.com/target/01065120007679owx1A8C_C_760_506.jpg'},
  {name: 'Lyceum Theater', address:'57 茂名南路', lon:'121.456', lat:'31.2229', visit_time:ms(20), category:'Theater', photo3:'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Lyceum_Theatre%2C_Shanghai_%2820191114165625%29.jpg/3584px-Mapcarta.jpg', photo2:'https://www.globaltimes.cn/Portals/0/attachment/2020/2020-08-02/2fc646d4-655d-451d-9fe2-2b58dc46bec9.jpeg', photo1:'https://www.smartshanghai.com/uploads/covers/2020/09/159893923342741.jpeg'},
  {name: 'Shanghai Museum of Arts and Crafts', address:'79 汾阳路', lon:'121.4499', lat:'31.212', visit_time:ms(30), category:'Museum', photo3:'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/上海工艺美术博物馆.jpg/2954px-Mapcarta.jpg', photo2:'https://www.tour-beijing.com/blog/wp-content/uploads/Shanghai-Arts-and-Crafts-Museum.jpg', photo1:'https://www.tourinshanghai.com/e_Web_Editor/UploadFile/2012229183758582.jpg'},



])
