import 'package:almas/config/themes/data/index.dart';
import 'package:almas/config/themes/theme_config.dart';

class ThemesConst {
  static const back1 = "back1";
  static const cat = "cat";
  static const coast = "coast";
  static const darkcoast = "darkcoast";
  static const darkplain = "darkplain";
  static const eiffeltower = "eiffeltower";
  static const flower = "flower";
  static const girlmoon = "girlmoon";
  static const lonelyboy = "lonelyboy";
  static const lonelygirl = "lonelygirl";
  static const magician = "magician";
  static const minions = "minions";
  static const moon = "moon";
  static const music = "music";
  static const tower = "tower";

  static const light = "light";
  static const dark = "dark";
  static const red = "red";
  static const orange = "orange";
  static const green = "green";

  static final toMap = <String, ThemeConfig>{
    back1: Back1Theme(),
    cat: CatTheme(),
    coast: CoastTheme(),
    darkcoast: DarkCoastTheme(),
    darkplain: DarkPlainTheme(),
    eiffeltower: EiffelTowerTheme(),
    flower: FlowerTheme(),
    girlmoon: GirlMoonTheme(),
    lonelyboy: LonelyBoyTheme(),
    lonelygirl: LonelyGirlTheme(),
    magician: MagicianTheme(),
    minions: MinionsTheme(),
    moon: MoonTheme(),
    music: MusicTheme(),
    tower: TowerTheme(),
    light: LightTheme(),
    red: RedTheme(),
    orange: OrangeTheme(),
    green: GreenTheme(),
    dark: DarkTheme(),
  };
}
