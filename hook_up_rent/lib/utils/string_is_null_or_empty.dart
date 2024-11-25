//判断字符串是否为空或者""
bool stringIsNullOrEmpty(String str) {
  if(str == null || str.trim() == '') {
    return true;
  }
  return false;
}