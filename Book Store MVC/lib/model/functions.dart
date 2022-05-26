class Functions {
 static String fixImage(String strImage) {
    String str = 'udemy/';
    String newString = strImage.replaceAll(str, '');
    return newString;
  }
}
