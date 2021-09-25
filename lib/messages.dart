import 'package:get/get.dart';

var _pangu = _Pangu().spacingText;

extension PanGu on String {
  String get tr {
    return _pangu(Trans(this).tr);
  }
}

class _Pangu {
  final RegExp _cjkQuote = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])(["])');

  final RegExp _quoteCJK = RegExp(
      '(["])([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  final RegExp _fixQuote = RegExp("([\"']+)(s*)(.+?)(s*)([\"']+)");

  final RegExp _fixSingleQuote = RegExp(
      "([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])( )(')([A-Za-z])");

  final RegExp _hashANSCJKhash = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])(#)([A-Za-z0-9\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff]+)(#)([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  final RegExp _cjkHash = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])(#([^ ]))');

  final RegExp _hashCJK = RegExp(
      '(([^ ])#)([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  final RegExp _cjkOperatorANS = RegExp(
      r'([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([\+\-\*\/=&\\|<>])([A-Za-z0-9])');

  final RegExp _ansOperatorCJK = RegExp(
      r'([A-Za-z0-9])([\+\-\*\/=&\\|<>])([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  final RegExp _cjkBracketCJK = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([([{<\u201c]+(.*?)[)]}>\u201d]+)([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  final RegExp _cjkBracket = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([([{<\u201c>])');

  final RegExp _bracketCJK = RegExp(
      '([)]}>\u201d<])([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  final RegExp _fixBracket =
      RegExp('([([{<\u201c]+)(s*)(.+?)(s*)([)]}>\u201d]+)');

  final RegExp _fixSymbol = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([~!;:,.?\u2026])([A-Za-z0-9])');

  final RegExp _cjkANS = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([A-Za-z0-9`\$%^&*-=+\\|/@\u00a1-\u00ff\u2022\u2027\u2150-\u218f])');

  final RegExp _ansCJK = RegExp(
      '([A-Za-z0-9`~\$%^&*-=+\\|/!;:,.?\u00a1-\u00ff\u2022\u2026\u2027\u2150-\u218f])([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  String spacingText(String text) {
    String newText = text;

    newText =
        newText.replaceAllMapped(_cjkQuote, (Match m) => "${m[1]} ${m[2]}");

    newText =
        newText.replaceAllMapped(_quoteCJK, (Match m) => "${m[1]} ${m[2]}");

    newText = newText.replaceAllMapped(
        _fixQuote, (Match m) => "${m[1]}${m[3]}${m[5]}");

    newText = newText.replaceAllMapped(
        _fixSingleQuote, (Match m) => "${m[1]}${m[3]}${m[4]}");

    newText = newText.replaceAllMapped(
        _hashANSCJKhash, (Match m) => "${m[1]} ${m[2]}${m[3]}${m[4]} ${m[5]}");

    newText =
        newText.replaceAllMapped(_cjkHash, (Match m) => "${m[1]} ${m[2]}");

    newText =
        newText.replaceAllMapped(_hashCJK, (Match m) => "${m[1]} ${m[3]}");

    newText = newText.replaceAllMapped(
        _cjkOperatorANS, (Match m) => "${m[1]} ${m[2]} ${m[3]}");

    newText = newText.replaceAllMapped(
        _ansOperatorCJK, (Match m) => "${m[1]} ${m[2]} ${m[3]}");

    String oldText = newText;
    String tmpText = newText.replaceAllMapped(
        _cjkBracketCJK, (Match m) => "${m[1]} ${m[2]} ${m[4]}");

    newText = tmpText;
    if (oldText == tmpText) {
      newText =
          newText.replaceAllMapped(_cjkBracket, (Match m) => "${m[1]} ${m[2]}");

      newText =
          newText.replaceAllMapped(_bracketCJK, (Match m) => "${m[1]} ${m[2]}");
    }
    newText = newText.replaceFirstMapped(
        _fixBracket, (Match m) => "${m[1]}${m[3]}${m[5]}");

    newText = newText.replaceAllMapped(
        _fixSymbol, (Match m) => "${m[1]}${m[2]} ${m[3]}");

    newText = newText.replaceAllMapped(_cjkANS, (Match m) => "${m[1]} ${m[2]}");

    newText = newText.replaceAllMapped(_ansCJK, (Match m) => "${m[1]} ${m[2]}");

    return newText;
  }
}