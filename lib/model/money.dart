class Money{
  String? image;
  String? name;
  String? time;
  String? fee;
  bool buy=true;
}

List<Money> getData(){
  Money food=Money();
  food.name="Food";
  food.fee="650";
  food.time="today";
  food.image="food.png";
  food.buy=false;
  Money education=Money();
  education.name="Education";
  education.fee="1650";
  education.time="Jan 30, 2022";
  education.image="education.png";
  food.buy=false;
  Money transport=Money();
  transport.name="Transportation";
  transport.fee="350";
  transport.time="Sep 19, 2022";
  transport.image="transportation.png";
  transport.buy=false;
  Money transfer=Money();
  transfer.name="Money Transfer";
  transfer.fee="950";
  transfer.time="Jun 20, 2022";
  transfer.image="transfer.png";
  transfer.buy=true;
  return [food,education,transport,transfer];
}