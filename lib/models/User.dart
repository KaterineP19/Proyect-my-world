class User {

  var _uid;
  var _nombre;
  var _correo;
  var _contrasena;

  User(this._uid, this._nombre, this._correo, this._contrasena);

  User.Empty();

  Map <String,dynamic> toJson() => {
    "id" : _uid,
    "nombre" : _nombre,
    "correo" : _correo,
    "contraseña" : _contrasena,
  };

  User.fromJson(Map <String, dynamic> json)
      : _uid = json ["id"],
        _nombre = json["nombre"],
        _correo = json["correo"],
        _contrasena = json["contraseña"];

  get uid => _uid;
  set uid(value) {
    _uid = value;
  }

  get nombre => _nombre;
  set nombre(value) {
    _nombre = value;
  }

  get correo => _correo;
  set correo(value) {
    _correo = value;
  }

  get contrasena => _contrasena;
  set contrasena(value) {
    _contrasena = value;
  }
}