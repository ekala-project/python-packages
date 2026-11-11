{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  backports-zstd,
  brotli,
  flask,
}:

buildPythonPackage (finalAttrs: {
  pname = "flask-compress";
  version = "1.26";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_compress";
    inherit (finalAttrs) version;
    hash = "sha256-vVKZUE5WTqwnOVGBGhwWHYk/XVG4ciBm/O8bTaVWdJ8=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    brotli
    flask
  ]
  ++ lib.optionals (pythonOlder "3.14") [
    backports-zstd
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools_scm[toml]<8" "setuptools_scm"
  '';

  pythonImportsCheck = [ "flask_compress" ];

  meta = {
    description = "Compress responses in your Flask app with gzip, deflate or brotli";
    homepage = "https://github.com/colour-science/flask-compress";
    license = lib.licenses.mit;
  };
})
