// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyUserModel {

 String get otp; TokenModel get token; bool get user;
/// Create a copy of VerifyUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyUserModelCopyWith<VerifyUserModel> get copyWith => _$VerifyUserModelCopyWithImpl<VerifyUserModel>(this as VerifyUserModel, _$identity);

  /// Serializes this VerifyUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyUserModel&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.token, token) || other.token == token)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,otp,token,user);

@override
String toString() {
  return 'VerifyUserModel(otp: $otp, token: $token, user: $user)';
}


}

/// @nodoc
abstract mixin class $VerifyUserModelCopyWith<$Res>  {
  factory $VerifyUserModelCopyWith(VerifyUserModel value, $Res Function(VerifyUserModel) _then) = _$VerifyUserModelCopyWithImpl;
@useResult
$Res call({
 String otp, TokenModel token, bool user
});


$TokenModelCopyWith<$Res> get token;

}
/// @nodoc
class _$VerifyUserModelCopyWithImpl<$Res>
    implements $VerifyUserModelCopyWith<$Res> {
  _$VerifyUserModelCopyWithImpl(this._self, this._then);

  final VerifyUserModel _self;
  final $Res Function(VerifyUserModel) _then;

/// Create a copy of VerifyUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otp = null,Object? token = null,Object? user = null,}) {
  return _then(_self.copyWith(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as TokenModel,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of VerifyUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenModelCopyWith<$Res> get token {
  
  return $TokenModelCopyWith<$Res>(_self.token, (value) {
    return _then(_self.copyWith(token: value));
  });
}
}


/// Adds pattern-matching-related methods to [VerifyUserModel].
extension VerifyUserModelPatterns on VerifyUserModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyUserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyUserModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifyUserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyUserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String otp,  TokenModel token,  bool user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyUserModel() when $default != null:
return $default(_that.otp,_that.token,_that.user);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String otp,  TokenModel token,  bool user)  $default,) {final _that = this;
switch (_that) {
case _VerifyUserModel():
return $default(_that.otp,_that.token,_that.user);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String otp,  TokenModel token,  bool user)?  $default,) {final _that = this;
switch (_that) {
case _VerifyUserModel() when $default != null:
return $default(_that.otp,_that.token,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyUserModel implements VerifyUserModel {
  const _VerifyUserModel({this.otp = '', this.token = const TokenModel(access: ''), this.user = false});
  factory _VerifyUserModel.fromJson(Map<String, dynamic> json) => _$VerifyUserModelFromJson(json);

@override@JsonKey() final  String otp;
@override@JsonKey() final  TokenModel token;
@override@JsonKey() final  bool user;

/// Create a copy of VerifyUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyUserModelCopyWith<_VerifyUserModel> get copyWith => __$VerifyUserModelCopyWithImpl<_VerifyUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyUserModel&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.token, token) || other.token == token)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,otp,token,user);

@override
String toString() {
  return 'VerifyUserModel(otp: $otp, token: $token, user: $user)';
}


}

/// @nodoc
abstract mixin class _$VerifyUserModelCopyWith<$Res> implements $VerifyUserModelCopyWith<$Res> {
  factory _$VerifyUserModelCopyWith(_VerifyUserModel value, $Res Function(_VerifyUserModel) _then) = __$VerifyUserModelCopyWithImpl;
@override @useResult
$Res call({
 String otp, TokenModel token, bool user
});


@override $TokenModelCopyWith<$Res> get token;

}
/// @nodoc
class __$VerifyUserModelCopyWithImpl<$Res>
    implements _$VerifyUserModelCopyWith<$Res> {
  __$VerifyUserModelCopyWithImpl(this._self, this._then);

  final _VerifyUserModel _self;
  final $Res Function(_VerifyUserModel) _then;

/// Create a copy of VerifyUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otp = null,Object? token = null,Object? user = null,}) {
  return _then(_VerifyUserModel(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as TokenModel,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of VerifyUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenModelCopyWith<$Res> get token {
  
  return $TokenModelCopyWith<$Res>(_self.token, (value) {
    return _then(_self.copyWith(token: value));
  });
}
}


/// @nodoc
mixin _$TokenModel {

 String get access;
/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenModelCopyWith<TokenModel> get copyWith => _$TokenModelCopyWithImpl<TokenModel>(this as TokenModel, _$identity);

  /// Serializes this TokenModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenModel&&(identical(other.access, access) || other.access == access));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,access);

@override
String toString() {
  return 'TokenModel(access: $access)';
}


}

/// @nodoc
abstract mixin class $TokenModelCopyWith<$Res>  {
  factory $TokenModelCopyWith(TokenModel value, $Res Function(TokenModel) _then) = _$TokenModelCopyWithImpl;
@useResult
$Res call({
 String access
});




}
/// @nodoc
class _$TokenModelCopyWithImpl<$Res>
    implements $TokenModelCopyWith<$Res> {
  _$TokenModelCopyWithImpl(this._self, this._then);

  final TokenModel _self;
  final $Res Function(TokenModel) _then;

/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? access = null,}) {
  return _then(_self.copyWith(
access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenModel].
extension TokenModelPatterns on TokenModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenModel value)  $default,){
final _that = this;
switch (_that) {
case _TokenModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenModel value)?  $default,){
final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String access)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
return $default(_that.access);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String access)  $default,) {final _that = this;
switch (_that) {
case _TokenModel():
return $default(_that.access);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String access)?  $default,) {final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
return $default(_that.access);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenModel implements TokenModel {
  const _TokenModel({this.access = ''});
  factory _TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

@override@JsonKey() final  String access;

/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenModelCopyWith<_TokenModel> get copyWith => __$TokenModelCopyWithImpl<_TokenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenModel&&(identical(other.access, access) || other.access == access));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,access);

@override
String toString() {
  return 'TokenModel(access: $access)';
}


}

/// @nodoc
abstract mixin class _$TokenModelCopyWith<$Res> implements $TokenModelCopyWith<$Res> {
  factory _$TokenModelCopyWith(_TokenModel value, $Res Function(_TokenModel) _then) = __$TokenModelCopyWithImpl;
@override @useResult
$Res call({
 String access
});




}
/// @nodoc
class __$TokenModelCopyWithImpl<$Res>
    implements _$TokenModelCopyWith<$Res> {
  __$TokenModelCopyWithImpl(this._self, this._then);

  final _TokenModel _self;
  final $Res Function(_TokenModel) _then;

/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? access = null,}) {
  return _then(_TokenModel(
access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
