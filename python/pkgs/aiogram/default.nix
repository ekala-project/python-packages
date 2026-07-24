{
  lib,
  aiodns,
  aiofiles,
  aiohttp-socks,
  aiohttp,
  babel,
  buildPythonPackage,
  certifi,
  cryptography,
  fetchFromGitHub,
  gitUpdater,
  hatchling,
  magic-filter,
  motor,
  pydantic,
  pymongo,
  redis,
  uvloop,
}:

buildPythonPackage rec {
  pname = "aiogram";
  version = "3.30.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aiogram";
    repo = "aiogram";
    tag = "v${version}";
    hash = "sha256-Htj38Qw2G0GR2+pPCrlUgbywRJvYg1wQyNFdxY9SJQI=";
  };

  build-system = [ hatchling ];

  pythonRelaxDeps = [ "aiohttp" ];

  dependencies = [
    aiofiles
    aiohttp
    certifi
    magic-filter
    pydantic
  ];

  optional-dependencies = {
    fast = [
      aiodns
      uvloop
    ];
    mongo = [
      motor
      pymongo
    ];
    redis = [ redis ];
    proxy = [ aiohttp-socks ];
    i18n = [ babel ];
    signature = [ cryptography ];
  };
  pythonImportsCheck = [ "aiogram" ];

  passthru.updateScript = gitUpdater {
    rev-prefix = "v";
    ignoredVersions = "4.1";
  };
  meta = {
    description = "Modern and fully asynchronous framework for Telegram Bot API";
    homepage = "https://github.com/aiogram/aiogram";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
