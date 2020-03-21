import 'package:groovin_material_icons/groovin_material_icons.dart';

var chipList = [
  {
    'icon': GroovinMaterialIcons.language_javascript,
    'chipName': 'javascript'
  },
  {
    'icon': GroovinMaterialIcons.language_html5,
    'chipName': 'html5'
  },
  {
    'icon': GroovinMaterialIcons.language_css3,
    'chipName': 'css'
  },
  {
    'icon': GroovinMaterialIcons.language_c,
    'chipName': 'c'
  },
  {
    'icon': GroovinMaterialIcons.language_cpp,
    'chipName': 'c++'
  },
  {
    'icon': GroovinMaterialIcons.language_python,
    'chipName': 'python'
  },
  {
    'icon': GroovinMaterialIcons.language_csharp,
    'chipName': 'csharp'
  },
  {
    'icon': GroovinMaterialIcons.language_swift,
    'chipName': 'swift'
  },
];

chipToIcon(int i) {
  return chipList[i]['icon'];
}

chipToName(int i) {
  return '${chipList[i]['chipName']}';
}