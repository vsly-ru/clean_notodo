// a failure base representation
// could be extended with a source, data, arguments, stackTrace, etc.

abstract class Failure {
  // any meaningful message
  final String message;
  // unique in-app failure code (not external error codes like 404)
  // to quickly locate a specific place in the source code
  final String code;

  const Failure(this.message, this.code);
}
