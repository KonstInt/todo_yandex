class NoInternetErrorException implements MyExceptions {
  @override
  String errorMessage() {
    return "No Internet connection!";
  }
}

class RemoteUnsynchronizedErrorException implements MyExceptions {
  @override
  String errorMessage() {
    return "Unsynchronized version of list!";
  }
}

class RemoteInvalidServerInputErrorException implements MyExceptions {
  @override
  String errorMessage() {
    return "Invalid server input!";
  }
}

class RemotePageNotExistErrorException implements MyExceptions {
  @override
  String errorMessage() {
    return "Page not exist! 404";
  }
}

class DatabaseErrorException implements MyExceptions {
  @override
  String errorMessage() {
    return "Database error!";
  }
}

abstract class MyExceptions implements Exception {
  String errorMessage();
}
