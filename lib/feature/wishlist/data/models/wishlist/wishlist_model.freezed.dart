// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WishListModel {

 int get id;@JsonKey(name: 'sale_price') int get salePrice; int get mrp;@JsonKey(name: 'featured_image') String get imageUrl; String get name;@JsonKey(name: 'avg_rating') int get review;@JsonKey(name: 'in_wishlist') bool get wishlist;
/// Create a copy of WishListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishListModelCopyWith<WishListModel> get copyWith => _$WishListModelCopyWithImpl<WishListModel>(this as WishListModel, _$identity);

  /// Serializes this WishListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.salePrice, salePrice) || other.salePrice == salePrice)&&(identical(other.mrp, mrp) || other.mrp == mrp)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.review, review) || other.review == review)&&(identical(other.wishlist, wishlist) || other.wishlist == wishlist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,salePrice,mrp,imageUrl,name,review,wishlist);

@override
String toString() {
  return 'WishListModel(id: $id, salePrice: $salePrice, mrp: $mrp, imageUrl: $imageUrl, name: $name, review: $review, wishlist: $wishlist)';
}


}

/// @nodoc
abstract mixin class $WishListModelCopyWith<$Res>  {
  factory $WishListModelCopyWith(WishListModel value, $Res Function(WishListModel) _then) = _$WishListModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'sale_price') int salePrice, int mrp,@JsonKey(name: 'featured_image') String imageUrl, String name,@JsonKey(name: 'avg_rating') int review,@JsonKey(name: 'in_wishlist') bool wishlist
});




}
/// @nodoc
class _$WishListModelCopyWithImpl<$Res>
    implements $WishListModelCopyWith<$Res> {
  _$WishListModelCopyWithImpl(this._self, this._then);

  final WishListModel _self;
  final $Res Function(WishListModel) _then;

/// Create a copy of WishListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? salePrice = null,Object? mrp = null,Object? imageUrl = null,Object? name = null,Object? review = null,Object? wishlist = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,salePrice: null == salePrice ? _self.salePrice : salePrice // ignore: cast_nullable_to_non_nullable
as int,mrp: null == mrp ? _self.mrp : mrp // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as int,wishlist: null == wishlist ? _self.wishlist : wishlist // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WishListModel].
extension WishListModelPatterns on WishListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WishListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WishListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WishListModel value)  $default,){
final _that = this;
switch (_that) {
case _WishListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WishListModel value)?  $default,){
final _that = this;
switch (_that) {
case _WishListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'sale_price')  int salePrice,  int mrp, @JsonKey(name: 'featured_image')  String imageUrl,  String name, @JsonKey(name: 'avg_rating')  int review, @JsonKey(name: 'in_wishlist')  bool wishlist)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WishListModel() when $default != null:
return $default(_that.id,_that.salePrice,_that.mrp,_that.imageUrl,_that.name,_that.review,_that.wishlist);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'sale_price')  int salePrice,  int mrp, @JsonKey(name: 'featured_image')  String imageUrl,  String name, @JsonKey(name: 'avg_rating')  int review, @JsonKey(name: 'in_wishlist')  bool wishlist)  $default,) {final _that = this;
switch (_that) {
case _WishListModel():
return $default(_that.id,_that.salePrice,_that.mrp,_that.imageUrl,_that.name,_that.review,_that.wishlist);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'sale_price')  int salePrice,  int mrp, @JsonKey(name: 'featured_image')  String imageUrl,  String name, @JsonKey(name: 'avg_rating')  int review, @JsonKey(name: 'in_wishlist')  bool wishlist)?  $default,) {final _that = this;
switch (_that) {
case _WishListModel() when $default != null:
return $default(_that.id,_that.salePrice,_that.mrp,_that.imageUrl,_that.name,_that.review,_that.wishlist);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WishListModel implements WishListModel {
   _WishListModel({this.id = 0, @JsonKey(name: 'sale_price') this.salePrice = 0, this.mrp = 0, @JsonKey(name: 'featured_image') this.imageUrl = '', this.name = '', @JsonKey(name: 'avg_rating') this.review = 0, @JsonKey(name: 'in_wishlist') this.wishlist = false});
  factory _WishListModel.fromJson(Map<String, dynamic> json) => _$WishListModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey(name: 'sale_price') final  int salePrice;
@override@JsonKey() final  int mrp;
@override@JsonKey(name: 'featured_image') final  String imageUrl;
@override@JsonKey() final  String name;
@override@JsonKey(name: 'avg_rating') final  int review;
@override@JsonKey(name: 'in_wishlist') final  bool wishlist;

/// Create a copy of WishListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishListModelCopyWith<_WishListModel> get copyWith => __$WishListModelCopyWithImpl<_WishListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WishListModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.salePrice, salePrice) || other.salePrice == salePrice)&&(identical(other.mrp, mrp) || other.mrp == mrp)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.review, review) || other.review == review)&&(identical(other.wishlist, wishlist) || other.wishlist == wishlist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,salePrice,mrp,imageUrl,name,review,wishlist);

@override
String toString() {
  return 'WishListModel(id: $id, salePrice: $salePrice, mrp: $mrp, imageUrl: $imageUrl, name: $name, review: $review, wishlist: $wishlist)';
}


}

/// @nodoc
abstract mixin class _$WishListModelCopyWith<$Res> implements $WishListModelCopyWith<$Res> {
  factory _$WishListModelCopyWith(_WishListModel value, $Res Function(_WishListModel) _then) = __$WishListModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'sale_price') int salePrice, int mrp,@JsonKey(name: 'featured_image') String imageUrl, String name,@JsonKey(name: 'avg_rating') int review,@JsonKey(name: 'in_wishlist') bool wishlist
});




}
/// @nodoc
class __$WishListModelCopyWithImpl<$Res>
    implements _$WishListModelCopyWith<$Res> {
  __$WishListModelCopyWithImpl(this._self, this._then);

  final _WishListModel _self;
  final $Res Function(_WishListModel) _then;

/// Create a copy of WishListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? salePrice = null,Object? mrp = null,Object? imageUrl = null,Object? name = null,Object? review = null,Object? wishlist = null,}) {
  return _then(_WishListModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,salePrice: null == salePrice ? _self.salePrice : salePrice // ignore: cast_nullable_to_non_nullable
as int,mrp: null == mrp ? _self.mrp : mrp // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as int,wishlist: null == wishlist ? _self.wishlist : wishlist // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
