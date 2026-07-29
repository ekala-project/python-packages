{
  lib,
  stdenv,
  fetchurl,
  jdk,
}:

stdenv.mkDerivation rec {
  pname = "antlr";
  version = "4.13.2";

  src = fetchurl {
    url = "https://www.antlr.org/download/antlr-${version}-complete.jar";
    sha256 = "sha256-6uLfoRmmQydERnKv9j6ew1ogGA3FuAkLemq4USXfTXY=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p "$out"/{share/java,bin}
    ln -s "$src" "$out/share/java/antlr-${version}-complete.jar"

    echo "#! ${stdenv.shell}" >> "$out/bin/antlr"
    echo "'${jdk}/bin/java' -cp '$out/share/java/antlr-${version}-complete.jar:$CLASSPATH' -Xmx500M org.antlr.v4.Tool \"\$@\"" >> "$out/bin/antlr"

    echo "#! ${stdenv.shell}" >> "$out/bin/antlr-parse"
    echo "'${jdk}/bin/java' -cp '$out/share/java/antlr-${version}-complete.jar:$CLASSPATH' -Xmx500M org.antlr.v4.gui.Interpreter \"\$@\"" >> "$out/bin/antlr-parse"

    echo "#! ${stdenv.shell}" >> "$out/bin/grun"
    echo "'${jdk}/bin/java' -cp '$out/share/java/antlr-${version}-complete.jar:$CLASSPATH' org.antlr.v4.gui.TestRig \"\$@\"" >> "$out/bin/grun"

    chmod a+x "$out/bin/antlr" "$out/bin/antlr-parse" "$out/bin/grun"
    ln -s "$out/bin/antlr"{,4}
    ln -s "$out/bin/antlr"{,4}-parse
  '';

  passthru = {
    jarLocation = src;
  };

  meta = {
    description = "Powerful parser generator";
    homepage = "https://www.antlr.org/";
    sourceProvenance = with lib.sourceTypes; [ binaryBytecode ];
    license = lib.licenses.bsd3;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
}
