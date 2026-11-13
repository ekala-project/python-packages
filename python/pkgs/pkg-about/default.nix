{
  lib,
  buildPythonPackage,
  fetchPypi,
  build,
  importlib-metadata,
  setuptools,
  packaging,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "pkg-about";
  version = "2.5.1";
  pyproject = true;

  src = fetchPypi {
    pname = "pkg_about";
    inherit (finalAttrs) version;
    hash = "sha256-TvtV6p2+F2vWMdaIRJMHm8rPske1hXaP1haEG5ufLBA=";
  };

  # Unnecessarily requires the newest versions available for these
  postPatch = ''
    sed -i 's/"setuptools>=[^"]*"/"setuptools>=${setuptools.version}"/' pyproject.toml
    sed -i 's/"packaging>=[^"]*"/"packaging>=${packaging.version}"/' pyproject.toml
    sed -i 's/"build>=[^"]*"/"build>=${build.version}"/' pyproject.toml
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
  };
})
