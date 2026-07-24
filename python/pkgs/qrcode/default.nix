{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,

  # optional-dependencies
  pillow,
}:

buildPythonPackage rec {
  pname = "qrcode";
  version = "8.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lincolnloop";
    repo = "python-qrcode";
    tag = "v${version}";
    hash = "sha256-qLIYUFnBJQGidnfC0bQAkO/aUmT94uXFMeMhnUgUnfQ=";
  };

  build-system = [ poetry-core ];

  optional-dependencies = {
    pil = [ pillow ];
  };

  pythonImportsCheck = [ "qrcode" ];

  meta = {
    description = "Python QR Code image generator";
    mainProgram = "qr";
    homepage = "https://github.com/lincolnloop/python-qrcode";
    license = lib.licenses.bsd3;
  };
}
