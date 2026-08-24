{ lib
, buildPythonPackage
, fetchPypi
, build
, importlib-metadata
, setuptools
, packaging
, typing-extensions
,
}:

buildPythonPackage rec {
  pname = "pkg-about";
  version = "2.4.3";
  pyproject = true;

  src = fetchPypi {
    pname = "pkg_about";
    inherit version;
    hash = "sha256-CqO4k49pEhjYKPtKC088wdT77WjEc8QH23uKBtfBR0g=";
  };

  # Unnecessarily requires the newest versions available for these
  postPatch = ''
    sed -i 's/"setuptools>=[^"]*"/"setuptools>=${setuptools.version}"/' pyproject.toml
    sed -i 's/"packaging>=[^"]*"/"packaging>=${packaging.version}"/' pyproject.toml
  '';

  build-system = [
    packaging
    setuptools
  ];

  dependencies = [
    build
    importlib-metadata
    packaging
    typing-extensions
  ];

  # Tries and fails to install itself via pip
  pythonImportsCheck = [ "pkg_about" ];

  meta = {
    description = "Python metadata sharing at runtime";
    homepage = "https://github.com/karpierz/pkg_about/";
    license = lib.licenses.zlib;
    maintainers = [ ];
  };
}
