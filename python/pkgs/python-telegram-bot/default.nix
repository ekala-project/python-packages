{
  lib,
  buildPythonPackage,
  cachetools,
  cffi,
  cryptography,
  fetchFromGitHub,
  hatchling,
  httpx,
  pythonAtLeast,
  setuptools,
  tornado,
}:

buildPythonPackage rec {
  pname = "python-telegram-bot";
  version = "22.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-telegram-bot";
    repo = "python-telegram-bot";
    tag = "v${version}";
    hash = "sha256-BfNERx2AuzXi7H3NR5jvaaqTQdnSALo2pf4c/Aen+ao=";
  };

  build-system = [
    setuptools
    hatchling
  ];

  dependencies = [ httpx ];

  optional-dependencies = rec {
    all = ext ++ http2 ++ passport ++ socks;
    callback-data = [ cachetools ];
    ext = callback-data ++ webhooks;
    http2 = httpx.optional-dependencies.http2;
    passport = [ cryptography ] ++ lib.optionals (pythonAtLeast "3.13") [ cffi ];
    socks = httpx.optional-dependencies.socks;
    webhooks = [ tornado ];
  };

  pythonImportsCheck = [ "telegram" ];

  meta = {
    description = "Python library to interface with the Telegram Bot API";
    homepage = "https://python-telegram-bot.org";
    license = lib.licenses.lgpl3Only;
  };
}
