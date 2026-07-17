{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  backports-zstd,
  brotli,
  flask,
}:

buildPythonPackage rec {
  pname = "flask-compress";
  version = "1.24";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_compress";
    inherit version;
    hash = "sha256-FAl87+Weyz5GbVKmrrYvNPElqffa3x8zpT5DDOSlDzE=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    backports-zstd
    brotli
    flask
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools_scm[toml]<8" "setuptools_scm"
  '';

  doCheck = false;

  pythonImportsCheck = [ "flask_compress" ];

  meta = {
    description = "Compress responses in your Flask app with gzip, deflate or brotli";
    homepage = "https://github.com/colour-science/flask-compress";
    license = lib.licenses.mit;
  };
}
