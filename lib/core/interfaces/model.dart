abstract class IDataModel<T> {
  T? fromMap(Map<String, dynamic> obj, {bool nullInsteadOfThrowing = false});
  Map<String, dynamic> toMap(T t);
}
