// main index.js

import { BackHandler, NativeModules, Platform } from "react-native";

const { PrevAppHandler } = NativeModules;

export default {
  minimize: () => {
    const exitApp = Platform.select({
      ios: () => {
        PrevAppHandler.minimize();
      },
      android: () => {
        BackHandler.exitApp();
      }
    });

    return exitApp();
  }
};
