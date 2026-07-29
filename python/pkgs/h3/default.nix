{
  autoPatchelfHook,
  buildPythonPackage,
  cmake,
  cython,
  fetchFromGitHub,
  lib,
  ninja,
  numpy,
  pkgs,
  scikit-build-core,
  stdenv,
}:

let
  h3 = pkgs.h3;
in
buildPythonPackage (finalAttrs: {
  pname = "h3";
  version = "4.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "uber";
    repo = "h3-py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-+2cf/m+8BEEjNgIyuYmLDD7wsmc3Bg8QXaIjC0Px+Qk=";
  };

  dontConfigure = true;

  build-system = [
    scikit-build-core
    cmake
    cython
    ninja
  ]
  ++ lib.optionals stdenv.hostPlatform.isLinux [
    autoPatchelfHook
  ];

  buildInputs = lib.optionals stdenv.hostPlatform.isLinux [ h3 ];

  dependencies = [ numpy ];

  prePatch =
    let
      cmakeCommands = ''
        include_directories(${lib.getDev h3}/include/h3)
        link_directories(${h3}/lib)
      '';
    in
    ''
      rm -r src/h3lib
      substituteInPlace CMakeLists.txt \
        --replace-fail "add_subdirectory(src/h3lib)" "${cmakeCommands}" \
        --replace-fail "\''${CMAKE_CURRENT_BINARY_DIR}/src/h3lib/src/h3lib/include/h3api.h" "${lib.getDev h3}/include/h3/h3api.h"
    '';

  pythonImportsCheck = [ "h3" ];

  meta = {
    homepage = "https://github.com/uber/h3-py";
    description = "Hierarchical hexagonal geospatial indexing system";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
