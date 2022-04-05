/// Обертка над данными с 3мя состояними:
/// - контент
/// - загрузка
/// - ошибка
class EntityState<T> {
  final T? data;
  final bool loading;
  final bool hasError;

  EntityState({
    this.data,
    this.loading = false,
    this.hasError = false,
  });

  factory EntityState.data(T data) => EntityState(data: data);

  factory EntityState.loading({T? data}) => EntityState(data: data, loading: true);

  factory EntityState.error({T? data}) => EntityState(data: data, hasError: true);
}
