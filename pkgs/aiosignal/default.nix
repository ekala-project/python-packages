{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  frozenlist,
  pythonOlder,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "aiosignal";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "aiosignal";
    tag = "v${version}";
    hash = "sha256-b46/LGoCeL4mhbBPAiPir7otzKKrlKcEFzn8pG/foh0=";
  };

  build-system = [ setuptools ];

  dependencies = [ frozenlist ] ++ lib.optionals (pythonOlder "3.13") [ typing-extensions ];

  postPatch = ''
    substituteInPlace setup.cfg \
      --replace "filterwarnings = error" ""
  '';

  pythonImportsCheck = [ "aiosignal" ];

  meta = {
    description = "Python list of registered asynchronous callbacks";
    homepage = "https://github.com/aio-libs/aiosignal";
    license = with lib.licenses; [ asl20 ];
  };
}
