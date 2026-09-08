{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  xmod,
}:

buildPythonPackage rec {
  pname = "runs";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zKMEtjHb7+xZjHv7z7UNb+rObTqWhzS2f9QtPHKPWgU=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.9.0,<0.10.0"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"'
  '';

  build-system = [ setuptools ];

  dependencies = [ xmod ];

  pythonImportsCheck = [ "runs" ];

  meta = {
    description = "Run a block of text as a subprocess";
    homepage = "https://github.com/rec/runs";
    license = lib.licenses.mit;
  };
}
