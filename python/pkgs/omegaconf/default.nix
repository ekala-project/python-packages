{
  lib,
  antlr4-python3-runtime,
  buildPythonPackage,
  fetchFromGitHub,
  jdk,
  pkgs,
  pyyaml,
  replaceVars,
  setuptools_80,
}:

let
  antlr4 = pkgs.antlr4;
in
buildPythonPackage rec {
  pname = "omegaconf";
  version = "2.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "omry";
    repo = "omegaconf";
    tag = "v${version}";
    hash = "sha256-Qxa4uIiX5TAyQ5rFkizdev60S4iVAJ08ES6FpNqf8zI=";
  };

  patches = [
    (replaceVars ./antlr4.patch {
      antlr_jar = "${antlr4.out}/share/java/antlr-${antlr4.version}-complete.jar";
    })

    # https://github.com/omry/omegaconf/pull/1137
    ./0000-add-support-for-dataclasses_missing_type.patch
  ];

  postPatch = ''
    # We substitute the path to the jar with the one from our antlr4
    # package, so this file becomes unused
    rm -v build_helpers/bin/antlr*-complete.jar

    sed -i 's/antlr4-python3-runtime==.*/antlr4-python3-runtime/' requirements/base.txt
  '';

  build-system = [ setuptools_80 ];

  nativeBuildInputs = [ jdk ];

  dependencies = [
    antlr4-python3-runtime
    pyyaml
  ];

  pythonImportsCheck = [ "omegaconf" ];

  meta = {
    description = "Framework for configuring complex applications";
    homepage = "https://github.com/omry/omegaconf";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
