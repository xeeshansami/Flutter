    void main() {
      print("starts");
      futureMethods();
      print("ends");
    }

    void asyncMethods() async {
      String fileContent = await downlaodData();
      print(fileContent);
    }

    void futureMethods() {
      Future<String> fileContent = downlaodData();
      fileContent.then((value) => {
      print(value)
      });
    }

    Future<String> downlaodData() {
      Future<String> string = Future.delayed(const Duration(seconds: 6), () {
        return "this is my secret file";
      });
      return string;
    }
