List musicNames = [];

musicUrl(int i) {
  return "https://music123.s3.ap-south-1.amazonaws.com/${musicNames[i]}";
}
