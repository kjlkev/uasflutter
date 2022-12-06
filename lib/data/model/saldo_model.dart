class SaldoModel {
  int? id;
  int? saldo;

  SaldoModel({
    this.id,
    this.saldo,
  });

  SaldoModel copyWith({
    int? id,
    int? saldo,
  }) {
    return SaldoModel(
      id: id ?? this.id,
      saldo: saldo ?? this.saldo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'saldo': saldo,
    };
  }

  factory SaldoModel.fromMap(Map<String, dynamic> map) {
    return SaldoModel(
      id: map['id'],
      saldo: map['saldo'],
    );
  }
}
