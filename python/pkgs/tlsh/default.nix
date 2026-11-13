{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pkgs,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "tlsh";
  version = "5.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "trendmicro";
    repo = "tlsh";
    tag = finalAttrs.version;
    hash = "sha256-cYvXZrd+8ZC5LfucguFFNlEX8FR+AkchmCFButYoiMg=";
  };

  patches = [
    # https://github.com/trendmicro/tlsh/pull/152
    ./cmake-4-compat.patch
  ];

  postPatch = ''
    substituteInPlace py_ext/setup.py \
      --replace-fail "4.5.0" "${finalAttrs.version}"
  '';

  # cmake generates include/tlsh_version.h, which the extension needs.
  # pkgs.cmake: the python scope's cmake has no configure hook
  nativeBuildInputs = [
    pkgs.cmake
    pkgs.cmake.configurePhaseHook
  ];

  postConfigure = ''
    cd ../py_ext
  '';

  build-system = [ setuptools ];

  # no test data

  pythonImportsCheck = [ "tlsh" ];

  meta = {
    description = "Trend Micro Locality Sensitive Hash";
    homepage = "https://tlsh.org/";
    license = lib.licenses.asl20;
  };
})
